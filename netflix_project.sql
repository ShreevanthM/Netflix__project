--Netflix project 
drop table if exists netflix;
create table netflix (
	show_id	varchar(5),
	type varchar(10),
	title varchar(150),
	director varchar(208),
	casts varchar(1000),
	country varchar(150),
	date_added varchar(150),
	release_year int,
	rating	varchar(10),
	duration varchar(15),
	listed_in varchar(100),
	description varchar(250)
);

select * from netflix;

--1 
select type, count(*) as total_in_eachtype 
from netflix
group by type;

--2
select type ,rating,ranking from
(
select type , rating, 
rank()over(partition by type order by count(*) desc) as ranking 
from netflix 
group by type,2)as  t1 
where ranking=1

--3
select *
from netflix
where release_year=2020 
and type='Movie'


--4
select  unnest(string_to_array(country,',')) as new_country,
count(*) as total
from netflix
group by 1
order by 2 desc 
limit 5

--5
select title ,duration from netflix
where duration =(select max(duration) from netflix)and type='Movie'
order by 2 desc;

--6
select * from netflix
where to_date(date_added ,'Month DD-YYYY')>=current_date -interval'5 years'


--7
select * from netflix 
where director ilike '%Rajiv Chilaka%'

--8  
select * from netflix
where type='TV Show' and 
split_part(duration ,' ',1)::numeric >5

--9
select unnest(string_to_array (listed_in,',')) as genre, 
count(show_id)  as total_count
from netflix
group by 1 

--10
select extract(YEAR from to_date(date_added ,'Month DD-YYYY')) as year 
,count(*) as total_count,
round(count(*)::numeric/(select count(*) from netflix where country ='India')::numeric*100,2) as avg_
from netflix 
where country='India'
group by 1
order by 3 desc 
limit 5

--11
select * from netflix 
where  listed_in ilike '%Documentaries%'

--12
select * from netflix 
where director is null

--13
select * from netflix 
where casts ilike '%salman khan%'
and release_year >=extract(year from current_date ) - 10

--14 
select unnest(string_to_array(casts , ',')) as act ,count(*) as total_count
from netflix 
where country ilike '%india%' 
group by 1
order by 2 desc
limit 10

--15
with new_table as (select *, case 
when description ilike '%kill%' or 
description ilike '%violence' then 'bad_movie'
else 'good_movie'
end category 
from netflix) 
select category ,count(*) as total_content 
from new_table 
group by 1
