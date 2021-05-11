-- 09-SQL Employee Database query definitions (query.sql)
-- By Nicole Lund 
-- In partnership with 

------------------------------------
-- 0. Review imported database tables
SELECT *
  FROM departments;

SELECT *
  FROM titles;

SELECT *
  FROM employees;

SELECT *
  FROM dept_employees;

SELECT *
  FROM dept_managers;

SELECT *
  FROM salaries;
  
  
------------------------------------
-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       e.sex,
       s.salary
  FROM employees AS e
       INNER JOIN salaries AS s
       ON e.emp_no = s.emp_no;
  
  
------------------------------------
-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name,
       e.last_name,
       e.hire_date
  FROM employees AS e
 WHERE e.hire_date
       BETWEEN '1986-01-01' AND '1986-12-31';
  
  
------------------------------------
-- 3.List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT m.dept_no,
       d.dept_name,
       m.emp_no,
       e.last_name,
       e.first_name
  FROM dept_managers AS m
       INNER JOIN departments AS d
       ON m.dept_no = d.dept_no
       INNER JOIN employees AS e
       ON m.emp_no = e.emp_no;
  
  
------------------------------------
-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name 
  FROM dept_employees AS de
       INNER JOIN employees AS e
       ON de.emp_no = e.emp_no 
       INNER JOIN departments AS d
       ON de.dept_no = d.dept_no; 
  
  
------------------------------------
-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
       e.last_name,
       e.sex
  FROM employees AS e 
 WHERE e.first_name = 'Hercules'
   AND e.last_name LIKE 'B%';
  
  
------------------------------------
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name 
  FROM employees AS e 
       INNER JOIN dept_employees AS de
       ON e.emp_no = de.emp_no 
       INNER JOIN departments d 
       ON de.dept_no = d.dept_no 
 WHERE d.dept_name = 'Sales';
  
  
------------------------------------
-- 7a.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name 
  FROM employees AS e 
       INNER JOIN dept_employees AS de
       ON e.emp_no = de.emp_no 
       INNER JOIN departments d 
       ON de.dept_no = d.dept_no 
 WHERE d.dept_name = 'Sales'
   AND d.dept_name = 'Development';

  
------------------------------------
-- 7b.List all employees in the Sales OR Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name 
  FROM employees AS e 
       INNER JOIN dept_employees AS de
       ON e.emp_no = de.emp_no 
       INNER JOIN departments d 
       ON de.dept_no = d.dept_no 
 WHERE d.dept_name = 'Sales'
    OR d.dept_name = 'Development';
  

------------------------------------
-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name,
       COUNT(e.last_name) AS count_last_name
  FROM employees AS e
 GROUP BY e.last_name 
 ORDER BY count_last_name DESC 
 
 
------------------------------------
-- Bonus. 2. Create a histogram to visualize the most common salary ranges for employees.
SELECT s.salary 
  FROM salaries AS s 
  
------------------------------------
-- Bonus. 3. Create a bar chart of average salary by title.
SELECT e.emp_no,
       s.salary,
       e.emp_title_id, 
       t.title
  FROM employees AS e 
       INNER JOIN salaries AS s 
       ON e.emp_no = s.emp_no
       INNER JOIN titles AS t 
       ON e.emp_title_id = t.title_id; 

   