-- Write a query to get the number of payments and total payment amount for each customer in the `payment` table. Make sure to pull the customer `first_name` and `last_name` from the `customer` table via a `JOIN`.
SELECT * FROM payment;

SELECT customer.first_name, customer.last_name, COUNT(payment.payment_date) AS "payment_count", SUM(payment.amount) AS "total_amount" FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, customer.first_name, customer.last_name
ORDER BY payment.customer_id DESC;
 

-- Then, create a view named `customer_revenues` from the above query.
/*CREATE VIEW customer_revenues AS 
SELECT customer.first_name, customer.last_name, COUNT(payment.payment_date) AS "payment_count", SUM(payment.amount) AS "total_amount" FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, customer.first_name, customer.last_name
ORDER BY payment.customer_id DESC;*/

SELECT * FROM customer_revenues;

-- Query the newly created `customer_revenues` view to find the revenues associated with customer 'THERESA WATSON'.
SELECT * FROM customer_revenues
WHERE first_name='THERESA';

--  Write a query to get the number of payments and total payment amount that the staff member 'Mike Hillyer' has facilitated for each day in the `payment` table. Make sure to use a subquery instead of a join to do so.
DROP VIEW staff_sales;

CREATE VIEW staff_sales AS
SELECT staff_id, payment_date, COUNT(payment_date) AS "payment_count", SUM(amount) AS "total_amount" FROM payment
WHERE customer_id IN
(SELECT customer_id FROM customer
 WHERE first_name='MIKE'
)
GROUP BY staff_id, payment_date;

-- Query the newly created `staff_sales` view to find the sales for `staff_id` = 1 on the date `2005-07-31`.
SELECT * FROM staff_sales
WHERE staff_id=2
AND payment_date='2005-07-31';

