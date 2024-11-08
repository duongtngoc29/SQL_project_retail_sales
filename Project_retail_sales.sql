-- Sql project reatail sales 
Create Database sql_project_retail_sales;

-- Create table
Drop table if exists retail_sales; 
Create table retail_sales 
             (
             transactions_id int primary key,
             sale_date	date,
             sale_time	time,
             customer_id int,
             gender	 varchar(15),
             age int,
             category varchar(15),	
             quantiy int,	
			 price_per_unit	 float, 
             cogs float,
             total_sale float
             );
select *
from retail_sales;

Select count(*)
from retail_sales;
-- Data cleaning
select * 
from retail_sales
where transactions_id is null;

select * 
from retail_sales
where transactions_id is null
     or sale_date is null
	 or sale_time is null
	 or customer_id is null
	 or gender is null
	 or age is null
	 or category is null
	 or quantiy is null
	 or price_per_unit is null
	 or cogs is null
	 or total_sale is null;
-- 
Delete from retail_sales
where transactions_id is null
     or sale_date is null
	 or sale_time is null
	 or customer_id is null
	 or gender is null
	 or age is null
	 or category is null
	 or quantiy is null
	 or price_per_unit is null
	 or cogs is null
	 or total_sale is null;
-- Data exploration

-- How many sales we have?
select count(*) as total_sale from retail_sales
-- How many unique customers we have?
select count(distinct(customer_id)) from retail_sales
select distinct(category) from retail_sales

-- Data analysis and business problems and answers
-- 1.Retrieve all columns for sales made on '2022-11-05'.
select *
from retail_sales
where sale_date = '2022-11-05';
-- 2.Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.
select * 
from retail_sales
where category = 'Clothing' 
      and quantiy >= 4 
	  and to_char(sale_date, 'YYYY-MM') = '2022-11';
-- 3.Calculate the total sales (total_sale) for each category.
select category,
       sum(total_sale) as total_sale,
	   count(*) as total_order
from retail_sales
group by category;
-- 4.Find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age), 2) as average_age_customers
from retail_sales
where category = 'Beauty';
-- 5.Find all transactions where the total_sale is greater than 1000.
select transactions_id 
from retail_sales
where total_sale > 1000;
-- 6.Find the total number of transactions (transaction_id) made by each gender in each category.
select category,
       gender,
	   count(*) as total_transactions
from retail_sales
group by category,
         gender
order by category;
-- 7.Calculate the average sale for each month. Find out best selling month in each year
select year,
       month,
	   avg_sale
from (
  select extract( year from sale_date) as year,
         extract( month from sale_date) as month,
	     avg(total_sale) as avg_sale,
	     rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
   from retail_sales
   group by 1, 2) as t
where rank = 1
-- 8.Find the top 5 customers based on the highest total sales.
select customer_id,
       sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 desc
limit 5;
-- 9.Find the number of unique customers who purchased items from each category.
select category,
       count(distinct(customer_id)) as count_unique_customers
from retail_sales
group by category;
-- 10.Create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
with hourly_sale
as
(select *,
 case
     when extract(hour from sale_time) < 12 then 'Morning'
	 when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
	 else 'Evening'
	 End as shift
from retail_sales )
select shift,
       count(*) as total_orders
from hourly_sale
group by shift;
-- The end