DROP TABLE IF EXISTS customer;

-- Create a new table in the `customer_db` database called `customer`.
CREATE TABLE customer(customer_id INT PRIMARY KEY,
					  first_name VARCHAR(30) NOT NULL,
					  last_name	VARCHAR(30),
					  gender VARCHAR(30),
					  age INT,
					  address VARCHAR(100),
					  city VARCHAR(30),
					  state	CHAR(2),
					  zip_code CHAR(5));
					  
COPY customer
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\07-Stu_Customer_Demographics\Resources\customer.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM customer;
					  
					  
-- Create a query to return all female customers.
SELECT * FROM customer
WHERE customer.gender='Female';

-- Create a query to return all male customers from New Jersey.
SELECT * FROM customer 
WHERE customer.gender='Male' AND customer.state='NJ';

-- Create a query to return all male customers from New Jersey or Ohio.
SELECT * FROM customer 
WHERE customer.gender='Male' AND customer.state='NJ' OR customer.state='OH';

--Create a query to return all female customers from Maryland who are less than 30 years old.
SELECT * FROM customer 
WHERE customer.gender='Female' AND customer.state='MD' AND customer.age<30;









