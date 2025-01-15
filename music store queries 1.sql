/*Q1: who is the senior most employee based on job title?*/
select * from employee 
order by levels desc
limit 1


/*Q2: Which countries have the most invoices?*/
SELECt billing_country, count(customer_id) as cnt  FROM invoice
GROUP BY billing_country
order by cnt desc
limit 1


/*Q3: What are top 3 values of total invoice*/

Select total from invoice 
order by total desc
limit 3

/*Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals*/ 

select billing_city, sum(total ) as total_money from invoice 
group by billing_city
order by total_money desc
limit 1

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money*/
select cus.customer_id, cus.first_name, cus.last_name, sum(inv.total) as total from customer as cus
join invoice as inv
on cus.customer_id = inv.customer_id
group by cus.customer_id
order by total desc
limit 1

