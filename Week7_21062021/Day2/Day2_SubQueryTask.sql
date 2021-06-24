-- Find the customer first and last names of those who have made payments.
SELECT first_name, last_name FROM customer
WHERE customer_id IN
(
	SELECT customer_id FROM payment
)
 

SELECT customer.first_name, customer.last_name, customer.customer_id, payment.amount FROM customer
JOIN payment ON (customer.customer_id=payment.customer_id)
GROUP BY customer.first_name, customer.last_name, customer.customer_id, payment.amount;


-- Find the staff email addresses of those who have helped customers make payments.
SELECT email FROM staff
WHERE staff_id IN
(
	SELECT staff_id FROM payment
);


SELECT staff.email FROM staff
JOIN payment ON staff.staff_id=payment.staff_id
GROUP BY staff.email

-- Find the rental records of all films that have been rented out and paid for.
SELECT * FROM rental
WHERE rental_id IN 
(
	SELECT rental_id FROM payment
);

