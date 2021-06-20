--DROP TABLES
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS payment;

--CREATE CUSTOMER TABLE
CREATE TABLE customer(customer_id INT PRIMARY KEY,
					  store_id INT,
					  first_name VARCHAR(50),
					  last_name	VARCHAR(50),
					  email VARCHAR (50),
					  address_id INT,
					  activebool BOOLEAN,
					  create_date DATE,
					  last_update DATE,
					  active BOOLEAN);
COPY customer
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\09-Stu_View_Room_Queries\Resources\customer.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM customer;

-- CREATE PAYMENT TABLE
CREATE TABLE payment(payment_id	INT PRIMARY KEY,
					 customer_id INT,
					 staff_id INT, 
					 rental_id INT,
					 amount FLOAT, 
					 payment_date DATE);
COPY payment
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\09-Stu_View_Room_Queries\Resources\payment.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM payment;

