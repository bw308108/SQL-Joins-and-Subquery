-- 1.) List all customers who live in Texas (use JOINS)
-- Jennifer, Kim, Richard, Bryan, Ian 
SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2.) Get all payment above $6.99 with the Customer's Full Name
SELECT *
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3.) Show all customer names who have made payments over $175 (use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);

--4.) List all customers that live in Nepal 
-- No customers in Nepal
SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE city LIKE 'Ne%';

--5.) Which Staff member has the most transactions 
-- Mike Hillyer had the most transaction
SELECT staff_id, count(rental_date)
FROM rental
GROUP BY staff_id
HAVING count(rental_date) > 1;


SELECT *
FROM staff;

SELECT first_name, last_name
from staff
WHERE staff_id IN (
    SELECT staff_id
    FROM rental
    GROUP BY staff_id
    HAVING count(rental_date) > 1
);

--6.) How many movies of each rating are there?
-- R:195, NC-17:209, G: 178, PG-13: 223, PG: 194
SELECT rating, count(film_id)
FROM film
GROUP BY rating
HAVING count(film_id) > 1;

--7.) Show all customer who made a single payment above $6.99 (use subqueries)

SELECT first_name, last_name
from customer
where customer_id in (
    SELECT customer_id
    from payment
    GROUP BY customer_id
    HAVING sum(amount) > 6.99
    ORDER BY sum(amount) desc
);

--8.) How many free rentals did our store give away 
-- The store did not give away any free rentals
SELECT *
FROM store;


SELECT *
FROM film
WHERE rental_rate < .99;

SELECT *
FROM payment
WHERE amount < .99;
