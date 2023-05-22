--Create tables

CREATE TABLE departments (
 dep_no CHAR (50) NOT NULL,
 dept_name VARCHAR(50) NOT NULL);
 
 CREATE TABLE dept_emp (
 emp_no CHAR (7) NOT NULL,
 dep_no CHAR (50) NOT NULL);
 
 CREATE TABLE dept_manager (
 dep_no CHAR (50) NOT NULL,
 emp_no CHAR (7) NOT NULL);
 
 CREATE TABLE employees (
 emp_no CHAR (8)NOT NULL,
 emp_title_id CHAR (8)NOT NULL,
 birth_date CHAR (11)NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 sex VARCHAR (1)NOT NULL,
 hire_date CHAR (11)NOT NULL);
 
 CREATE TABLE salaries (
 emp_no CHAR (7) NOT NULL,
 salary CHAR (7) NOT NULL);
 
 CREATE TABLE titles (
  title_id CHAR (7)NOT NULL,
  title VARCHAR (50)NOT NULL);
  
  -- Import data to tables & check tables
  
select *
From departments

select *
From dept_emp

select *
From dept_manager

select *
From employees

select *
From salaries

select *
From titles

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
Left Join salaries as s
On (e.emp_no=s.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT m.dep_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
FROM dept_manager as m
Left Join departments as d
On (m.dep_no = d.dep_no)
Left Join employees as e
On (m.emp_no=e.emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select m.dep_no, m.emp_no, e.last_name, e.first_name, d.dept_name
From dept_manager as m
left join employees as e
On (m.emp_no=e.emp_no)
Left Join departments as d
On (m.dep_no=d.dep_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name, last_name, sex
from employees
where first_name = 'Hercules' and LEFT(last_name,1) = 'B';

-- List each employee in the Sales department, including their employee number, last name, and first name.
Select d.dept_name, de.emp_no, e.last_name, e.first_name
From departments as d
Left Join dept_emp as de
On (d.dep_no=de.dep_no)
Left Join employees as e
On (de.emp_no=e.emp_no)
Where de.dep_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
