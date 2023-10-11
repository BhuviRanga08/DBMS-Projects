/*
                                                                      ROLL'S KING SQL PROJECT
 By : BHUVI RANGA 
*/

--creating database
--create database rolls_king

--using database
use rolls_king

-- entering data
drop table if exists driver;
CREATE TABLE driver(driver_id integer,reg_date date); 

INSERT INTO driver(driver_id,reg_date) 
 VALUES (1,'01-01-2021'),
(2,'01-03-2021'),
(3,'01-08-2021'),
(4,'01-15-2021'),
(5, '02-20-2021'),
(6, '03-10-2021'),
(7, '04-05-2021'),
(8, '05-12-2021'),
(9, '06-18-2021'),
(10, '07-02-2021'),
(11, '08-19-2021'),
(12, '09-25-2021'),
(13, '10-14-2021'),
(14, '11-30-2021'),
(15, '12-22-2021'),
(16, '01-06-2022'),
(17, '02-28-2022'),
(18, '03-15-2022'),
(19, '04-11-2022'),
(20, '05-24-2022');



drop table if exists ingredients;
CREATE TABLE ingredients(ingredients_id integer,ingredients_name varchar(60)); 

INSERT INTO ingredients(ingredients_id ,ingredients_name) 
 VALUES (1,'BBQ Chicken'),
(2,'Chilli Sauce'),
(3,'Chicken'),
(4,'Cheese'),
(5,'Kebab'),
(6,'Mushrooms'),
(7,'Onions'),
(8,'Egg'),
(9,'Peppers'),
(10,'schezwan sauce'),
(11,'Tomatoes'),
(12,'Tomato Sauce'),
(13, 'Pineapple'),
(14, 'Spinach'),
(15, 'Bacon'),
(16, 'Avocado'),
(17, 'Pesto Sauce'),
(18, 'Black Olives'),
(19, 'Artichokes'),
(20, 'Feta Cheese'),
(21, 'Tofu'),
(22, 'Sausage'),
(23, 'Soy Sauce'),
(24, 'Shrimp'),
(25, 'Cilantro'),
(26, 'Peanuts'),
(27, 'Cucumber'),
(28, 'Red Pepper Flakes'),
(29, 'Lemon Zest'),
(30, 'Hummus'),
(31, 'Cashews'),
(32, 'Green Chilies'),
(33, 'Cottage Cheese'),
(34, 'Salsa'),
(35, 'Blue Cheese'),
(36, 'Sun-Dried Tomatoes'),
(37, 'Pesto Mayo'),
(38, 'Guacamole'),
(39, 'Sour Cream'),
(40, 'Pickles'),
(41, 'Jalapeños'),
(42, 'Sriracha');


drop table if exists rolls;
CREATE TABLE rolls(roll_id integer,roll_name varchar(30)); 

INSERT INTO rolls(roll_id ,roll_name) 
 VALUES (1	,'Non Veg Roll'),
(2	,'Veg Roll'),
(3, 'Chicken Teriyaki Roll'),
(4, 'California Roll'),
(5, 'Spicy Tuna Roll'),
(6, 'Salmon Avocado Roll'),
(7, 'Vegetable Tempura Roll'),
(8, 'Shrimp Tempura Roll'),
(9, 'Philadelphia Roll'),
(10, 'Dragon Roll');

drop table if exists rolls_recipes;
CREATE TABLE rolls_recipes(roll_id integer,ingredients varchar(24)); 

INSERT INTO rolls_recipes(roll_id ,ingredients) 
 VALUES (1,'1,2,3,4,5,6,8,10'),
(2,'4,6,7,9,11,12'),
(3, '3,9,11,12'),
(4, '4,6,11,12'),
(5, '1,34,20,44,18,15'),
(6, '23,40,31,12,8'),
(7, '6,17,29,31,42'),
(8, '6,9,10,38,41,27'),
(9, '2,15,29,30,41,42'),
(10, '7,11,15,18,29,27,33,42'); 


