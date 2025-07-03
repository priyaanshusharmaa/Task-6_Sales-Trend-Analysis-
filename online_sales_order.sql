select * from online_sales_orders;

-- TOTAL REVENUE WHERE ORDER STATUS = CPMPLETED
select year(order_date) as Years,round(sum(amount)) as total_revenue from online_sales_orders
where order_status = 'Completed'
group by year(order_date)
order by year(order_date);

-- RECENT YEARLY QUARTERLY SALES DATA
select year(order_date),Quarter(order_date) as Quaters,round(sum(amount)) as total_revenue
from online_sales_orders
group by year(order_date),Quarter(order_date)
order by year(order_date),quarter(order_date);

-- TOTAL VOLOUM OF DIFFERENT YEAR
select year(order_date) as Years,count(distinct order_id) as Total_voloum 
from 
	online_sales_orders
group by year(order_date)
order by year(order_date);

-- Top 3 Months by Revenue (All-Time)
SELECT 
    YEAR(order_date) AS year,
    MONTHNAME(order_date) AS month,
    ROUND(SUM(amount)) AS total_revenue
FROM 
    online_sales_orders
GROUP BY 
    year, month
ORDER BY 
    total_revenue DESC
LIMIT 3;

-- Most Popular Product Categories by Revenue Over Year
select year(order_date) as years,category,round(sum(amount)) as revenue
from online_sales_orders
group by category,year(order_date)
order by revenue,year(order_date)
limit 3;

-- Regional Revenue Distribution
SELECT
	year(order_date) as years,
    region,
    ROUND(SUM(amount)) AS total_revenue
FROM 
    online_sales_orders
GROUP BY 
    region,year(order_date)
ORDER BY 
    total_revenue,year(order_date);

-- Revenue by Payment Method
select payment_method, round(sum(amount)) as revenue
from online_sales_orders
group by payment_method
order by revenue desc;

-- Cancelled Orders Count & Revenue Loss
SELECT 
    YEAR(order_date) AS year,
    COUNT(order_id) AS cancelled_orders,
    ROUND(SUM(amount)) AS lost_revenue
FROM 
    online_sales_orders
WHERE 
    order_status = 'Cancelled'
GROUP BY 
    year
ORDER BY 
    year;