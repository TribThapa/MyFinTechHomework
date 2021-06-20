SELECT * FROM sales;

--Create a query to return the sales records with loan amounts less than $300,000
SELECT * FROM sales
WHERE loan_amount<300000;

--Create a query to find the average loan amount of all the sales records
SELECT AVG(loan_amount)
FROM sales;

--Update the loan amount for sales_id 33 to $423,212.
SELECT * FROM sales
WHERE sales_id=33;

UPDATE sales
SET loan_amount=423212
WHERE sales_id=33;

SELECT*FROM sales
WHERE sales_id=33;

--Add a new boolean column `loan_distributed` that defaults to True.
/*ALTER TABLE sales
ADD loan_distributed BOOLEAN
DEFAULT TRUE;*/

--Insert a new record into the sales table where the sales_id is 101, the payment_id is 101, the mortgage_id is 2, the loan_amount is $734,544, and the loan_date is `1995-10-05`.
/*INSERT INTO sales (sales_id, payment_id, mortgage_id, loan_amount, loan_date, loan_distributed)
VALUES (101, 101, 2, 734544, '1995-10-05', 'TRUE');*/

SELECT * FROM sales
WHERE sales_id=101;

--Delete the sales record where sales_id is 72.
DELETE FROM sales
WHERE sales_id=72;

SELECT*FROM sales;
