

--To find which are the top two performing regions and  bottom two performing regions (By sale value).

CREATE TEMPORARY TABLE region_sales_summary AS
SELECT region,SUM(sale_value) AS total_sales_value
FROM sales_data
GROUP BY region
ORDER BY total_sales_value DESC;



CREATE TABLE region_summary AS
WITH ranked_regions AS (
    SELECT region,total_sales_value,
        ROW_NUMBER() OVER (ORDER BY total_sales_value DESC) AS rank_desc,
        ROW_NUMBER() OVER (ORDER BY total_sales_value ASC) AS rank_asc
    FROM region_sales_summary
)
SELECT region,total_sales_value,
    CASE
        WHEN rank_desc <= 2 THEN 'Top Performing Region'
        WHEN rank_asc <= 2 THEN 'Low Performing Region'
        ELSE 'Mid Tier'
    END AS performance_status
FROM ranked_regions
WHERE rank_desc <= 2 OR rank_asc <= 2;


select*from region_summary
INTO OUTFILE '/root/Desktop/sales/Output/region_sales_performance.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';