
CREATE DATABASE LAB4;
CREATE TABLE customers(
  id SERIAL primary key ,
  name varchar(255),
  city varchar(255),
  grade INT,
  salesman_id int
);
drop table customers;
INSERT INTO customers (id,name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100,5001),
                             (3005,'Graham Zusi','California',200,5002),
                             (3001,'Brad Guzan','London',5 ,5005);
SELECT * FROM customers WHERE grade>100;
SELECT * FROM customers WHERE city='New York' AND grade>100;
SELECT * FROM customers WHERE city='New York' OR grade>100;
SELECT * FROM customers WHERE city='Paris' OR city='Roma';
SELECT * FROM customers WHERE name LIKE 'B%';
CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY ,
  customer_id INT,
  description TEXT,
  purch_amt INT
);
SELECT * FROM orders WHERE customer_id IN( SELECT id FROM customers WHERE city='New York');
SELECT * FROM customers WHERE ID IN(SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(customer_id)>10);
SELECT sum(purch_amt) FROM orders;
SELECT AVG(purch_amt) FROM orders;
SELECT * FROM customers WHERE name IS NOT NULL;
SELECT MAX(purch_amt) FROM ORDERS;
DROP TABLE orders;
DROP TABLE customers;