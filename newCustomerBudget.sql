-- asking the value of each customer, and therefore how much money can be spent acquiring new customers
WITH
money_per_customer AS (
    SELECT o.customerNumber,
           SUM((od.priceEach - p.buyPrice) * od.quantityOrdered) AS revenue
      FROM orders o
      JOIN orderdetails od
        ON o.orderNumber = od.orderNumber
      JOIN products p
        ON p.productCode = od.productCode
     GROUP BY o.customerNumber
)
SELECT AVG(revenue) AS lvt
  FROM money_per_customer;