SELECT * FROM DA_Project.CovidDeaths;

-- Selecting the data

SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM DA_Project.CovidDeaths
order by 1,2;

-- Looking for Percentage of death per cases in India

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM DA_Project.CovidDeaths
Where location like '%india%'
order by 1,2;

-- Looking for Total Cases, Total Deaths, Death Percentage(For Visualization)

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as SIGNED)) as total_deaths, SUM(cast(new_deaths as SIGNED))/SUM(New_Cases)*100 as DeathPercentage
From DA_Project.CovidDeaths
where continent is not null 
order by 1,2;

-- Total Death count per location(FOR Visualization)

Select location, SUM(cast(new_deaths as signed)) as TotalDeathCount
From DA_Project.CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc;

-- Looking for total cases per population in India

SELECT location, date, total_cases, population, (total_cases/population)*100 as Percent_Of_Population_Infected
FROM DA_Project.CovidDeaths
Where location like '%india%'
order by 1,3;

-- Looking for a country with highest infection rate compared to population(For Visualization)

SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as Percent_Of_Population_Infected
FROM DA_Project.CovidDeaths
GROUP BY location, population
order by Percent_Of_Population_Infected DESC;

-- Looking for a country with highest infection rate compared to population per date(For Visualization)

SELECT location, population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as Percent_Of_Population_Infected
FROM DA_Project.CovidDeaths
GROUP BY location, population, date
order by Percent_Of_Population_Infected DESC;

-- Countries with Highest Mortality Rate

SELECT location, MAX(total_deaths) as Total_Death_Count
FROM DA_Project.CovidDeaths
WHERE continent is NOT NULL
GROUP BY location
ORDER BY Total_Death_Count DESC;




