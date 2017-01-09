select distinct rating from film;

select email from customer where first_name='Nancy' and last_name='Thomas';

select * from film limit 1;

select * from customer limit 1;

select description from film where title='Outlaw Hanky';

select phone from address where address='259 Ipoh Drive';

select count (distinct amount) as t from payment;

select customer_id, amount, payment_date from payment order by amount desc limit 10;

select title from film order by film_id limit 5;

select count(*) from payment where amount > 5;

select count(*) from actor where first_name like 'P%';

select * from address;

select count (distinct district) from address;

select distinct district from address;

select count(*) from film where rating='R' and replacement_cost between 5 and 15;

select count(*) from film where title ilike '%truman%';

select staff_id, count(amount), sum(amount) 
from payment
group by staff_id;

select rating, avg(replacement_cost) 
from film
group by rating;

select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc
limit 5;

select rating, avg(rental_rate)
from film
where rating in ('R','PG','G')
group by rating
having avg(rental_rate) < 3;

select customer_id, count(customer_id)
from payment
group by customer_id
having count(customer_id) > 40;

select rating, AVG(rental_duration) 
from film
group by rating
having AVG(rental_duration) > 5;

select customer_id, sum(amount) 
from payment
where staff_id = 2
group by customer_id
having sum(amount) > 110;

select count(*)
from film
where title like 'J%';

#LIKE example
select first_name, last_name 
from customer
where first_name like 'E%'
and address_id < 500
order by customer_id desc
limit 1;

select customer.customer_id, first_name, last_name, amount
from customer 
inner join payment on payment.customer_id = customer.customer_id
where first_name = 'Mary';

select customer.customer_id, first_name, last_name, amount
from payment 
inner join customer on payment.customer_id = customer.customer_id
where first_name = 'Mary';

select customer.customer_id, first_name, last_name, amount
from customer, payment
where payment.customer_id = customer.customer_id and first_name = 'Mary';

#OUTER JOIN example
select film.title, inventory.inventory_id, film.film_id
from film
left outer join inventory on inventory.film_id = film.film_id
where inventory_id is null;

#INNER JOIN example
select title, language.name 
from language
inner join film on language.language_id = film.language_id
where language.name = 'Italian';

select * from language;

#extract example
select sum(amount) as total, extract(month from payment_date) as month
from payment
group by month
order by total desc;

#self join example
select c1.first_name, c1.last_name, c2.first_name, c2.last_name 
from customer as c1, customer as c2
where c1.first_name = c2.last_name;

#self join with inner join syntax
select c1.first_name, c1.last_name, c2.first_name, c2.last_name 
from customer as c1
inner join customer as c2
on c1.first_name = c2.last_name;


