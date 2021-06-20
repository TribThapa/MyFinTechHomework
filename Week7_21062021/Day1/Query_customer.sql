--Create a query to return all female customers
--SELECT * FROM customer
--WHERE gender='Female';

--Create a query to return all male customers from New Jersey
/*SELECT * FROM customer
WHERE gender='Male'
AND state='NJ';*/

--Create a query to return all male customers from New Jersey or Ohio.
/*SELECT * FROM customer
WHERE gender='Male'
AND state='NJ' OR state='OH'*/

--Create a query to return all female customers from Maryland who are less than 30 years old.
SELECT * FROM customer
WHERE gender='Female'
AND state='MD'
AND age<30
 