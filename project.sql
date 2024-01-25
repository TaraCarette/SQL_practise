-- using this to explore the database

-- query to get information on the organization of the database
SELECT 'Customers' AS table_name,
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM customers) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('customers')
  
 UNION
 
SELECT 'Products',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM products) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('products')
  
 UNION
 
SELECT 'ProductLines',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM productlines) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('productlines')
  
 UNION
 
SELECT 'Orders',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM orders) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('orders')
  
 UNION
 
SELECT 'OrderDetails',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM orderdetails) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('orderdetails')
  
 UNION
 
SELECT 'Payments',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM payments) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('payments')
  
 UNION
 
SELECT 'Employees',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM employees) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('employees')
  
 UNION
 
SELECT 'Offices',
       COUNT(*) AS number_of_attribites,
       (SELECT COUNT(*)
          FROM offices) AS number_of_attribites
  FROM PRAGMA_TABLE_INFO('offices');