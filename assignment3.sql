-- 1. Titles of all books written by authors from the United States
SELECT b.title
FROM Books b
JOIN Authors a
ON b.author_id = a.author_id
WHERE a.country = 'United States';

-- 2. Total sales of books in the Fiction category
SELECT SUM(b.sales_amount) AS total_sales
FROM Books b
WHERE b.category = 'Fiction';

-- 3. Names of authors who have written more than one book
SELECT a.author_name
FROM Authors a
JOIN Books b
ON a.author_id = b.author_id
GROUP BY a.author_id, a.author_name
HAVING COUNT(b.book_id) > 1;

-- 4. Title, publication year, and sales amount of books published after 2010
SELECT title, publication_year, sales_amount
FROM Books
WHERE publication_year > 2010
ORDER BY sales_amount DESC;
