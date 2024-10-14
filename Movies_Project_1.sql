use mavenmovies;

/*
1.	Find a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

SELECT 
	first_name, 
    last_name, 
	email, 
    store_id
FROM staff;

/*
2.	Separate the counts of inventory items held at each of the two stores. 
*/ 

SELECT 
	store_id, 
	COUNT(inventory_id) AS inventory_items
FROM inventory
GROUP BY 
	store_id;

/*
3.	Find the count of active customers for each of the stores separately. 
*/

SELECT 
	store_id, 
    COUNT(customer_id) AS active_customers
FROM customer
WHERE active = 1
GROUP BY 
	store_id;

/*
4.	In order to assess the liability of a data breach, provide a count of all customer email addresses stored in the database. 
*/

SELECT 
	COUNT(email) AS emails
FROM customer;

/*
5.	 Provide a count of unique film titles present in inventory at each store and then 
provide a count of the unique categories of films provided. 
*/

SELECT 
	store_id, 
    COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY 
	store_id; 
	
SELECT 
	COUNT(DISTINCT name) AS unique_categories
FROM category;

/*
6.	Provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, 
and the average of all films. ``	
*/

SELECT 
	MIN(replacement_cost) AS least_expensive, 
    MAX(replacement_cost) AS most_expensive, 
    AVG(replacement_cost) AS average_replacement_cost
FROM film;

/*
7.	Provide the average payment as well as the maximum payment processed.
*/

SELECT
	AVG(amount) AS average_payment, 
    MAX(amount) AS max_payment
FROM payment;

/*
8.	Provide a list of all customer identification values, with a count of rentals 
that have been made in all-time, with the highest volume customers at the top of the list.
*/

SELECT 
	customer_id, 
    COUNT(rental_id) AS number_of_rentals
FROM rental
GROUP BY 
	customer_id
ORDER BY 
	COUNT(rental_id) DESC;


