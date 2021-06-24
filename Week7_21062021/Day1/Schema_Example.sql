DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS customer_unique;
DROP TABLE IF EXISTS mortgage;


CREATE TABLE customer(first_name VARCHAR(30) NOT NULL,
					  last_name VARCHAR(30),
					  gender VARCHAR(30),
					  age INT,
					  address VARCHAR(50),
					  city VARCHAR(50),
					  province CHAR(2),
					  postal_code CHAR(20));
					  
SELECT * FROM customer;

CREATE TABLE student(first_name VARCHAR(30) NOT NULL,
					  last_name VARCHAR(30));
					  
SELECT * FROM student;

--UNIQUE is established using PRIMARY KEY
CREATE TABLE customer_unique(customer_id SERIAL PRIMARY KEY,
							 first_name VARCHAR(30) NOT NULL,
							 last_name VARCHAR(30),
							 gender VARCHAR(30),
							 age INT,
							 address VARCHAR(50),
							 city VARCHAR(50),
							 province CHAR(20),
							 postal_code CHAR(20));
					  
SELECT * FROM customer_unique;

INSERT INTO customer_unique
(first_name, last_name, gender, age, address, city, province, postal_code)
VALUES
  ('Michael', 'Meyer', 'Male', 24, '1021 Eddie Knolls Apt. 087', 'South Geraldton', 'NL', 'A1A0A4'),
  ('Cindy', 'Stephens', 'Female', 23, '838 Brown Street', 'East Christina', 'QC', 'G1A0B1'),
  ('John', 'Jackson', 'Male', 34, '5319 Candice Motorway', 'Adkinstown', 'AB', 'T2P1B4'),
  ('Alexander', 'Martinez', 'Male', 32, 'USNS Mosley', 'FPO', 'NU', 'X0A0H0');

SELECT * FROM customer_unique;


-- IMPORT
CREATE TABLE mortgage(mortgage_id INT PRIMARY KEY,
					  mortgage_name VARCHAR (50),
					  mortgage_rate FLOAT);
COPY mortgage
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\06-Ins_Importing_Data\Resources\mortgage.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM mortgage;













