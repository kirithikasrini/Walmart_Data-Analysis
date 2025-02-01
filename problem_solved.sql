select * from walmart;

-- drop table walmart;
-- EDA 
select count(*) from walmart;

select payment_method,count(*) from walmart group by payment_method;

select count(distinct branch) from walmart;

select max(quantity) from walmart;

-- Business Problem 

-- 1. Find different payment and number of transactions,number of qty sold

select payment_method,
	count(*) as no_payment, 
	sum(quantity) as no_qty_sold 
	from walmart 
	group by payment_method;

--2.Identity the highest_rated category in each branch,displaying the branch caatgeory 
-- AVG rating 

select * from(select 
	branch, category, avg(rating) as avg_rating,
	rank() over (partition by branch order by avg(rating) desc) as rank
	from walmart
	group by 1,2)
	where rank = 1;

--3. Identitfy the busiest day for each branch based on the number of transactions

select * from 
	(select branch , to_char(to_date(date,'DD/MM/YY'),'Day') as day_name,
	count(*) as no_transactions,
	rank() over (partition by branch order by count(*) desc) as rank 
	from walmart 
	group by 1,2
	)
where rank = 1;

--4. Calculate the total quantity of items sold per payment method.List payment_method and total quantity.

select payment_method , 
sum(quantity) as no_qty_sold
from walmart 
group by payment_method;

--5. -- Determine the average, minimum, and maximum rating of category for each city. 
-- List the city, average_rating, min_rating, and max_rating.

 select city, category , max(rating) as max_rating ,
min(rating) as min_rating,
avg(rating) as avg_rating
from walmart 
group by 1,2;

--6.-- Calculate the total profit for each category by considering total_profit as
-- (unit_price * quantity * profit_margin). 
-- List category and total_profit, ordered from highest to lowest profit.

select category , 
	sum(total) as total_revenue,
	sum (total * profit_margin) as profit
from walmart 
group by 1;

--7. Determine the most common payment method for each Branch. 
-- Display Branch and the preferred_payment_method.

WITH cte 
AS
(select
	branch,
	payment_method,
	count(*) as total_trans,
	rank() over( partition by branch order by count(*) DESC) as rank
from walmart
group by 1, 2
)
select *
from cte
WHERE rank = 1;

--8.Categorize sales into 3 group MORNING, AFTERNOON, EVENING 
-- Find out each of the shift and number of invoices

select
	branch,
case 
		when extract(hour from (time::time)) < 12 then 'Morning'
		when extract(hour from(time::time)) between 12 and 17 then  'Afternoon'
		else 'Evening'
	end day_time,
	count(*)
from walmart
group by 1, 2
order by 1, 3 DESC;


--9.Identify 5 branch with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)
--rdr == last_rev-cr_rev/ls_rev*100

select *,
extract(year from TO_DATE(date, 'DD/MM/YY')) as formated_date
from walmart

-- 2022 sales
with revenue_2022
as
(	select 
		branch,
		sum(total) as revenue
	from walmart
	where extract(year from TO_DATE(date, 'DD/MM/YY')) = 2022 
	group by 1
),

revenue_2023
	as
( select 
		branch,
		sum(total) as revenue
	from walmart
	where extract(year from TO_DATE(date, 'DD/MM/YY')) = 2023
	group by 1
)
	select 
	ls.branch,
	ls.revenue as last_year_revenue,
	cs.revenue as cr_year_revenue,
	ROUND(
		(ls.revenue - cs.revenue)::numeric/
		ls.revenue::numeric * 100, 
		2) as rev_dec_ratio
FROM revenue_2022 as ls
JOIN
revenue_2023 as cs
ON ls.branch = cs.branch
WHERE 
	ls.revenue > cs.revenue
ORDER BY 4 DESC
LIMIT 5;

--10. which branches have the highest and lowest total sales?

select branch,city,sum(total) as branch_revenue
from walmart
group by branch,city
order by branch_revenue desc;

-- 11. which payment method is most frequent used ?

select payment_method,count(*) as usage_count 
from walmart
group by payment_method
order by usage_count desc;

-- 12. which categoties have the highest customer rating ? 

select category, round(avg(rating):: numeric,2) as avg_rating
from walmart
group by category
order by avg_rating desc;