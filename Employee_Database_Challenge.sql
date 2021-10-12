-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, title, from_date, to_date

INTO clean_title
FROM titles
ORDER BY emp_no, from_date DESC;
select * from clean_title

--join on emp_no
select employees.emp_no, employees.first_name,
employees.last_name, clean_title.title,clean_title.from_date,
clean_title.to_date, employees.birth_date
into cooler_table
from employees
left join clean_title on employees.emp_no = clean_title.emp_no
order by emp_no
select * 
into almost_retire from cooler_table
where birth_date between '1952-01-01' AND '1955-12-31'
drop table cooler_table
select * from almost_retire 
--retrieve # of titles 
select title,count(title) from almost_retire 
group by title order by count(title) desc
--test
select * from mentorship
drop table mentorship


--Mentorship Eligibility
select e.emp_no, e.first_name, e.last_name,
e.birth_date, d.from_date, d.to_date, 
ct.title
into mentorship_eligibility
from employees as e
inner join clean_title as ct on e.emp_no = ct.emp_no
inner join dept_emp as d on e.emp_no = d.emp_no
where (d.to_date > '5555-06-26') AND (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no asc

--random stuff
select sum (count) from retiring_titles







