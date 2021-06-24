-- DROP TABLE IF EXISTS payment CASCADE;

SELECT * FROM payment;

--  What is the average payment amount?
SELECT ROUND(AVG(amount), 2) FROM payment;

-- What is the total payment amount?
SELECT SUM(amount) FROM payment;

-- What is the minimum payment amount?
SELECT MIN(amount) FROM payment;

-- What is the maximum payment amount?
SELECT MAX(amount) FROM payment;

-- How many customers has each staff serviced?
SELECT staff_id, COUNT("customer_id") FROM payment
GROUP BY staff_id;

-- What is the count of payments for each customer?
SELECT customer_id, COUNT(*) AS "payment_count"
FROM payment
GROUP BY customer_id
ORDER BY payment_count DESC;

-- Which customers have made over 40 payments?
SELECT customer_id, COUNT(*) AS "payment_count"
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 40;


