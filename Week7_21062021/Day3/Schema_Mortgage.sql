DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Banks;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Mortgate;


CREATE TABLE "Customer" ("customer_id" INT   NOT NULL,
						 "first_name" VARCHAR(50)   NOT NULL,
						 "last_name" VARCHAR(50)   NOT NULL,
						 "gender" VARCHAR(20)   NOT NULL,
						 "age" INT,   
						 "address" VARCHAR(50)   NOT NULL,
						 "city" VARCHAR(50)   NOT NULL,
						 "state" VARCHAR(10)   NOT NULL,
						 "zip_code" INT   NOT NULL,
						 CONSTRAINT "pk_Customer" PRIMARY KEY ("customer_id"));

CREATE TABLE "Banks" ("bank_id" INTEGER   NOT NULL,
					  "bank_name" VARCHAR(50)   NOT NULL,
					  "bank_routing_number" INT   NOT NULL,
					  CONSTRAINT "pk_Banks" PRIMARY KEY ("bank_id"));

CREATE TABLE "Sales" ("sales_id" INT   NOT NULL,
					  "payment_id" INT   NOT NULL,
					  "mortgage_id" INT   NOT NULL,
					  "loan_amount" INT   NOT NULL,
					  "loan_date" DATE   NOT NULL,
					  CONSTRAINT "pk_Sales" PRIMARY KEY ("sales_id"));

CREATE TABLE "Payments" ("payment_id" INT   NOT NULL,
						 "bank_number" INT   NOT NULL,
						 "bank_routing_number" INT   NOT NULL,
						 "customer_id" INT   NOT NULL,
						 CONSTRAINT "pk_Payments" PRIMARY KEY ("payment_id"));

CREATE TABLE "Mortgate" ("mortgage_id" INT   NOT NULL,
						 "mortgage_name" VARCHAR(20)   NOT NULL,
						 "mortgage_rate" FLOAT   NOT NULL,
						 CONSTRAINT "pk_Mortgate" PRIMARY KEY ("mortgage_id"));

ALTER TABLE "Sales" ADD CONSTRAINT "fk_Sales_payment_id" FOREIGN KEY("payment_id")
REFERENCES "Payments" ("payment_id");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_bank_routing_number" FOREIGN KEY("bank_routing_number")
REFERENCES "Banks" ("bank_routing_number");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customer" ("customer_id");

ALTER TABLE "Mortgate" ADD CONSTRAINT "fk_Mortgate_mortgage_id" FOREIGN KEY("mortgage_id")
REFERENCES "Sales" ("mortgage_id");

SELECT * FROM "Customer"