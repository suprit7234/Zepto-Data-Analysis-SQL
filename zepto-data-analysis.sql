create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

select * from zepto limit 5;

--different product category

select distinct category from zepto
group by category;

--product in stocks vs out of stocks

select outofstock, count(sku_id) from zepto
group by outofstock;

--productname present multiple times

select name, count(sku_id) as "Nos of skus" from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning
--product with price = 0

select *from zepto limit 5;

select * from zepto
where mrp = 0 or discountedsellingprice = 0;

--delete this column

delete from zepto
where mrp = 0;

-- convert paise into rupees

update zepto 
set mrp = mrp / 100.0,
      discountedsellingprice = discountedsellingprice / 100.0;

--data analysis

-- Q1. Find the top 5 best-value products based on the discount percentage.	  

select name,mrp,discountpercent,discountedsellingprice from zepto
order by discountpercent desc
limit 5;

--Q2.What are the Products with High MRP but Out of Stock

select name,mrp,outofstock from zepto
where outofstock = 'true' and mrp > 300
order by mrp desc;

--Q3.Calculate Estimated Revenue for each category

select category, sum(discountedsellingprice * availablequantity) as Revenue
from zepto
group by category
order by Revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name,mrp,discountpercent from zepto
where mrp > 500 and discountpercent < 10;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

--Q9.Find Top 3 Most Expensive Products in Each Category
SELECT *
FROM (
    SELECT 
        Category,
        name,
        mrp,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY mrp DESC) AS rank
    FROM zepto
) 
WHERE rank <= 3;

--Q10.Find Discount Impact (Actual Savings per Product)

SELECT 
    name,
    mrp,
    discountedSellingPrice,
    (mrp - discountedSellingPrice) AS savings
FROM zepto
ORDER BY savings DESC;

--Q11.Find Category Contribution to Total Revenue

SELECT 
    Category,
    SUM(discountedSellingPrice * quantity) AS total_revenue,
    ROUND(
        SUM(discountedSellingPrice * quantity) * 100.0 /
        SUM(SUM(discountedSellingPrice * quantity)) OVER (),
    2) AS contribution_percent
FROM zepto
GROUP BY Category;

--Q12.Rank Products by Discount Within Category

SELECT 
    Category,
    name,
    discountPercent,
    RANK() OVER (PARTITION BY Category ORDER BY discountPercent DESC) AS rank
FROM zepto;

--Q13.Find Most Profitable Category

SELECT DISTINCT
    Category,
    SUM(discountedSellingPrice * quantity) OVER (PARTITION BY Category) AS category_revenue
FROM zepto
ORDER BY category_revenue DESC;

--Q14.Identify “High Value – Low Stock Risk” Products

WITH revenue_cte AS (
    SELECT 
        name,
        Category,
        availableQuantity,
        (discountedSellingPrice * quantity) AS revenue
    FROM zepto
)
SELECT *
FROM revenue_cte
WHERE availableQuantity < 10

--Q15.Customer Psychology Pricing Buckets

SELECT 
    name,
    mrp,
    CASE 
        WHEN mrp < 100 THEN 'Low Price'
        WHEN mrp BETWEEN 100 AND 500 THEN 'Medium Price'
        ELSE 'Premium'
    END AS price_segment
FROM zepto;
ORDER BY revenue DESC;