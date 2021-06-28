DROP TABLE IF EXISTS employee_normalization;
DROP TABLE IF EXISTS first_nf_employee;

CREATE TABLE employee_normalization(ID INT,
								    NAME VARCHAR(30),
									AGE INT,
									ADDRESS VARCHAR(30),
									STATE VARCHAR(30),
									ABBREVIATION VARCHAR (30),
									ZIPCODE INT,
									EMAIL_ADDRESS VARCHAR(100));
COPY employee_normalization
FROM 'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\02-Stu_Data_Normalization\Resources\employee_normalization.csv'
DELIMITER ','
CSV;

SELECT * FROM employee_normalization;


CREATE TABLE first_nf_employee(ID INT,
							   NAME VARCHAR(30),
							   AGE INT,
							   ADDRESS VARCHAR(30),
							   STATE VARCHAR(30),
							   ABBREVIATION VARCHAR (30),
							   ZIPCODE INT,
							   EMAIL_ADDRESS VARCHAR(100));


CREATE TABLE second_nf_employee(ID INT PRIMARY KEY,
								NAME VARCHAR(30),
								AGE INT,
								ADDRESS VARCHAR(30),
								STATE VARCHAR(30),
								ABBREVIATION VARCHAR (30),
								ZIPCODE INT);
							   

CREATE TABLE second_nf_employee_email(EMAIL_ADDRESS VARCHAR(100) PRIMARY KEY,
									  ID INT);

