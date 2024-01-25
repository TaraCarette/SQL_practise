-- asking which customers should be targeted for marketing

WITH
-- ordering the customers by amount of profit made off of them
profit_tbl AS (
    SELECT o.customerNumber,
           ROUND(SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)), 2) AS profit
      FROM orders AS o
      JOIN orderdetails AS od
        ON o.orderNumber = od.orderNumber
      JOIN products AS p
        ON od.productCode = p.productCode
     GROUP BY o.customerNumber
     ORDER BY profit DESC
)

-- creating a table with full customer information paired with the profit
SELECT c.contactLastName, c.contactFirstName, c.city, c.country,
       p.profit
  FROM customers AS c
  JOIN profit_tbl AS p
    ON p.customerNumber = c.customerNumber
 ORDER BY p.profit
 LIMIT 5;