drop table if exists driver_order;
CREATE TABLE driver_order(order_id integer,driver_id integer,pickup_time datetime,distance VARCHAR(50),duration VARCHAR(50),cancellation VARCHAR(23));
INSERT INTO driver_order(order_id,driver_id,pickup_time,distance,duration,cancellation) 
 VALUES(1,1,'01-01-2021 18:15:34','20km','32 minutes',''),
(2,1,'01-01-2021 19:10:54','20km','27 minutes',''),
(3,9,'01-03-2021 00:12:37','13.4km','20 mins','NaN'),
(4,20,'01-04-2021 13:53:03','23.4','40','NaN'),
(5,13,'01-08-2021 21:10:57','10','15','NaN'),
(6,2,null,null,null,'Cancellation'),
(7,12,'01-08-2020 21:30:45','25km','25mins',null),
(8,15,'01-10-2020 00:15:02','23.4 km','15 minute',null),
(9,14,null,null,null,'Customer Cancellation'),
(10,19,'01-11-2020 18:50:20','10km','10minutes',null),
(11,3, '02-14-2021 09:30:15', '8.7 km', '12 minutes', ''),
(12,18, '03-02-2021 14:45:22', '15 km', '22 minutes', ''),
(13,12, '04-05-2021 08:20:10', '18.5 km', '30 minutes', ''),
(14, 13, '05-10-2021 17:15:45', '12.3 km', '18 mins', 'NaN'),
(15,19, '06-15-2021 11:30:05', '9.8 km', '15 minutes', 'Cancellation'),
(16,20, '07-20-2021 16:40:30', '22 km', '35 minutes', ''),
(17, 11, '08-25-2021 19:55:17', '19.7 km', '28 minutes', ''),
(18, 13, '09-30-2021 07:10:02', '11 km', '16 mins', 'NaN'),
(19, 12, '10-05-2021 10:22:45', '25.1 km', '45 minutes', ''),
(20,10, '11-10-2021 14:15:30', '13.2 km', '19 minutes', ''),
(21, 13, '12-15-2021 20:30:15', '9.5 km', '13 mins', 'Cancellation'),
(22, 2, '01-20-2022 22:45:10', '27 km', '50 minutes', ''),
(23, 11, '02-25-2022 05:12:33', '14.8 km', '22 minutes', ''),
(24, 13, '03-02-2022 10:18:45', '10.7 km', '16 mins', 'NaN'),
(25, 12, '04-07-2022 15:30:20', '28.3 km', '55 minutes', ''),
(26, 1, '05-12-2022 17:50:10', '16.5 km', '25 minutes', ''),
(27, 17, '06-17-2022 19:45:22', '8.2 km', '12 mins', 'Cancellation'),
(28, 20, '07-22-2022 14:10:30', '30.7 km', '60 minutes', ''),
(29, 17, '08-27-2022 22:35:17', '22.4 km', '35 minutes', ''),
(30, 16, '09-01-2022 05:40:02', '7.9 km', '10 mins', 'NaN'),
(31, 12, '10-06-2022 08:22:45', '33.2 km', '70 minutes', ''),
(32, 1, '11-11-2022 13:15:30', '18.9 km', '28 minutes', ''),
(33, 13, '12-16-2022 15:30:15', '6.5 km', '9 mins', 'Cancellation'),
(34, 20, '01-21-2023 18:45:10', '36.8 km', '75 minutes', ''),
(35, 15, '02-26-2023 07:02:33', '23.6 km', '38 minutes', ''),
(36, 14, '03-05-2023 10:08:45', '5.4 km', '8 mins', 'NaN'),
(37, 2, '04-10-2023 15:20:20', '42.1 km', '90 minutes', ''),
(38, 7, '05-15-2023 17:40:10', '27.3 km', '44 minutes', ''),
(39, 8, '06-20-2023 19:35:22', '4.7 km', '7 mins', 'Cancellation'),
(40, 16, '07-25-2023 14:50:30', '48.5 km', '105 minutes', '');



