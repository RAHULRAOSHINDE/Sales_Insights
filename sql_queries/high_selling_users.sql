--Create a table that shows Users that have sold more than 7 distinct products for a particular region


CREATE TABLE high_selling_users AS
SELECT user,region,COUNT(DISTINCT product) AS distinct_products_sold
FROM sales_data
WHERE product IS NOT NULL  
GROUP BY user, region
HAVING COUNT(DISTINCT product) > 7;
