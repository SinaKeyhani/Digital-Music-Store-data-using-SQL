/* Who is the senior most employee based on job title? */

SELECT 
    title, last_name, first_name
FROM
    employee
ORDER BY levels DESC
LIMIT 1;


/* Which countries have the most Invoices? */

SELECT 
    COUNT(invoice_id) AS invoice,
    billing_country AS billing_country
FROM
    invoice
GROUP BY billing_country
ORDER BY billing_country DESC;


/* What are top 3 values of total invoice? */

SELECT 
    total
FROM
    invoice
ORDER BY total DESC;


/*
Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals.Return both the city name & sum of all invoice totals 
*/

SELECT 
    billing_city, SUM(total) AS InvoiceTotal
FROM
    invoice
GROUP BY billing_city
ORDER BY InvoiceTotal DESC
LIMIT 1;


/* Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spending
FROM
    customer c
        JOIN
    invoice i ON c.customer_id = i.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;



/* 
Write a SQL query to return the email, first name, last name, and genre of all listeners of Rock music. 
*/


SELECT DISTINCT
    c.email, c.first_name, c.last_name
FROM
    customer c
        JOIN
    invoice i ON c.customer_id = i.customer_id
        JOIN
    invoice_line il ON i.invoice_id = il.invoice_id
WHERE
    track_id IN (SELECT 
            track_id
        FROM
            track t
                JOIN
            genre g ON g.genre_id = t.genre_id
        WHERE
            g.name LIKE 'Rock')
ORDER BY email;



/*
What SQL query would you use to retrieve the names and total track counts of the top 10 rock bands in our dataset, 
specifically focusing on the artists who have produced the most rock music?. */

SELECT 
    a.artist_id, a.name, COUNT(a.artist_id) AS number_of_songs
FROM
    track t
        JOIN
    album al ON a.album_id = t.album_id
        JOIN
    artist a ON a.artist_id = al.artist_id
        JOIN
    genre g ON g.genre_id = t.genre_id
WHERE
    g.name LIKE 'Rock'
GROUP BY a.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/*
Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 
*/

WITH AverageTrackLength AS (
    SELECT AVG(milliseconds) AS avg_length
    FROM track
)
SELECT name, milliseconds
FROM track
WHERE milliseconds > (SELECT avg_length FROM AverageTrackLength)
ORDER BY milliseconds DESC;




/* Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

WITH best_selling_artist AS (
	SELECT artist.artist_id AS artist_id, artist.name AS artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	GROUP BY 1
	ORDER BY 3 DESC
	LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_price*il.quantity) AS amount_spent
FROM invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC;


/*
We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres.
 */

WITH genre_purchases AS (
    SELECT 
        c.country,
        g.name AS genre_name,
        COUNT(il.quantity) AS purchase_count,
        RANK() OVER(PARTITION BY c.country ORDER BY COUNT(il.quantity) DESC) AS ranking
    FROM 
        invoice_line il
    JOIN 
        invoice i ON i.invoice_id = il.invoice_id
    JOIN 
        customer c ON c.customer_id = i.customer_id
    JOIN 
        track t ON t.track_id = il.track_id
    JOIN 
        genre g ON g.genre_id = t.genre_id
    GROUP BY 
        c.country, g.name
)

SELECT 
    country,
    genre_name,
    purchase_count
FROM 
    genre_purchases
WHERE 
    ranking = 1
ORDER BY 
    country, purchase_count DESC;




/*
Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */


WITH CustomerSpending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.billing_country,
        SUM(i.total) AS total_spending,
        RANK() OVER(PARTITION BY c.billing_country ORDER BY SUM(i.total) DESC) AS ranking
    FROM 
        customer c
    JOIN 
        invoice i ON c.customer_id = i.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name, c.billing_country)
        
SELECT 
    billing_country,
    first_name,
    last_name,
    total_spending
FROM 
    CustomerSpending
WHERE 
    ranking = 1
ORDER BY 
    billing_country, total_spending DESC;




-- Thank You 
