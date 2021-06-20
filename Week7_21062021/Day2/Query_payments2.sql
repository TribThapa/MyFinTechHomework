-- Find the count of payments per customer in descending order.
SELECT customer_id, COUNT(payment_date)
FROM payments
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Find the top 5 customers who have spent the most money.
SELECT customer_id, COUNT(payment_date)
FROM payments
GROUP BY customer_id
ORDER BY count DESC
LIMIT 5;

-- Find the bottom 5 customers who have spent the least money.
SELECT customer_id, COUNT(payment_date)
FROM payments
GROUP BY customer_id
ORDER BY count ASC
LIMIT 5;

-- Find the top 10 customers with the highest average payment rounded to two decimal places.
SELECT customer_id, AVG(amount) FROM payments
GROUP BY customer_id
ORDER BY avg DESC
LIMIT 10;

--SELECT * FROM payments;
--ALTER TABLE payments ALTER COLUMN amount TYPE integer;


--Find the staff names and their number of customers serviced in descending order.
SELECT staff_id, sum(customer_id) FROM payments
GROUP BY staff_id
ORDER BY sum DESC;

SELECT * FROM payments;

--Using the `CAST()` function, cast the `payment_date` as a DATE datatype to group by day (rather than date and time). Determine the count of payments per day in descending order.
SELECT payment_date, count(amount) AS "Count of payments" FROM payments 
GROUP BY CAST(payment_date AS DATE)
ORDER BY "Count of payments" DESC;


















