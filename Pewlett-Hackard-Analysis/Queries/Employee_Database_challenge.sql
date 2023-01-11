--1. Retrieve data
SELECT emp_no, fist_name, last_name 
FROM employees;

SELECT title, from_date, to_date 
FROM titles;

-- 3. Create a table wit all relevant info-- 5. filter by bday then order by employee number 
SELECT e.emp_no,
	   e.fist_name,
	   e.last_name,
	   t.title, 
	   t.from_date, 
	   t.to_date
INTO retirement
FROM employees as e
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
-- 6. export retiremet_titles
SELECT * FROM retirement

-- 8. Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
fist_name, 
last_name, 
title
INTO unique_titles
FROM retirement 
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM unique_titles
-- 16-19.retrieve the number of employees by their most recent job title who are about to retire. 
SELECT COUNT(title), title
INTO retiring_tables
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

SELECT * FROM retiring_tables

-- Deliverable2. Write a query to create a Mentorship Eligibility table 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.fist_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_table
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no 
SELECT * FROM mentorship_table

SELECT COUNT(emp_no)
INTO potential_mentors
FROM mentorship_table
ORDER BY count(emp_no) ASC;
SELECT * FROM potential_mentors














ORDER BY COUNT DESC;