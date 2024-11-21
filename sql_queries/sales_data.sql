CREATE TABLE sales_data (
    order_no INT,
    region VARCHAR(50),
    user VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    order_date VARCHAR(50) ,
    product VARCHAR(50),
    sale_value DECIMAL(10, 2),
    time_spent_on_call TIME
);



INSERT INTO sales_data (order_no, region, user, city, state, order_date, product, sale_value, time_spent_on_call)
SELECT order_no,region,user,city,state,
    CASE 
        WHEN order_date LIKE '%/%' THEN STR_TO_DATE(order_date, '%m/%d/%Y')  
        ELSE STR_TO_DATE(order_date, '%Y-%m-%d')  
    END AS order_date,
    product,
    sale_value,
    time_spent_on_call
FROM temp_data;

