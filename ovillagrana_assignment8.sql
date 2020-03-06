/*  Assignment 8
    Oscar Villagrana
    CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore;

/* Query 1 */

-- Write a SELECT statement that returns these columns:
-- The count of the number of orders in the ORDERS table
-- The sum of the tax_amount column in the ORDERS table

/* Query 2 */


-- Write a SELECT statement that displays the product ID and the number of orders placed for each product.
-- Show the results in decreasing order and label result column NumOrders.


/* Query 3 */


-- Write a SELECT statement that returns one row for each category that has products with these columns:
-- The category_name column from the CATEGORY table
-- The count of the products in the PRODUCT table
-- The list price of the most expensive product in the PRODUCT table
-- Sort the result set so the category with the most products appears first.


/* Query 4 */
-- Write a SELECT statement that returns one row for each customer that has orders with these columns:
-- The email_address column from the CUSTOMER table
-- The sum of the item price in the ORDERITEMS table multiplied by the quantity in the ORDERITEMS table
-- The sum of the discount amount column in the ORDERITEMS table multiplied by the quantity in the ORDERITEMS -- table
-- Sort the result set in descending sequence by the item price total for each customer.



/* Query 5 */
-- Write a SELECT statement that returns one row for each customer that has orders with these columns:
-- The email_address from the CUSTOMER table
-- A count of the number of orders
-- The total amount for each order 
-- Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.
-- Return only those rows where the customer has more than 1 order.
-- Sort the result set in descending order by the sum of the line item amounts.

/* Query 6 */
-- Modify the solution to query 5 so it only counts and totals line items that have an item_price value that’s greater than 400.

/* Query 7 */
-- Write a SELECT statement that answers this question: Which customers have ordered more than one product? Return these columns:
-- The email address from the CUSTOMER table
-- The count of distinct products from the customer’s orders

/* Query 8 */
-- For each vendor, retrieve the vendor ID and the number of products with a list price of $100 or higher supplied by the vendor.


/* Query 9 */
-- Consider the groups of products where each group contains the products that are from the same category and supplied by the same vendor.
-- For each such group that has more than one product, retrieve the vendor id, product category id, number of products in the group, and average price of the products in the group.

/* Query 10 */
-- Determine how many products are in the Printer category.

/* Query 11 */
The following tables form a Library database held in an RDBMS:

Borrower (card_no , last_name , first_name , address , city , state , zip )
Books (ISBN, title, pub_date , pub_id , list_price, category_id, pub_id)
Categories (category_id, category_desc)
Author (author_id , last_name , first_name)
Bookauthor (ISBN, author_id)
Publisher (pub_id, name, contact, phone)
Bookloans (ISBN, branch_id, card_no , date_out, due_date)
Bookcopies (ISBN, branch_id , no_of_copies)
Branch (branch_id, branch_name, city)

Write SQL statements to perform the following queries:

    Display the last names and first names of all borrower who do not have any books checked out. Use a subquery.
    Determine the number of different borrowers who have borrowed books written or co-written by William White. USE a subquery.
    Determine which books were published by the publisher of “Intro to DB Systems-7th Ed ” USE a subquery. Display the title column.
    Display the last name, first name, and address of borrowers who have borrowed a book that was supplied by a  publisher with a publisher Name that begins with the letter P. Use a subquery.
    Determine which books have a list price that is less than or equal the average list price of other books in the same category. Display the title, category id, and list price columns. USE a subquery.
    Display the list price of the least expensive book in the Computer Science category.
    What’s the list price of the most expensive book written by Carlos Tim?
    Display how many times each book title has been borrowed.
    How many times has the book with ISBN “0401140733” been borrowed?

