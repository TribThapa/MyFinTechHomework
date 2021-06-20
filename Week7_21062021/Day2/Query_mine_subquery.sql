-- Find the titles of films that the employee `Jon Stephens` rented to customers
SELECT title FROM film
WHERE film_id IN
(
	SELECT film_id FROM inventory
	WHERE inventory_id IN
	(
		SELECT inventory_id FROM rental
		WHERE staff_id IN
		(
			SELECT staff_id FROM staff
			WHERE first_name='Mike'
			AND last_name='Hillyer'
		)
	)
);

-- Find the total rental amount paid for the film `ACE GOLDFINGER`
/*SELECT SUM(amount) FROM payment 
WHERE rental_id IN 
(
	SELECT rental_id FROM rental
	WHERE inventory_id IN
	(
		SELECT inventory_id FROM inventory 
		WHERE film_id IN
		(
			SELECT film_id FROM film
			WHERE title='ACE GOLDFINGER'
		)
	)

);*/
