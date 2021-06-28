-- DROP TABLES IF EXISTS
DROP TABLE IF EXISTS "card_holder" CASCADE;
DROP TABLE IF EXISTS "credit_card" CASCADE;
DROP TABLE IF EXISTS "merchant" CASCADE;
DROP TABLE IF EXISTS "merchant_category";
DROP TABLE IF EXISTS "transactions";


-- DEFINE SCHEMA card_holder
CREATE TABLE card_holder(id INT NOT NULL PRIMARY KEY,
						 name VARCHAR(50) NOT NULL);

COPY card_holder 
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Homework\Week 7\Instructions\Data\card_holder.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM card_holder;


-- DEFINE SCHEMA credit_card
CREATE TABLE credit_card(card VARCHAR(20) NOT NULL PRIMARY KEY,
						 cardholder_id INT NOT NULL,
						 FOREIGN KEY(cardholder_id) REFERENCES card_holder(id));
						  
COPY credit_card
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Homework\Week 7\Instructions\Data\credit_card.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM credit_card;	


-- DEFINE SCHEMA merchant_category
CREATE TABLE merchant_category(id INT NOT NULL PRIMARY KEY,
							   name VARCHAR(20) NOT NULL);

COPY merchant_category
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Homework\Week 7\Instructions\Data\merchant_category.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM merchant_category;


-- DEFINE SCHEMA merchant	
CREATE TABLE merchant(id INT NOT NULL PRIMARY KEY,
					  name VARCHAR(50) NOT NULL,
					  id_merchant_category INT NOT NULL,
					  FOREIGN KEY(id_merchant_category) REFERENCES merchant_category(id));

COPY merchant
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Homework\Week 7\Instructions\Data\merchant.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM merchant;



-- DEFINE SCHEMA transactions	
CREATE TABLE transactions(id INT NOT NULL PRIMARY KEY,
						  date TIMESTAMP NOT NULL,
						  amount FLOAT NOT NULL,
						  card VARCHAR(20) NOT NULL,
						  id_merchant INT NOT NULL,
						  FOREIGN KEY(card) REFERENCES credit_card(card),
						  FOREIGN KEY(id_merchant) REFERENCES merchant(id));
COPY transactions
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Homework\Week 7\Instructions\Data\transaction.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM transactions;