drop table if exists customer_orders;
CREATE TABLE customer_orders(order_id integer,customer_id integer,roll_id integer,not_include_items VARCHAR(50),extra_items_included VARCHAR(50),order_date datetime);
INSERT INTO customer_orders(order_id,customer_id,roll_id,not_include_items,extra_items_included,order_date)
values (1,101,1,'','','01-01-2021  18:05:02'),
(2,101,1,'','','01-01-2021 19:00:52'),
(3,102,7,'','','01-02-2021 23:51:23'),
(3,102,9,'','NaN','01-02-2021 23:51:23'),
(4,103,5,'4','','01-04-2021 13:23:46'),
(4,103,3,'4','','01-04-2021 13:23:46'),
(4,103,7,'4','','01-04-2021 13:23:46'),
(5,104,6,null,'1','01-08-2021 21:00:29'),
(6,101,2,null,null,'01-08-2021 21:03:13'),
(7,105,2,null,'1','01-08-2021 21:20:29'),
(8,102,1,null,null,'01-09-2021 23:54:33'),
(9,103,9,'4','1,5','01-10-2021 11:22:59'),
(10,104,1,null,null,'01-11-2021 18:34:49'),
(10,104,1,'2,6','1,4','01-11-2021 18:34:49'),
(11, 101, 2, null, null, '01-12-2021 10:15:30'),
(12, 102, 3, '5', '1,2,6', '01-13-2021 14:45:22'),
(13, 103, 4, null, '4,5,6', '01-14-2021 08:20:10'),
(14, 104, 5, null, null, '01-15-2021 17:15:45'),
(15, 105, 6, '6', null, '01-16-2021 11:30:05'),
(16, 101, 7, null, '1,3,5', '01-17-2021 16:40:30'),
(17, 102, 8, null, null, '01-18-2021 19:55:17'),
(18, 103, 9, '3', '2,4,5,6', '01-19-2021 07:10:02'),
(19, 104, 10, null, null, '01-20-2021 10:22:45'),
(20, 105, 1, null, '1,2,3,4,5', '01-21-2021 14:15:30'),
(21, 101, 2, null, '1,2,3,4,5,6', '01-22-2021 20:30:15'),
(22, 102, 3, '4,5', '1,2', '01-23-2021 22:45:10'),
(23, 103, 4, '1,2,3', null, '01-24-2021 05:12:33'),
(24, 104, 5, null, '1', '01-25-2021 10:18:45'),
(25, 105, 6, '2,3,4,5,6', '1,2', '01-26-2021 15:30:20'),
(26, 101, 7, '1,2,3,4,5,6', '1,2,3,4,5,6', '01-27-2021 17:50:10'),
(27, 102, 8, '1,2,3,4,5,6', null, '01-28-2021 19:45:22'),
(28, 103, 9, null, '1,2,3,4,5,6', '01-29-2021 14:10:30'),
(29, 104, 10, null, null, '01-30-2021 22:35:17'),
(30, 105, 1, '1,2,3,4,5,6', '1,2,3,4,5,6', '01-31-2021 05:40:02');




--looking at the data
select * from customer_orders;
select * from driver_order;
select * from ingredients;
select * from driver;
select * from rolls;
select * from rolls_recipes;


--1. How many rolls were ordered?
select count(roll_id) as tot_rolls
from customer_orders;

--2. How many rolls of which category?
select count(a.order_id) as cat_roll_tot, b.roll_name as cat
from customer_orders as a
inner join rolls as b
on a.roll_id = b.roll_id
group by roll_name;

--3. How many unique customer orders were made?
select c1.customer_id, c1.roll_id,c1.extra_items_included,c1.not_include_items
from customer_orders as c1,customer_orders as  c2
where c1.roll_id <> c2.roll_id and c1.not_include_items <> c2.not_include_items 
and c1.extra_items_included <> c2.extra_items_included;

--4. How many successful orderd by each driver?
select driver_id, count(distinct order_id) 
from driver_order
where cancellation not like '%Cancellation%'
group by driver_id;

--5. Different types of rolls successfully delivered
select count(o.driver_id) as successfull_orders , c.roll_id as category
from driver_order as o
inner join customer_orders as c
on o.order_id = c.order_id
where o.cancellation not like '%Cancellation%'
group by c.roll_id;


