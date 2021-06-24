DROP TABLE IF EXISTS sales;

-- Create a table `sales` and define the correct column names and data types according to the `sales.csv`.
CREATE TABLE sales(sales_id	INT PRIMARY KEY,
				   payment_id INT,
				   mortgage_id INT, 
				   loan_amount INT,
				   loan_date DATE);			   
COPY sales
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\08-Stu_CRUD\Resources\sales.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM sales;

-- Create a query to return the sales records with loan amounts less than $300,000.
SELECT * FROM sales
WHERE sales.loan_amount < 300000;

-- Create a query to find the [average](https://www.w3schools.com/sql/sql_count_avg_sum.asp) loan amount of all the sales records.
SELECT ROUND(AVG(loan_amount),2) FROM sales;

-- Update the loan amount for sales_id 33 to $423,212.
UPDATE sales
SET loan_amount=423212 WHERE sales_id=33;
SELECT * FROM sales;

-- Add a new boolean column `loan_distributed` that defaults to True.
ALTER TABLE sales
ADD load_distributed BOOLEAN
DEFAULT 'TRUE';
SELECT * FROM sales;

-- Insert a new record into the sales table where the sales_id is 101, the payment_id is 101, the mortgage_id is 2, the loan_amount is $734,544, and the loan_date is `1995-10-05`.
INSERT INTO sales (sales_id, payment_id, mortgage_id, loan_amount, loan_date)
VALUES 
(101, 101, 2, 734544, '1995-10-05');
SELECT * FROM sales;

-- Delete the sales record where sales_id is 72.
DELETE FROM sales
WHERE sales_id=72;
SELECT * FROM sales;






				   
				   