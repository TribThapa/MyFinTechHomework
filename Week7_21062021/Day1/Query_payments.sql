--Perform the correct join for each of the following use cases using the common `bank_routing_number` from the `payments` and `banks` tables:
-- *Note:** Assume the `payments` table is the designated "left" table and the `banks` table is the designated "right" table.

-- Return all payment records with matching bank routing numbers in the banks table.
SELECT * FROM payments
INNER JOIN banks ON banks.bank_routing_number=payments.banK_routing_number;

-- Return all payment records regardless if there is a matching bank routing number in the banks table
SELECT * FROM payments
LEFT JOIN banks ON banks.bank_routing_number=payments.banK_routing_number;

-- Return all bank records regardless if there is a matching bank routing number in the payments table
SELECT * FROM payments
RIGHT JOIN banks ON banks.bank_routing_number=payments.banK_routing_number;

-- Return all records from both tables regardless if there is a matching bank routing number in either table.
SELECT * FROM payments
FULL OUTER JOIN banks ON banks.bank_routing_number=payments.banK_routing_number;

-- Return paired records from both tables where each row of the first table is paired with each row of the second table
SELECT * FROM payments
CROSS JOIN banks;


--Create a `customer` table and import the [customer.csv](Resources/customer.csv) dataset. Then, 
-- Join the customer table with the payments and banks tables to find the customers who have Wells Fargo bank accounts. Return the following columns:
-- `payment_id`, `bank_number`, `bank_routing_number`, `bank_name`, `first_name`, `last_name`
SELECT payments.payment_id, payments.bank_number, payments.bank_routing_number, banks.bank_name, customer.first_name, customer.last_name,  payments.payment_id  FROM customer
JOIN payments ON customer.customer_id=payments.customer_id
JOIN banks ON payments.bank_routing_number=banks.bank_routing_number
WHERE banks.bank_name='Wells Fargo';

