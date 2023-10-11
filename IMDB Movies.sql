--Creating a new database imdb

--Using imdb
--create database imdb;
use imdb;

--Looking at both the tables
select * from movies_csv;

select * from directors_csv;

-- Distinct departments in directors table
select distinct department
from directors_csv;

--Dropping redundant column
alter table directors_csv
drop column department;


--Counting total number of movies
select count(*) 
from movies_csv;

--Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * 
from directors_csv
where name in ('James Cameron', 'Luc Besson', 'John Woo')


--Find all directors with name starting with Steven
select * 
from directors_csv
where name like 'Steven%';


--Count female directors.
select count(*)
from directors_csv
where gender = 1;


--Find the name of the 10th first women directors?
select name 
from directors_csv
where gender = 1
order by id asc;


--Top 3 popular movies
select top 3 original_title
from movies_csv
order by popularity;

-- Top 3 bankable movies -- > made profit
select top 3 (budget - revenue),original_title
from movies_csv
order by budget - revenue desc;


--Average vote after  1 Jan 2000
select top 1 original_title
from movies_csv
where release_date > '2000-01-01'
order by vote_average desc;


-- Movies directed by Brenda Champan
select m.original_title, d.name
from movies_csv as m
inner join directors_csv as d
on m.director_id = d.id
where d.name = 'Brenda Chapman';


-- Top 5 director made the most movies
select top 5 count(*), d.name
from movies_csv as m
inner join directors_csv as d
on m.director_id = d.id
group by d.name
order by count(*) desc;



-- Top 10 popular movies 
select top 10 popularity , title as movie
from movies_csv
order by popularity desc;

--Which of the pirates movie is most popular
select top 4 popularity , title as Pirates_movie
from movies_csv
where title like 'Pirates%'
order by popularity desc;

--Which year most movies were released
select top 5 count(*), YEAR(release_date) as Year
from movies_csv
group by YEAR(release_date)
order by count(*) DESC;

-- Which year least movies were released
select top 5 count(*), YEAR(release_date) as Year
from movies_csv
group by YEAR(release_date)
order by count(*) ASC;


select * from movies_csv;

--Which movie has the most vote count
select top 1 max(vote_count) as vote_count, title as movie
from movies_csv
group by title
order by max(vote_count) DESC;

-- Which Avengres movie had most votes 
select * 
from movies_csv
where title like 'Avengers%';

-- Which gender produced how many movies in which year 
select count(*) as movies, YEAR(m.release_date) as year,
CASE 
	When d.gender = 1 then 'female'
	when d.gender = 2 then 'male'
	when d.gender = 0 then 'not-disclosed'
	END AS gender

from movies_csv as m
inner join directors_csv as d
on m.director_id = d.id
group by gender, YEAR(release_date)
order by  movies DESC, YEAR(release_date) asc;

-- Which movie generated most revenue
select top 10 max(revenue) as revenue , title as movies
from movies_csv
group by title
order by revenue desc;

-- Total revenue generated each year
select top 5 SUM(revenue), YEAR(release_date) 
from movies_csv
group by YEAR(release_date)
order by YEAR(release_date) desc;

--Which movie generated most revenue each year 
select max(revenue) as revenue, title as movie, YEAR(release_date) as yr
from movies_csv
group by YEAR(release_date),title
order by max(revenue) desc, yr asc;

WITH YearlyMaxGross AS (
    SELECT
        year(release_date) as Yr,
        MAX(revenue) AS max_revenue
    FROM movies_csv
    GROUP BY year(release_date)
)

SELECT YEAR(release_date),
    title AS movie_name,
    revenue AS revenue
FROM movies_csv 
JOIN YearlyMaxGross y 
ON movies_csv.revenue = y.max_revenue
ORDER BY Yr;


