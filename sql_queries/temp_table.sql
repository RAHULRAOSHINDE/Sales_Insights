
CREATE DATABASE sales;

USE sales;

CREATE TABLE temp_data (
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
