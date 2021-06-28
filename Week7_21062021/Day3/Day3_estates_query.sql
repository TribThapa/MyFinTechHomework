-- Test foreign keys by writing a query to insert data in the `estates` table that does not have a reference ID in the `owners` table
SELECT * FROM estates;
SELECT * FROM owners;

INSERT INTO estates (estate_id, owner_id, address, city, state, zip_code)
VALUES(8, 777, 'Clayton', 'Melbourne', 'Victoria', 3800);
SELECT * FROM estates;

-- Join the two tables.
SELECT * FROM estates
INNER JOIN owners ON owners.owner_id=estates.owner_id;


-- Join all three `owners`, `estate_new`, and `estate_type` tables together.
SELECT owners.owner_id, owners.first_name, owners.last_name,
       estate_new.estate_id, estate_new.address, estate_new.city, estate_new.state, estate_new.zip_code, estate_new.estate_type_id,
	   estate_type.estate_type
FROM owners	   
INNER JOIN estate_new ON estate_new.owner_id=owners.owner_id
INNER JOIN estate_type ON estate_type.estate_type_id=estate_new.estate_type_id;

