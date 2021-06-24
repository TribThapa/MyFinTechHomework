-- Write a query to get the number of payments and total payment amount for each customer in the `payment` table. Make sure to pull the customer `first_name` and `last_name` from the `customer` table via a `JOIN`.
CREATE VIEW customer_revenue AS
SELECT first_name, last_name, COUNT(payment_id) AS payment_count, SUM(amount) AS total_amount
FROM payment AS a
JOIN customer AS b ON a.customer_id=b.customer_id
GROUP BY first_name, last_name
ORDER BY total_amount DESC;


SELECT * FROM payment;

SELECT customer.first_name, customer.last_name, 
	   COUNT(payment.payment_date) AS "payment_count",  
	   SUM(payment.amount) AS "total_amount" FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, customer.first_name, customer.last_name
ORDER BY payment.customer_id DESC;


-- Then, create a view named `customer_revenues` from the above query.
CREATE VIEW customer_revenues AS 
SELECT customer.first_name, customer.last_name, 
	   COUNT(payment.payment_date) AS "payment_count", 
	   SUM(payment.amount) AS "total_amount" FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, customer.first_name, customer.last_name
ORDER BY payment.customer_id DESC;


-- Query the newly created `customer_revenues` view to find the revenues associated with customer 'THERESA WATSON'.
SELECT * FROM customer_revenues;


-- Write a query to get the number of payments and total payment amount that the staff member 'Mike Hillyer' has facilitated for each day in the `payment` table. Make sure to use a subquery instead of a join to do so.
CREATE VIEW staff_sales AS
SELECT staff_id, payment_date, 
       COUNT(payment_date) AS "payment_count", 
	   SUM(amount) AS "total_amount" FROM payment
WHERE customer_id IN
(
	SELECT customer_id FROM customer
	WHERE first_name='MIKE'
	AND last_name='Hillyer'
)
GROUP BY staff_id, payment_date;


-- Query the newly created `staff_sales` view to find the sales for `staff_id` = 1 on the date `2005-07-31`.
CREATE VIEW staff_sales AS
SELECT staff_id, CAST(payment_date as DATE), COUNT(payment_id) AS payment_count, SUM(amount) AS total_amount
FROM payment
WHERE staff_id IN
(
	SELECT staff_id FROM staff
	WHERE first_name='Mike'
	AND last_name='Hillyer'
)
GROUP BY staff_id, CAST(payment_date AS DATE)
ORDER BY CAST(payment_date AS DATE) DESC;


SELECT * FROM staff_sales
WHERE staff_id=1 AND 
payment_date='2005-07-30';




