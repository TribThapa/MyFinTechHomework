DROP TABLE IF EXISTS estate_type;
DROP TABLE IF EXISTS estates;
DROP TABLE IF EXISTS estate_new;
DROP TABLE IF EXISTS owners;

-- CREATE TABLE OWNERS
CREATE TABLE owners(owner_id INT PRIMARY KEY,
					first_name VARCHAR(50),
					last_name VARCHAR(50));
					 
COPY owners
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\04-Stu_Foreign_Keys\Resources\owners.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM owners;


-- CREATE TABLE ESTATES
CREATE TABLE estates(estate_id INT,
					 owner_id INT,
					 address VARCHAR(50),
					 city VARCHAR(50),
					 state VARCHAR(50),
					 zip_code INT,
					 CONSTRAINT THAPA_CONSTRAINT FOREIGN KEY(owner_id) REFERENCES owners(owner_id));
					 
COPY estates
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\04-Stu_Foreign_Keys\Resources\estates.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM estates;


-- CREATE TABLE ESTATE TYPE
CREATE TABLE estate_type(estate_type_id INT PRIMARY KEY,
						 estate_type VARCHAR(50));
COPY estate_type
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\04-Stu_Foreign_Keys\Resources\estate_type.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM estate_type;

-- CREATE TABLE ESTATE NEW
CREATE TABLE estate_new(estate_id INT,
						owner_id INT,
						address VARCHAR(50),
						city VARCHAR(50),
						state VARCHAR(50),
						zip_code INT,
						estate_type_id INT,
						FOREIGN KEY(estate_type_id) REFERENCES estate_type(estate_type_id));
					 
COPY estate_new
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\04-Stu_Foreign_Keys\Resources\estates_new.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM estate_new;
