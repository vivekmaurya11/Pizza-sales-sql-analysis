 -- Project: Pizza Hut Sales Analysis
-- Purpose: Analyze pizza orders, sales revenue, popular products,
--          category performance, and sales trends using SQL.

-- Database: MySQL

-- Retrieve the total number of orders placed.

select count(order_id) as total_order from orders;

-- Calculate the total revenue generated from pizza sales.

select round(sum(od.quantity*p.price),2) as total_sales
from order_details as od
join pizzas as p
using(pizza_id);

-- Identify the highest-priced pizza.

select pt.name,p.price
from pizza_types as pt
join pizzas as p
using(pizza_type_id)
order by p.price desc limit 1;

 -- Identify the most common pizza size ordered.
 
 select p.size,count(od.order_details_id)as order_count
 from pizzas as p
 join order_details as od
 using(pizza_id)
 group by p.size
 order by order_count desc;
 
-- List the top 5 most ordered pizza types along with their quantities.

select pt.name,sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas  as p
using(pizza_type_id)
join order_details as od
using(pizza_id)
group by pt.name
order by total_quantity desc
limit 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pt.category,sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas as p
on p.pizza_type_id=pt.pizza_type_id
join order_details as od
on od.pizza_id=p.pizza_id
group by pt.category;

-- Determine the distribution of orders by hour of the day.

select hour(order_time),count(order_id)
 from orders 
group by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.

select category,count(name) 
from pizza_types
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(quantity),2) from
(select o.order_date,sum(od.quantity) as quantity
from orders as o
join order_details as od
using(order_id)
group by o.order_date) as order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.

select pt.name,sum(od.quantity*p.price) as revenue
from pizza_types as pt
join pizzas as p
on p.pizza_type_id=pt.pizza_type_id
join order_details as od
using(pizza_id)
group by pt.name
order by revenue desc
limit 3;

-- Calculate the percentage contribution of each pizza type to total revenue.

WITH category_revenue AS (SELECT
        pt.category,
        SUM(od.quantity * p.price) AS revenue
    FROM pizza_types AS pt
    JOIN pizzas AS p
        ON pt.pizza_type_id = p.pizza_type_id
    JOIN order_details AS od
        ON od.pizza_id = p.pizza_id
    GROUP BY pt.category)
SELECT category,ROUND(revenue / SUM(revenue) OVER () * 100, 2)
        AS revenue_percentage
FROM category_revenue
ORDER BY revenue_percentage DESC;


-- Analyze the cumulative revenue generated over time.
select order_date,round(sum(revenue) over(order by order_date),2) as cum_revenue
from 
(select o.order_date,
round(sum(od.quantity*p.price),2) as revenue
from order_details as od
join pizzas as p
on od.pizza_id=p.pizza_id
join orders as o
on o.order_id=od.order_id
group by o.order_date) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select  name,revenue from 
(select category,name,revenue,rank()over(partition by category order by revenue desc) as rn
from
(select pt.category,pt.name,round(sum((od.quantity)*p.price),2) as revenue
from pizza_types as pt
join pizzas as p
on pt.pizza_type_id=p.pizza_type_id
join order_details as od
on od.pizza_id=p.pizza_id
group by pt.category,pt.name) as a) as b
where rn<=3;








