-- Find the customer first and last names of those who have made payments.

SELECT customer.first_name, customer.last_name, customer.customer_id FROM customer
JOIN payment ON (customer.customer_id=payment.customer_id)
WHERE payment.amount>0;

-- Find the staff email addresses of those who have helped customers make payments.
SELECT staff.email FROM staff
JOIN payment ON staff.staff_id=payment.staff_id;

-- Find the rental records of all films that have been rented out and paid for.
SELECT rental.rental_id, rental.rental_date, rental.inventory_id, rental.customer_id, rental.return_date, rental.staff_id, rental.last_update FROM rental 
JOIN film ON (rental.last_update=film.last_update)
WHERE rental.return_date IS NOT NULL;










