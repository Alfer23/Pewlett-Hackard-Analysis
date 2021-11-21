-- Create a Retirement titles table
SELECT 	e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 	rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_retire_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_retire_titles;

--Create Retiriting Titles table to hold required information
SELECT COUNT(urt.title), urt.title
INTO Retiring_titles
FROM unique_retire_titles AS urt
GROUP BY urt.title
ORDER BY count DESC;

SELECT * FROM Retiring_titles;

--Write a query to create a Mentorship Eligibility table 
SELECT DISTINCT ON (e.emp_no)	e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;