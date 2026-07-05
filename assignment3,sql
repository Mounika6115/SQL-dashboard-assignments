Tasks / Requirements
1.Write a SQL query to retrieve the titles of all books written by authors from the United States.
SELECT b.title
FROM Books b
JOIN Authors a
ON b.author_id = a.author_id
WHERE a.country = 'United States';

2.Write a SQL query to find the total sales of books in the fiction category.
SELECT SUM(s.sales_amount) AS total_sales
FROM Sales s
JOIN Books b
ON s.book_id = b.book_id
WHERE b.category = 'Fiction';
3.Write a SQL query to retrieve the names of authors who have written more than one book.
SELECT a.author_name
FROM Authors a
JOIN Books b
ON a.author_id = b.author_id
GROUP BY a.author_id, a.author_name
HAVING COUNT(b.book_id) > 1;
4.Create a SQL query to retrieve the title, publication year, and sales amount for all books published after 2010, sorted in descending order by sales amount.
SELECT title, publication_year, sales_amount
FROM Books
WHERE publication_year > 2010
ORDER BY sales_amount DESC;
