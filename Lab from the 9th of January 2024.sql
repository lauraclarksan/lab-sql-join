-- Lab 1 Unit 3

-- 1. List the number of films per category
select * from film_category;
select * from category;

select a.name, count(b.film_id) as filmcount from sakila.category as a
join sakila.film_category as b
on a.category_id = b.category_id
group by a.category_id
order by a.name;

-- 2. Display the first and the last names, as well as the address, of each staff member
select * from staff;
select * from address;

select a.first_name, a.last_name, b.address from sakila.staff as a
join sakila.address as b
on a.address_id = b.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005
select * from staff;
select * from payment;

select a.first_name, a.last_name, sum(b.amount) as total_amount from sakila.staff as a
join sakila.payment as b
on a.staff_id = b.staff_id
where month(b.payment_date) = 8 and year(b.payment_date) = 2005
group by a.first_name, a.last_name;


-- 4. List all films and the number of actors who are listed for each film
select * from film;
select * from film_actor;

select a.title, count(b.actor_id) as count_actors from sakila.film as a
join sakila.film_actor as b
on a.film_id = b.film_id
group by a.title
order by a.title;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from payment;
select * from customer;

select a.first_name, a.last_name, sum(b.amount) as total_amount from sakila.customer as a
join sakila.payment as b
on a.customer_id = b.customer_id
group by a.customer_id, a.first_name, a.last_name
order by a.last_name, a.first_name;
