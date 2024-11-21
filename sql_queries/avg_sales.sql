
--Table that compares average sales per user 
--Comparison between two date ranges 1st to 10th and 11th to 20th

CREATE TABLE average_sales_comparison AS
SELECT user,ROUND(AVG(CASE 
                          WHEN DAY(order_date) BETWEEN 1 AND 10 THEN sale_value 
                          ELSE NULL
                    END), 2) AS avg_sales_1_to_10,
             ROUND(AVG(CASE 
                          WHEN DAY(order_date) BETWEEN 11 AND 20 THEN sale_value
                          ELSE NULL
                    END), 2) AS avg_sales_11_to_20
FROM sales_data
GROUP BY user;

