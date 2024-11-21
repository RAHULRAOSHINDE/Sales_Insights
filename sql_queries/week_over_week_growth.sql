

--Table that shows week over week growth %ge by region
        

CREATE TABLE week_over_week_growth AS
SELECT current_sales.region AS region, current_sales.year,current_sales.week AS current_week,current_sales.total_sales AS current_week_sales,
       previous_sales.total_sales AS previous_week_sales,
       CASE 
           WHEN previous_sales.total_sales IS NULL OR previous_sales.total_sales = 0 THEN 0
           ELSE ROUND((current_sales.total_sales - previous_sales.total_sales) / previous_sales.total_sales * 100, 2)
       END AS growth_percentage
FROM
    (
        SELECT region,YEAR(order_date) AS year,WEEK(order_date) AS week,SUM(sale_value) AS total_sales
        FROM sales_data
        GROUP BY region, YEAR(order_date), WEEK(order_date)
    ) AS current_sales
LEFT JOIN
    (
        SELECT region,YEAR(order_date) AS year,WEEK(order_date) AS week,SUM(sale_value) AS total_sales
        FROM sales_data
        GROUP BY region, YEAR(order_date), WEEK(order_date)
    ) AS previous_sales
ON 
    current_sales.region = previous_sales.region 
    AND current_sales.year = previous_sales.year
    AND current_sales.week = previous_sales.week + 1
ORDER BY 
    current_sales.region, current_sales.year, current_sales.week;
