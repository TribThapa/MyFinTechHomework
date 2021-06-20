-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS sales;

-- CREATE TABLE
CREATE TABLE sales (sales_id SERIAL PRIMARY KEY,
					payment_id SERIAL,
					mortgage_id	INT,
					loan_amount BIGINT,
					loan_date DATE);

--CHECK CREATED TABLE
SELECT * FROM sales;

-- Load in csv file
COPY sales
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\08-Stu_CRUD\Resources\sales.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM sales;