
UPDATE temp_data
SET order_date = NULL
WHERE NOT order_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$';


UPDATE sales_data
SET region= "Unknown"
WHERE region = "#VALUE!";