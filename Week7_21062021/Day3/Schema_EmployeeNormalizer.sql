-- DROP TABLES IF THEY DON'T EXIST
DROP TABLE IF EXISTS employee_normalization;
DROP TABLE IF EXISTS first_nf_employee;
DROP TABLE IF EXISTS second_nf_employee;
DROP TABLE IF EXISTS second_nf_employee_email;
DROP TABLE IF EXISTS third_nf_employee;
DROP TABLE IF EXISTS third_nf_zipcode;

-- IMPORT EMPLOYEE.CSV FILE
CREATE TABLE employee_normalization(employee_id INT,
									employee_name VARCHAR(50),
									employee_no INT,
								    employee_address VARCHAR(50),
								    employee_state VARCHAR(20),
								    employee_state_abbv VARCHAR(10),
								    employee_zip_code INT,
								    employee_email VARCHAR(150));
							
COPY employee_normalization
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\02-Stu_Data_Normalization\Resources\employee_normalization.csv'
DELIMITER ','
CSV;

SELECT * FROM employee_normalization;

-- CREATE FIRST_NF_EMPLOYEE TABLE
CREATE TABLE first_nf_employee AS (SELECT employee_id,
								   employee_name,
								   employee_no,
								   employee_address,
								   employee_state,
								   employee_state_abbv,
								   employee_zip_code,
								   employee_email FROM employee_normalization);

SELECT * FROM first_nf_employee;									

-- Create two new tables `second_nf_employee` and `second_nf_employee_email` that organize the data in `first_nf_employee` according to second normal form standards.
CREATE TABLE second_nf_employee (employee_id INT PRIMARY KEY,
								 employee_name VARCHAR(50),
								 employee_no INT,
								 employee_address VARCHAR(50),
								 employee_state VARCHAR(20),
								 employee_state_abbv VARCHAR(10),
								 employee_zip_code INT,
								 employee_email VARCHAR(150));
COPY second_nf_employee
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\02-Stu_Data_Normalization\Resources\employee_normalization.csv'
DELIMITER ','
CSV;
SELECT * FROM second_nf_employee;

CREATE TABLE second_nf_employee_email (employe_id INT,
									  emplyee_name VARCHAR(50),
									  employee_no INT,
									  employee_address VARCHAR(50),
									  employee_state VARCHAR(20),
									  employee_state_abbv VARCHAR(10),
									  employee_zip_code INT,
									  employee_email VARCHAR(150) PRIMARY KEY);

COPY second_nf_employee_email
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\02-Stu_Data_Normalization\Resources\employee_normalization.csv'
DELIMITER ','
CSV;
SELECT * FROM second_nf_employee_email;


-- Create two new tables `third_nf_employee` and `third_nf_zipcode` that organize the data in `second_nf_employee` according to third normal form standards.
CREATE TABLE third_nf_employee AS (SELECT employee_id,
								   employee_name ,
								   employee_no,
								   employee_address,
								   employee_state,
								   employee_email, 
								   employee_zip_code FROM second_nf_employee); 

SELECT * FROM third_nf_employee;



CREATE TABLE third_nf_zipcode AS (SELECT employee_state_abbv,
								  employee_zip_code FROM second_nf_employee); 

SELECT * FROM third_nf_zipcode;

-- Join the `third_nf_employee`, `second_nf_employee_email` and `third_nf_zipcode` tables to re-create the initial dataset
SELECT * FROM third_nf_employee
RIGHT JOIN second_nf_employee_email ON second_nf_employee_email.employee_email=third_nf_employee.employee_email
LEFT JOIN third_nf_zipcode ON third_nf_zipcode.employee_zip_code=second_nf_employee_email.employee_zip_code;

