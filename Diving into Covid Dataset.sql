-- Portfolio Project 
-- 25 Questions for SQL Data Analysis

-- Create a database
--create database covid;

-- use database
use covid;

-- 1.Data in covid deaths
select *
from covid_deaths;

-- 2.All the countries in the data
select location
from covid_deaths
group by location
order by location;

-- 3.Total deaths vs total cases per country
select location, total_cases, total_deaths, (total_deaths * 100.0 / NULLIF(total_cases, 0)) AS death_percent
from covid_deaths
order by 1,2;


-- 4.Population vs total cases per country
select location, total_cases, population , (total_cases * 1.0 / NULLIF(population, 0))*100 AS case_percent
from covid_deaths
order by location;

-- 5.Total deaths vs total cases in India
select location, total_cases, total_deaths, (total_deaths*100.0/NULLIF(total_cases,0)) as death_percent
from covid_deaths
where location = 'India';

-- 6.Highest infection rate vs population
select location,population , MAX(total_cases) as HighestInfectionCount ,
MAX((total_cases * 1.0/NULLIF(population,0))*100) as PercentPopulationInfected
from covid_deaths
where location='India'
group by location, population
order by PercentPopulationInfected;

-- 7.Highest Death Count
select location, population, MAX(total_deaths) as HighestDeathCount
from covid_deaths
group by location, population
order by HighestDeathCount desc;


-- 8.Which continent got most affected 
select continent, SUM(COALESCE(total_cases,0)) as total_cases
from covid_deaths
group by continent
order by total_cases desc;

-- 9.Which continent has most deaths
select continent, SUM(COALESCE(total_deaths,0)) as total_deaths
from covid_deaths
group by continent
order by total_deaths desc;

-- 10.Which contient has the most highest infection rate
select continent, MAX((total_cases*1.0/NULLIF(population,0))) as InfectionRate
from covid_deaths
group by continent
order by InfectionRate desc;


--Vaccine Table
select * 
from covid_vaccine;


-- 11.Fully Vaccinated rate per country
select location,  SUM(people_fully_vaccinated*1.0/NULLIF(total_vaccinations,0)) as Vaccine_Rate
from covid_vaccine
--group by location 
order by Vaccine_Rate desc;


-- 12.total cases of covid reported world wide
select sum(total_cases) as Total_Cases
from covid_deaths;

-- 13.new cases reported today 
select top 1 sum(new_cases) as New_Cases, date
from covid_deaths
group by date
order by date desc;


-- 14.smoothed avg of new cases over 2021
select AVG(NULLIF(new_cases_smoothed,0)) as Smoothed_new_cases, year(date)
from covid_deaths
where year(date) = '2021'
group by year(date);

-- 15.total deaths reported globally 
select sum(total_deaths) as Total_deaths
from covid_deaths;


-- 16.current mortaity rate 
select (NULLIF(total_deaths,0)/NULLIF(total_cases,0)) as Current_Mortality_rate
from covid_deaths;



-- 17.which country has highest deaths per million
select top 1 sum(total_deaths_per_million) as total_deaths_mil, location
from covid_deaths
group by location
order by sum(total_deaths_per_million) desc ;

-- 18.total cases per million for UK 
select sum(total_cases_per_million) as total_cases_mil , 'UK' as country
from covid_deaths
where location like '%Kingdom';

-- 19.countries with top deaths per million 
select top 10 sum(total_deaths_per_million) as total_deaths_mil, location
from covid_deaths
group by location 
order by sum(total_deaths_per_million) desc;

-- 20.paitents in ICU currently
select sum(icu_patients) as total_patients, year(date)
from covid_deaths
group by year(date)
order by sum(icu_patients) desc;

-- 21.trend in 2020 vs 2021
select MAX((total_deaths*1.0/NULLIF(total_cases,0))) *100 as mortality_rate, year(date)
from covid_deaths
group by year(date)
order by mortality_rate desc;

-- 22.reproduction rate in every country 
select AVG(reproduction_rate) as rate , location 
from covid_deaths
group by location
order by rate desc;

-- 23.which country has most people vaccinated per hundred
select sum(total_vaccinations_per_hundred) as vaccinated_100 , location, year(date)
from covid_vaccine
group by year(date),location
order by year(date) asc,vaccinated_100 desc;

-- 24.is there a relation between cases and population
SELECT    (
        (SUM(population * total_cases) - SUM(population) * SUM(total_cases) / COUNT(*)) /
        (SQRT((SUM(POWER(population, 2)) - POWER(SUM(population), 2) / COUNT(*)) *
              (SUM(POWER(total_cases, 2)) - POWER(SUM(total_cases), 2) / COUNT(*))))) as correlation
FROM covid_deaths;

select
(
        (SUM(CAST(population AS DECIMAL(38, 0)) * CAST(total_cases AS DECIMAL(38, 0))) -
         SUM(CAST(population AS DECIMAL(38, 0))) * SUM(CAST(total_cases AS DECIMAL(38, 0))) / COUNT(*)) /
        (SQRT((SUM(POWER(CAST(population AS DECIMAL(38, 0)), 2)) -
              POWER(SUM(CAST(population AS DECIMAL(38, 0))), 2) / COUNT(*)) *
             (SUM(POWER(CAST(total_cases AS DECIMAL(38, 0)), 2)) -
              POWER(SUM(CAST(total_cases AS DECIMAL(38, 0))), 2) / COUNT(*)))
    )) AS correlation
from covid_deaths

-- 25.Which country has the most positive rate 
select top 10 AVG(positive_rate)*100 as on_avg_positive_rate , location 
from covid_vaccine
group by location
order by AVG(positive_rate)*100 desc;


-- 26.Population vs people fully vaccinated 
select (sum(v.people_fully_vaccinated)/sum(d.population))*100 as percent_peoply_fully_vaccinated , d.location 
from covid_vaccine as v
inner join covid_deaths as d
on v.iso_code = d.iso_code
group by d.location;
