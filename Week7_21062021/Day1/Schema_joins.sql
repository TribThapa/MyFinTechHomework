DROP TABLE IF EXISTS banks;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS payments;

--CREATE BANKS TABLE
CREATE TABLE banks(bank_id BIGINT,
				   bank_name VARCHAR(50),
				   bank_routing_number BIGINT);	

COPY banks 
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\10-Stu_Joins\Resources\banks.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM banks;

--CREATE CUSTOMER TABLE
CREATE TABLE customer(customer_id INT,
					  first_name VARCHAR(50),
					  last_name VARCHAR(50),
					  gender VARCHAR(20),
					  age INT,
					  address VARCHAR(50),
					  city VARCHAR(50),
					  state	VARCHAR(20),
					  zip_code INT);
COPY customer
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\10-Stu_Joins\Resources\customer.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM customer;


--CREATE PAYMENTS TABLE
CREATE TABLE payments(payment_id INT,
					  bank_number BIGINT,
					  bank_routing_number BIGINT,
					  customer_id INT);
COPY payments
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\10-Stu_Joins\Resources\payments.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM payments;











