/*  Assignment.sql 
    Oscar Villagrana
    CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore;

/* Query 1 */
-- Write a SELECT statement that joins the category table to the product table and returns these columns: category_name, product_name, and list_price.
-- Sort the result set by category_name and then by product_name in ascending sequence.
SELECT category_name, product_name, list_price
FROM product 
INNER JOIN category
USING (category_id) 
ORDER BY category_name, product_name;

/* Query 2 */
-- Write a SELECT statement that joins the customer table to the address table and returns these columns: first_name, last_name, line1, city, state, zip_code. 
-- Return one row for each address for the customer with an email address of heatheresway@mac.com
SELECT first_name, last_name, line1, city, 'state', zip_code
FROM customer c INNER JOIN address a 
ON c.customer_id = a.customer_id
AND c.email_address <> 'heatheresway@mac.com'
UNION ALL
SELECT first_name, last_name, line1, city, 'state', zip_code
FROM customer c INNER JOIN address a 
ON c.customer_id = a.customer_id
AND c.email_address = 'heatheresway@mac.com'
AND a.line1 > 330;


/* Query 3 */
-- Write a SELECT statement that joins the customer table to the address table and returns these columns: first_name, last_name, line1, city, state, and zip_code.
-- Return one row for each customer, but only return addresses that are the shipping address for a customer.
SELECT first_name, last_name, line1, city, 'state', zip_code
FROM customer c INNER JOIN address a
USING (customer_id)
WHERE c.shipping_address_id = a.address_id
;

/* Query 4 */
-- Write a SELECT statement that joins the customer, orders, orderitems, and product tables. 
-- This statement should return these columns: last_name, first_name, order_date, product_name, item_price, and quantity. 
-- Use aliases for the tables.
-- Sort the final result set by last_name and order_date.
SELECT last_name, first_name, order_date, product_name, item_price, quantity
FROM customer c INNER JOIN orders o 
USING (customer_id)
INNER JOIN orderitems oi
ON oi.order_id = o.order_id
INNER JOIN product p
ON p.product_id = oi.product_id
ORDER BY last_name, order_date
;

/* Query 5 */
-- Write a SELECT statement that returns the product_name and list_price columns from the product table. 
-- Return one row for each product that has the same list price as another product.
-- Sort the result set by product_name.
-- Hint: Use a self-join to check that the product_id columns aren’t equal, but the list_price columns are equal.
/* Ambiguous */
SELECT p1.product_name, p1.list_price
FROM product p1 INNER JOIN product p2
ON (p1.product_id = p2.product_id)
AND p1.product_id > p2.product_id
ORDER BY p1.product_name
;

AND p1.list_price = p2.list_price

/* Query 6 */
-- Write a SELECT statement that displays the product ID, product name, list price, vendor name, and category name for all products. Sort the results by product ID.
/* Ambiguous */
SELECT p.product_id, p.product_name, p.list_price, v.company_name, p.vendor_id, c.category_name
FROM product p
INNER JOIN vendor v
ON (p.vendor_id = v.VENDOR_id)
INNER JOIN category c
ON (p.category_id = c.category_id)
ORDER BY p.product_id;


/* Query 7 */
-- Write a SELECT statement that displays the product ID, product name, and list price for products in the category whose category name value is Computer. Sort the results by product ID.
SELECT product_ID, product_name, list_price
FROM category
JOIN
ORDER BY product_ID
;

/* Query 8 */
-- For each line item of a sales transaction, display the order ID, date of the order, name of the product that was sold, quantity sold, and the amount charged.
SELECT order_ID, order_date, product_name_sold, quantity_sold, amount_charged
FROM
JOIN
;

/* Query 9 */
-- Determine which orders have not yet shipped and the name of the customer who placed the order.
-- Sort the results by the date on which the order was placed. Display the first name, last name, order ID, order date, and ship date.
SELECT first_name, last_name, order_ID, order_date, ship_date
FROM
JOIN
WHERE shipped = false
ORDER BY date_order_placed
;

/* Query 10 */
-- Write an SQL statement that displays last name and first name of customers who have purchased a product that costs more than $1300.
SELECT last_name, first_name
FROM
JOIN
WHERE cost > 1300
;

/* Query 11 */
-- Determine which products customer Christine Brown has purchased. Perform the search using the customer name, not the customer ID.
SELECT customer_name
FROM 
JOIN
;

/* Query 12 */
-- Write an SQL statement that displays last name, first name, and customer ID of customers who have ordered a product that has product id 2234.
SELECT last_name, first_name, customer_ID
FROM
JOIN

;