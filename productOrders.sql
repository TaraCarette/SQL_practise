-- answering the question of which product more should be ordered of

WITH
-- finding the top 10 lowest stocks
low_stock_table AS (
    SELECT p.productCode, p.productName,
           ROUND(SUM(o.quantityOrdered) / p.quantityInStock, 2) AS lowStock
      FROM products AS p
      JOIN orderdetails as o
        ON p.productCode = o.productCode
     GROUP BY p.productCode
     ORDER BY lowStock DESC
     LIMIT 10
),
product_performance_table AS (
-- finding the top 10 best performing products
    SELECT productCode,
           ROUND(SUM(quantityOrdered * priceEach), 2) AS productPerformance
      FROM orderdetails
     GROUP BY productCode
     ORDER BY productPerformance DESC
     LIMIT 10
)
-- finding which of the best products are on the lowest stock list
SELECT productCode, productName
  FROM low_stock_table AS l
 WHERE l.productCode IN (SELECT productCode 
                           FROM product_performance_table);