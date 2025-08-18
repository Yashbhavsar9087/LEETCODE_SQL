# Write your MySQL query statement below
select lb.book_id, title, author, genre, publication_year, val as current_borrowers
from library_books lb
join (select book_id, count(*) as val from borrowing_records where return_date is NULL group by book_id ) br
on lb.book_id = br.book_id
where val-total_copies = 0
order by current_borrowers desc, title asc