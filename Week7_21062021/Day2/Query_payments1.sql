SELECT * FROM payments;

--What is the average payment amount?
SELECT AVG(amount)
FROM payments;

--What is the total payment amount?
SELECT SUM(amount)
FROM payments;

--What is the minimum payment amount?
SELECT MIN(amount)
FROM payments;

-- What is the maximum payment amount?
SELECT MAX(amount)
FROM payments;

-- How many customers has each staff serviced?
SELECT staff_id, SUM(customer_id) 
FROM payments
GROUP BY staff_id;

-- What is the count of payments for each customer?
SELECT customer_id, COUNT(payment_date)
FROM payments
GROUP BY customer_id;


-- Which customers have made over 40 payments?
SELECT customer_id, COUNT(payment_date)>40
FROM payments
GROUP BY customer_id




