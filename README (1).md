# Pizza Hut Sales Analysis Using SQL

## Project Overview

This project analyzes Pizza Hut sales data using SQL to explore order volume, revenue, pizza preferences, category performance, and sales trends. It uses multiple relational tables to answer business questions and demonstrate SQL-based data analysis.

## Business Objectives

- Measure total orders and sales revenue.
- Identify the highest-priced pizza and most commonly ordered pizza size.
- Find the most ordered pizza types and categories.
- Analyze order distribution by hour and average pizzas ordered per day.
- Compare pizza types by revenue.
- Examine revenue contribution and cumulative revenue over time.
- Rank top-performing pizzas within each category.

## Dataset

The SQL analysis uses these tables:

- `orders` — order information, including order ID, date, and time.
- `order_details` — pizza quantities associated with orders.
- `pizzas` — pizza details, including size, pizza type ID, and price.
- `pizza_types` — pizza names and categories.

The analysis joins these tables using their related IDs.

## Tools and SQL Concepts

**Tools:** SQL, relational database

**SQL concepts demonstrated:**

- `SELECT`, `WHERE`/filtering where applicable, and `ORDER BY`
- Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
- `GROUP BY`
- `JOIN` operations
- Subqueries
- Common Table Expressions (CTEs)
- Window functions: `SUM() OVER()` and `RANK() OVER()`
- Date and time analysis using `HOUR()`
- Revenue calculations and percentage contribution
- Top-N analysis using `LIMIT`

## Business Questions Answered

1. How many orders were placed?
2. What was the total revenue generated from pizza sales?
3. Which pizza had the highest price?
4. Which pizza size was ordered most frequently?
5. What were the five most ordered pizza types by quantity?
6. How many pizzas were ordered in each category?
7. How were orders distributed by hour of the day?
8. How many pizza types were in each category?
9. What was the average number of pizzas ordered per day?
10. Which three pizza types generated the highest revenue?
11. What percentage of revenue did each pizza category contribute?
12. How did cumulative revenue change over time?
13. Which three pizza types generated the most revenue within each category?

## Analysis Highlights

The SQL scripts cover:

- **Sales performance:** order count and total revenue.
- **Product popularity:** popular sizes and pizza types based on quantity.
- **Category performance:** quantity and revenue comparisons across categories.
- **Time-based trends:** hourly order patterns, daily average quantity, and cumulative revenue.
- **Revenue ranking:** top pizzas overall and within each category.

## Repository Contents

- `pizzahut sql project.sql` — SQL queries used to perform the analysis.

## How to Run

1. Set up a database containing the required pizza sales tables.
2. Ensure the tables and column names match those used in the SQL script.
3. Open the SQL file in your database tool.
4. Execute the queries and review the result sets.

## Key Findings

Add your verified findings here after running the queries—for example, the total revenue, most popular pizza size, highest-revenue pizza, and busiest ordering hour.

*This README describes the analysis performed by the SQL script. Numerical findings should be added from the actual query outputs.*
