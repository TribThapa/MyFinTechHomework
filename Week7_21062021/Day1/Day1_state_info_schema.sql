DROP TABLE IF EXISTS states;

--Using the query tool, create an empty table named `states`. Be sure to match the data types!
CREATE TABLE states(state_name VARCHAR(50),
				    state_abbreviation VARCHAR(2),
				    population INT,
				    state_property_tax_rate FLOAT);

SELECT * FROM states;

--Insert data into the new table. The result should match the following image.
INSERT INTO states
(state_name, state_abbreviation, population, state_property_tax_rate)
VALUES 
('Florida', 'FL', 21477737, 0.0093),
('Alabama', 'AL', 4903185, 0.0042),
('Texas', 'TX', 28995881, 0.0181),
('Kentucky', 'KY', 4467673, 0.0086),
('Virginia', 'VA', 8535519, 0.0081),
('Louisiana', 'LA', 4648794, 0.0053),
('Utah', 'UT', 3205958, 0.0064),
('Vermont', 'VT', 623989, 0.00188);

--Query the table to recreate the following image.
SELECT * FROM states;

--Filter the table to view only state abbreviations.
SELECT state_abbreviation FROM states;

--Filter the table to view states with a population greater than `5,000,000`.
SELECT * FROM states
WHERE states.population>5000000;

--Filter the table to view states with a population of greater than `5,000,000` and a state property tax rate of less than `0.01`.
SELECT * FROM states
WHERE states.population>5000000 AND states.state_property_tax_rate<0.01;
