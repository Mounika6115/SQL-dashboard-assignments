1.Write a SQL query to select products with an average sale price greater than $100, using the HAVING clause to filter the results.
   SELECT product_name, AVG(sale_price) AS average_sale_price
FROM Sales
GROUP BY product_name
HAVING AVG(sale_price) > 100;

2.Develop a SQL query that groups sales data by region and uses the HAVING clause to identify regions with total sales exceeding $10,000.
SELECT region, SUM(sales_amount) AS total_sales
FROM Sales
GROUP BY region
HAVING SUM(sales_amount) > 10000;
3.Create a SQL query to find products with a sales count greater than 50, applying the HAVING clause to filter the grouped data.
        SELECT product_name, COUNT(*) AS sales_count
FROM Sales
GROUP BY product_name
HAVING COUNT(*) > 50;

4.Write a SQL query that calculates the total sales for each product and uses the HAVING clause to select products with total sales between 5,000and20,000.
        SELECT product_name, SUM(sales_amount) AS total_sales
FROM Sales
GROUP BY product_name
HAVING SUM(sales_amount) BETWEEN 5000 AND 20000;
5.Optimize each query for performance, considering indexing, subqueries, and other relevant SQL techniques.
-- Create indexes for better performance
CREATE INDEX idx_product_name ON Sales(product_name);
CREATE INDEX idx_region ON Sales(region);
CREATE INDEX idx_sale_price ON Sales(sale_price);
CREATE INDEX idx_sales_amount ON Sales(sales_amount);

-- Optimized query using WHERE, GROUP BY and HAVING
SELECT product_name,
       SUM(sales_amount) AS total_sales
FROM Sales
WHERE sales_amount > 0
GROUP BY product_name
HAVING SUM(sales_amount) BETWEEN 5000 AND 20000;
