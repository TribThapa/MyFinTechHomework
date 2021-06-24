# SCHEMA

### Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
	Yes, all credit card holders seem to have a lot of transactions that are < $2.  


### Do you see any anomalous transactions that could be fraudulent?
	No, because we've limited our data to the TOP 100.

### Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
	Yes. We haven't limited our view to the TOP 100. Therefore, we can see all transactions < $2.

### What are the top 5 merchants prone to being hacked using small transactions?
	The TOP 5 merchants prone to being hacked are 
	- Megan Price
	- Peter Mckay
	- Stephanie Dalton
	- Brandon Pineda
 	- Matthew Gutierrez. 



# Visual Data Analysis

### What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale.

	- There seems to be more miminmal transactions with Card Holder 2 as opposed to Card Holder 18.
    - Therefore, it may be harder to detect fraudulent $2 trasactions with Card Holder 2 because real trasactions may overshadow fraudulent ones.
     - A better approach would be to isolate all transactions < $2 and determine when they happened and how many times they happened.
    - This approach should be implemented for both Card Holders.


### Are there any outliers for cardholder ID 25? How many outliers are there per month?

	Yes, there are outliers for all months except February. Here is the summary:
	- January: 1
	- March: 1
	- April: 3
	- May: 1
	- June: 3


#### Do you notice any anomalies? Describe your observations and conclusions.

	Except for April, the outliers are very distant from the mean, median and mode expenditure 
	suggesting these expenses are out of the norm and worth following up.

