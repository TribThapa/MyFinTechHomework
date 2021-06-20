--DROP TABLE IF EXISTS
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS staff;

--CREATE CUSTOMER TABLE
CREATE TABLE customer(customer_id INT,
					  store_id INT,
					  first_name VARCHAR(20),
					  last_name	VARCHAR(20),
					  email VARCHAR(50),
					  address_id INT,
					  activebool BOOLEAN,
					  create_date DATE,
					  last_update DATE,
					  active BOOLEAN);
copy customer
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\customer.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM customer;


--CREATE FILM TABLE
CREATE TABLE film (film_id INT,
				   title VARCHAR(50),
				   description VARCHAR(150),
				   release_year INT,
				   language_id INT,
				   original_language_id INT,
				   rental_duration INT,
				   rental_rate FLOAT,
				   length INT,
				   replacement_cost FLOAT,
				   rating	VARCHAR(20),
				   last_update DATE,
				   special_features VARCHAR(500),
				   fulltext VARCHAR(500));
copy film 
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\film.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM film;


--CREATE INVENTORY TABLE
CREATE TABLE inventory(inventory_id	INT,
					   film_id INT, 
					   store_id INT, 
					   last_update DATE);
copy inventory
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\inventory.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM inventory;


--CREATE TABLE PAYMENT
CREATE TABLE payment(payment_id INT,
					 customer_id INT,
					 staff_id INT,
					 rental_id INT,
					 amount FLOAT,
					 payment_date DATE);
					 
copy payment
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\payment.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM payment;


--CREATE TABLE RENTAL
CREATE TABLE rental(rental_id SERIAL,
					rental_date DATE,
					inventory_id INT,
					customer_id	INT,
					return_date	DATE,
					staff_id INT,
					last_update DATE);
copy rental 
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\rental.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM rental;

--CREATE TABLE STAFF
CREATE TABLE staff(staff_id INT,
				   first_name VARCHAR(50),
				   last_name VARCHAR(50),
				   address_id INT,
				   email VARCHAR(50),
				   store_id INT,
				   active BOOLEAN,
				   username VARCHAR(20),
				   password VARCHAR(50),
				   last_update DATE,
				   picture INT NULL);
copy staff
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\2\07-Stu_Subqueries\Resources\staff.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM staff;





					