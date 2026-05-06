


CREATE VIEW project_table_query AS 
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





select * from project_table_query ;








