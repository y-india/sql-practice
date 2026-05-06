-- task 6
Create one to many and many to many relationships
in a shopping store context using 3 tables .
	1. customers , 2. orders , 3. products 
- Inculde price column in the products table and display the realtionship
between customers and their orders  along with details of the products 
in each order .


-- START 

create table customers( cust_name VARCHAR(30) , id NUMERIC ) ;

INSERT INTO customers (cust_name, id) VALUES
('Rahul Mehra', 1),
('Anita Sharma', 2),
('Vikram Singh', 3),
('Priya Desai', 4),
('Ramesh Kumar', 5);


select * from customers ;






ALTER TABLE customers
ADD CONSTRAINT customers_pk PRIMARY KEY (id);






CREATE TABLE orders (
    ord_id NUMERIC PRIMARY KEY ,
    cust_id NUMERIC REFERENCES customers(id),
    ord_date DATE
);



select * from orders ;





INSERT INTO orders (cust_id, ord_date) VALUES
(1, '2026-01-02'),
(3, '2026-01-04'),
(2, '2026-01-05'),
(5, '2026-01-06'),
(4, '2026-01-08'),
(1, '2026-01-09'),
(3, '2026-01-11'),
(2, '2026-01-12'),
(5, '2026-01-15'),
(4, '2026-01-17');



CREATE SEQUENCE orders_ord_id_seq;

ALTER TABLE orders
ALTER COLUMN ord_id SET DEFAULT nextval('orders_ord_id_seq');






















create table products (
prod_id SERIAL PRIMARY KEY  ,
cust_id NUMERIC REFERENCES customers(id)
);


ALTER TABLE products
ADD COLUMN prod_name VARCHAR(200),
ADD COLUMN number_of_items NUMERIC;



select * from products ;








INSERT INTO products (cust_id, prod_name, number_of_items) VALUES
(1, 'Laptop', 2),
(2, 'Mobile Phone', 5),
(3, 'Headphones', 10),
(4, 'Keyboard', 3),
(5, 'Mouse', 7),
(1, 'Monitor', 1),
(2, 'Tablet', 2),
(3, 'Webcam', 4),
(4, 'Printer', 1),
(5, 'External Hard Drive', 3);




select * from products ;








select * from customers , products , orders ;


ALTER TABLE products
ADD COLUMN price NUMERIC(10,2);



UPDATE products SET price = 55000.00 WHERE prod_name = 'Laptop';
UPDATE products SET price = 15000.00 WHERE prod_name = 'Mobile Phone';
UPDATE products SET price = 2000.00  WHERE prod_name = 'Headphones';
UPDATE products SET price = 3000.00  WHERE prod_name = 'Keyboard';
UPDATE products SET price = 1200.00  WHERE prod_name = 'Mouse';
UPDATE products SET price = 12000.00 WHERE prod_name = 'Monitor';
UPDATE products SET price = 18000.00 WHERE prod_name = 'Tablet';
UPDATE products SET price = 2500.00  WHERE prod_name = 'Webcam';
UPDATE products SET price = 8000.00  WHERE prod_name = 'Printer';
UPDATE products SET price = 4500.00  WHERE prod_name = 'External Hard Drive';
























SELECT * FROM products;







--
Inculde price column in the products table and display the realtionship
between customers and their orders  along with details of the products 
in each order .
--



-- final query 
SELECT 
    c.cust_name,
    c.id AS cust_id,
    p.prod_id,
    p.prod_name,
    p.number_of_items,
    p.price,
    o.ord_id,
    o.cust_id AS order_cust_id,
    o.ord_date
FROM customers c
JOIN orders o ON c.id = o.cust_id
JOIN products p ON c.id = p.cust_id
ORDER BY c.id, o.ord_id, p.prod_id;



