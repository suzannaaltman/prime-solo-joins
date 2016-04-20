-- 1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.address_type, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers
JOIN addresses
ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM orders
LEFT OUTER JOIN line_items
ON orders.id = line_items.order_id;

-- 3. Which warehouses have cheetos?
SELECT products.id, products.description, warehouse_product.warehouse_id
FROM products
JOIN warehouse_product
ON products.id = warehouse_product.product_id
WHERE products.id = 5;


-- 4. Which warehouses have diet pepsi?
SELECT products.id, products.description, warehouse_product.warehouse_id
FROM products
JOIN warehouse_product
ON products.id = warehouse_product.product_id
WHERE products.id = 6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, count(orders.id) AS "order count"
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id
JOIN orders
ON addresses.id = orders.address_id
GROUP BY customers.id;

-- 6. How many customers do we have?
SELECT count(customers.id)
FROM customers;

-- 7. How many products do we carry?
SELECT count(DISTINCT products.description)
FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, sum(warehouse_product.on_hand) AS "total on hand"
FROM products
JOIN warehouse_product
ON products.id = warehouse_product.product_id
WHERE products.id = 6
GROUP BY products.description;