--6. Which rolls were ordered and how many ?
select customer_id, roll_id, count(roll_id)
from customer_orders
group by customer_id, roll_id;

--7. Maximum number of rolls ordered in a single order by a customer?
select top 1 count(order_id) as order_count, count(roll_id) as roll_count, customer_id
from customer_orders
group by customer_id
order by count(order_id) desc, count(roll_id) desc;


--8. For each customer how many rolls had one change and no change at all
select customer_id,  count(extra_items_included) as change_count, count(not_include_items)
from customer_orders
group by customer_id;

--9. Average speed of each drivers
with temp_driver_orders as
(select driver_id, CAST(REPLACE(distance, 'km', '') AS DECIMAL(10, 2)) AS distance_km,
case 
when isnumeric(replace(replace(duration,'minutes',''),'mins','')) = 1
then cast(replace(replace(duration,'minutes',''),'mins','') as decimal(10,2))
else null
end as duration_min
from driver_order)
select driver_id , 
AVG(distance_km / (duration_min / 60)) AS average_speed_kmph
from temp_driver_orders
group by driver_id;


--10. Which is the most asked item to be included and which is the most avoided item?
select left(extra_items_included,1) , substring(extra_items_included,3,3)
from customer_orders
where extra_items_included is not null or extra_items_included not like 'NaN';


with temp_orders as 
(select left(extra_items_included,1) as included_1,substring(extra_items_included,3,3) as included_2,
left(not_include_items,1) as avoided_1, substring(not_include_items,3,3) as avoided_2, order_id ,customer_id ,roll_id
from customer_orders)
select included_1 ,count(included_1), count(included_2), count(avoided_1),count(avoided_2) 
from temp_orders
group by included_1, included_2, avoided_1, avoided_2
order by count(included_1) desc, count(included_2) desc , count(avoided_1) desc ,count(avoided_2) desc;



--11. Customer with most orders
select top 1 customer_id,count(*) as count_ 
from customer_orders
group by customer_id
order by count(*) desc;

--12. Customer who placed the earliest order
select customer_id, order_date as date_
from customer_orders
where order_date = (select min(order_date) from customer_orders);

-- 13. Who made the recent order
select customer_id, cast(order_date as DATE) as date_
from customer_orders
where order_date = (select max(order_date) from customer_orders);


--14. Total ingredients used in a roll?
select roll_id,
     len(ingredients)  - len(replace(ingredients, ',', '')) + 1 AS ingredient_count
FROM rolls_recipes;


-- 15.Avergae pickup duration(time) for each customers?
select b.customer_id, avg(cast(replace(replace(replace(duration,'minutes',''), 'minute',''),'mins','') as int)) as avg_duration
from driver_order as a
inner join customer_orders as b 
on a.order_id = b.order_id
where a.duration is not null
group by b.customer_id
order by avg_duration;


--16.Drivers who completed orders with a total distance greater than 50 km and an average pickup time duration less than 30 minutes.
--select driver_id,avg(cast(replace(distance, 'km', '') as decimal))
--from driver_order
--group by driver_id;

select driver_id, avg(cast(replace(replace(replace(duration, 'minutes', ''), 'minute', ''), 'mins', '') as int)) as avg_duration, 
sum(cast(replace(distance, 'km', '') as decimal)) as tot_distance 
from driver_order
group by driver_id
having avg(cast(replace(replace(replace(duration, 'minutes', ''), 'minute', ''), 'mins', '') as int)) < 30 
and sum(cast(replace(distance, 'km', '') as decimal)) > 50;


--17.The total distance covered by all orders placed on '01-01-2021'.
select sum(cast(replace(distance,'km','') as decimal)) as total_distance
from driver_order
where convert(date,pickup_time) = '2021-01-01' and pickup_time is not null;

--18.Order details for orders that had a cancellation and were placed by customer 101.
select a.order_id, b.customer_id
from driver_order as a 
inner join customer_orders as b
on a.order_id = b.order_id
where b.customer_id = '101'
and cancellation like '%Cancellation%' or cancellation like 'Cancellation%' 



