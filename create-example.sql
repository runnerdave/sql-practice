/*create table example
spec:

Create a table to organize our potential leads! We will have the following information:

A customer's first name, last name,email,sign-up date, and number of minutes spent on the dvd rental site. 
You should also have some sort of id tracker for them.
*/

DROP TABLE IF EXISTS potential_lead;

CREATE TABLE potential_lead (
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40),
	signup_date TIMESTAMP,
	minutes_spent_on_site smallint,
	email VARCHAR(40) UNIQUE,
	tracker_id serial PRIMARY KEY
);
