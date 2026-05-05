USE ECommerceDB;
/* Question 1: ORDER BY & LIMIT 
Management wants to see the top 3 highest-priced products in the e-commerce system. 
Expected Output: 
Top 3 products with their product_id, product_name, and price. */

select product_id,product_name,price from product order by price desc limit 3;

/* Question 2: Aggregate Functions 
Management wants summary statistics of the sales data. 
Expected Output: 
Aggregated results showing total sales, average sale amount, highest and lowest sale amounts. */

select count(*) as Total_Records,sum(sale_amount) Total_sale_Amount,avg(sale_amount) Average_sale_Amount,
min(sale_amount) Minimum_Sale_Amount,max(sale_amount) Maximum_sale_Amount from sales;

/* Question 3: GROUP BY & HAVING 
Management wants to know which products have total sales amount greater than ₹100. 
Expected Output: 
List of products with product_id, product_name, and total sales amount greater than ₹100. */

select * from sales;
select * from product;
select product_id Product_ID,sum(sale_amount) Total_sales from sales group by product_id having Total_sales>100;

/* Question 4: Window Functions 
Management wants a ranking of products based on their prices. 
Expected Output: 
Each product with product_id, product_name, price, and rank according to price. */

select product_id,product_name,price,
	dense_rank() over(order by price desc) as Product_Rank_by_Price
    from product;