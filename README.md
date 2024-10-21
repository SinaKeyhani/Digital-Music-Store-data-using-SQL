# Digital Music Store data using SQL
<p align="center">
<img src="https://github.com/SinaKeyhani/Digital-Music-Store-data-using-SQL/blob/master/online-music-store.jpeg" alt="Project Image" width="500" height="400"/>
</p>


## Table Of Contents
* Introduction

* Dataset Description

* Dataset 

* Recommended Analysis

* Process 

* Tools & Techniques


## Introduction
Welcome to the Music Store project! Our platform offers an extensive collection of music, featuring a diverse selection of albums, tracks, and curated playlists. Customers can also create and customize their own playlists to enhance their listening experience. With a dedicated team of employees across various locations in Canada, we strive to provide excellent service to our global customer base, who regularly engage with our store to discover and purchase their favorite music.

## Dataset Description
<p align="center">
<img src="https://github.com/SinaKeyhani/Digital-Music-Store-data-using-SQL/blob/master/Entity%20Relationship%20Diagram.png" alt="Project Image" width="400" height="400"/>
</p>

## Process 

* Overview: This project utilizes PgAdmin 4, a graphical user interface for PostgreSQL, to build a robust music database and retrieve insights through structured queries.

* Database Creation:
I began by designing the database using an Entity-Relationship Diagram (ERD) to outline the structure. Once the schema was established, I imported the relevant CSV files into their corresponding tables, allowing me to familiarize myself with the dataset.

* Data Integration:
After importing the data, I connected the tables using Primary and Foreign Key constraints to ensure referential integrity. This step was crucial in creating a cohesive database structure that facilitates efficient querying.

* Querying for Insights:
With the database set up, I leveraged my querying skills to extract meaningful insights and answer key questions related to the music data.

## Dataset 
Data Sources

All data utilized for this project can be found in the dataset files included in this repository. Each file contains relevant information structured to support the various analyses performed throughout the project. Below is a brief overview of the key dataset files:

• customer.csv: Contains customer details, including customer IDs, names, emails, and geographical locations.

• employee.csv: Details of employees, including their IDs, names, job titles, and reporting structure.

• genre.csv: Information about music genres, including genre IDs and names.

• invoice_line.csv: Records of individual items purchased within invoices, capturing track IDs, quantities, and unit prices.

• invoice.csv: Summary of customer purchases, including invoice IDs, customer IDs, billing details, and total amounts.

• media_type.csv: Information about different media types associated with tracks, including media type IDs and names.

• playlist_track.csv: Mapping of tracks to playlists, detailing which tracks are included in which playlists.

• playlist.csv: Information about playlists, including playlist IDs and names.

• track.csv: Comprehensive data on tracks, including track IDs, names, durations, associated albums, genres, and pricing.

## List of Questions

Please find answer to all the questions on **Music_Store_Query.sql** 

1. Who is the senior-most employee based on job title?
   
2. Which countries have the most invoices?
 
3. What are the top 3 values of total invoices?
 
4. Which city has the best customers in terms of total invoice revenue?

5. Who is the best customer?

6. What email addresses, first names, and last names belong to listeners of Rock music?

7. What are the names and total track counts of the top 10 rock bands?
 
8. Which tracks have a song length longer than the average?

9. How much has each customer spent on artists?

10. What is the most popular music genre for each country based on purchase counts?
 
11. Which customers are the top spenders in each country?
 
12. What is the total invoice amount per city?
 
13. How many invoices have been issued in each country?

14. Which artist has the highest sales from invoice lines?

15. What are the average spending patterns of customers per genre?

## Tools and Techniques

This project marks my first foray into SQL, and I had the opportunity to learn and practice several key concepts:
• Joining Tables: Gained hands-on experience in combining data from multiple tables to extract comprehensive insights.
• Subqueries: Learned to write and implement subqueries for more complex data retrieval tasks.
• Aggregate and Ranking Functions: Practiced using aggregate functions to summarize data and ranking window functions to identify top performers.
• Common Table Expressions (CTEs): Developed proficiency in using CTEs to simplify complex queries and enhance readability.

## Contributing
Contributions are always welcome !!

If you would like to contribute to the project, please fork the repository and make a pull request.

Support If you have any doubts, queries or, suggestions then, please connect with me on LinkedIn.



