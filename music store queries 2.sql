/*Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.*/
select distinct  cus.first_name, cus.last_name, cus.email 
from customer as cus
join invoice as inv
on cus.customer_id =inv.invoice_id
join invoice_line on
invoice_line.invoice_id= inv.invoice_id
where track_id in (
	select track_id from track
	join genre
	on track.genre_id = genre.genre_id
	where genre.name = 'Rock'
)
order by email

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select art.name, count(tr.track_id) as no_of_songs
from artist as art
join album as al on 
art.artist_id  = al.artist_id
join track as tr on 
al.album_id = tr.album_id
join genre as gr on 
gr.genre_id = tr.genre_id
where gr.name = 'Rock'
group by art.name
order by no_of_songs desc
limit 10;

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select track.name, milliseconds 
from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track)
order by milliseconds desc
	
)