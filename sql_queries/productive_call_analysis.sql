
-- Identify the productive calls. Where Sale value is > 0. 
--For these productive calls, Create a table that shows 
--1. total time spent on call by user , 
--2. total sales value of products sold by that user, and 
--3. average sale value per hour of call.

CREATE TABLE time_spent_on_call AS
SELECT user,
    ROUND(SUM(TIME_TO_SEC(time_spent_on_call)) / 3600, 2) AS total_time_spent_hours,
    SUM(sale_value) AS total_sales_value,
    ROUND(SUM(sale_value) / (SUM(TIME_TO_SEC(time_spent_on_call)) / 3600), 2) AS avg_sales_value_per_hour
FROM sales_data
WHERE sale_value > 0
GROUP BY user;
