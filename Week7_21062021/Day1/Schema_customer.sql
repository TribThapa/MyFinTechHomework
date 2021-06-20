-- Drop tablf if exists
DROP TABLE if exists customer;

-- Create new table
CREATE TABLE customer(customer_id SERIAL PRIMARY KEY,
					  first_name VARCHAR (50),
					  last_name	VARCHAR(50),
					  gender VARCHAR(20),
					  age INT,
					  address VARCHAR(50),
					  city VARCHAR(50),
					  state VARCHAR(10),
					  zip_code INT);

-- READ IN TABLE
--SELECT * FROM customer

-- Load in csv file
COPY customer
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\1\07-Stu_Customer_Demographics\Resources\customer.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM customer