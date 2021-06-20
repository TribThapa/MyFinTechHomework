--DROP IF TABLE EXISTS
DROP TABLE IF EXISTS payments;

--CREATE TABLE
CREATE TABLE payments(payment_id INT,
					  customer_id INT,
					  staff_id INT,
					  rental_id	INT,
					  amount FLOAT,
					  payment_date DATE);
					  
SELECT * FROM payments;

--LOAD CSV FILE
COPY payments
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\03-Stu_GregariousAggregates\Resources\payment.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM payments;