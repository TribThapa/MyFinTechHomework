-- How can you isolate (or group) the transactions of each cardholder?
SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM merchant;
SELECT * FROM merchant_category;
SELECT * FROM transactions;
 

-- How can you isolate (or group) the transactions of each cardholder?
CREATE VIEW card_holders AS
SELECT card_holder.name AS "Card holder name",
	   COUNT(transactions.card) AS "Total transactions",
	   SUM(transactions.amount) AS "Amount transacted",
	   SUM(CASE WHEN transactions.amount < 2 THEN 1 ELSE 0 END) AS "Amount transacted<$2"
FROM transactions
INNER JOIN credit_card ON credit_card.card=transactions.card
INNER JOIN card_holder ON card_holder.id=credit_card.cardholder_id
GROUP BY card_holder.name 
ORDER BY "Amount transacted<$2" DESC;
--  Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
-- Yes, all credit card holders seem to have a lot of transactions that are < $2.  





-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?
CREATE VIEW top_100_7_9am AS
SELECT * FROM transactions
WHERE CAST(date AS time) > '07:00:00' AND CAST(date AS time) < '09:00:00'
ORDER BY amount DESC
LIMIT 100;
-- Do you see any anomalous transactions that could be fraudulent?
-- No, because we've limited our data to the TOP 100.




--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
-- Yes. We haven't limited our view to the TOP 100. Therefore, we can see all transactions < $2.
CREATE VIEW transactions_all AS
SELECT * FROM transactions
WHERE NOT CAST(date AS time) > '07:00:00' AND CAST(date AS time) < '09:00:00'
ORDER BY amount DESC;




-- What are the top 5 merchants prone to being hacked using small transactions?
CREATE VIEW top_5_merchants_hacked AS
SELECT card_holder.name AS "Card holder name",
	   COUNT(transactions.card) AS "Total transactions",
	   SUM(transactions.amount) AS "Amount transacted",
	   SUM(CASE WHEN transactions.amount < 2 THEN 1 ELSE 0 END) AS "Amount transacted<$2"
FROM transactions
INNER JOIN credit_card ON credit_card.card=transactions.card
INNER JOIN card_holder ON card_holder.id=credit_card.cardholder_id
GROUP BY card_holder.name 
ORDER BY "Amount transacted<$2" DESC
LIMIT 5;

-- The TOP 5 merchants prone to being hacked are Megan Price, Peter Mckay, Stephanie Dalton, Brandon Pineda, and Matthew Gutierrez. 




--The two most important customers of the firm may have been hacked. Verify if there are any fraudulent transactions in their history. For privacy reasons, you only know that their cardholder IDs are 2 and 18.
SELECT * FROM credit_card
INNER JOIN transactions ON transactions.card=credit_card.card
WHERE cardholder_id=2 OR cardholder_id=18
	


-- The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. 
-- Again, for privacy reasons, you know only that the cardholder ID in question is 25.
SELECT credit_card.cardholder_id, 
	   EXTRACT(month from date) AS Month,
	   EXTRACT(day from date) AS Day,
	   transactions.amount
FROM credit_card
INNER JOIN transactions ON transactions.card=credit_card.card
WHERE cardholder_id=25 



-- Find anomalous transactions for 3 random card holders
SELECT credit_card.cardholder_id, 
	   EXTRACT(month from date) AS Month,
	   EXTRACT(day from date) AS Day,
	   transactions.amount
FROM credit_card
INNER JOIN transactions ON transactions.card=credit_card.card
WHERE cardholder_id=7 OR cardholder_id=15 OR cardholder_id=21
GROUP BY credit_card.cardholder_id, transactions.date, transactions.amount
ORDER BY month;


