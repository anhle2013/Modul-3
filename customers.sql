SELECT * FROM classicmodels.customers;
SELECT customerName, phone, city, country FROM classicmodels.customers;

SELECT * FROM classicmodels.customers WHERE customerName = 'Atelier Graphique';
SELECT * FROM customers WHERE customername like '%A%';
SELECT * FROM customers WHERE city IN ('Nantes','Las Vegas','Warszawa','NYC') 