-- QUERY BANKS TABLE
--SELECT * FROM banks

-- Query the table to return the rows containing "Capital One"
--SELECT * FROM banks
--WHERE bank_name='Capital One';

-- Delete one of the duplicates
--DELETE FROM banks
--WHERE bank_id='7'

-- SELECT * FROM banks

--Insert a few more rows of data representing additional banks by adding the `bank_name` and `bank_routing_number` of your choice to the `banks` table.
/*INSERT INTO banks(bank_id, bank_name, bank_routing_number)
VALUES(7, 'Commonwealth Bank', 1548906480),
      (8, 'National Australia Bank', 165877987974),
	  (9, 'UP Bank', 1254534536489)*/

--SELECT * FROM banks

-- Change the name of Citigroup to PNC Bank
/*UPDATE banks
SET bank_name='PNC BANK'
WHERE bank_name='Citigroup'*/

--SELECT * FROM banks

--Change the bank_routing_number for Wells Fargo to 1995826182
/*UPDATE banks
SET bank_routing_number=1995826182
WHERE bank_name='Wells Fargo';*/

--SELECT * FROM banks

--Research how to add columns to a table. Then create a Boolean column named `mortgage_lending` that has a default value of `true`
/*ALTER TABLE banks
ADD mortgage_lending BOOLEAN
DEFAULT TRUE;*/

SELECT * FROM banks

















