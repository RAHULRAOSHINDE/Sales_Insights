LOAD DATA LOCAL INFILE '/root/Desktop/sales/raw_data.csv'
INTO TABLE temp_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
