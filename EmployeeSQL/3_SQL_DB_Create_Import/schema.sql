-- 09-SQL Employee Database schema definitions (schema.sql)
-- By Nicole Lund 
-- In partnership with 

-- The starter code was developed with https://www.quickdatabasediagrams.com/
-- and updated to match my style and readability preferences.

------------------------------------
-- 0. Drop tables that already exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_employees CASCADE;
DROP TABLE IF EXISTS dept_managers CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;


------------------------------------
-- 1. Create and import departments table
CREATE TABLE departments (
       dept_no varchar(10) PRIMARY KEY,
       dept_name varchar(25) UNIQUE NOT NULL);

   
------------------------------------
-- 2. Create titles table
CREATE TABLE titles (
       title_id varchar(10) PRIMARY KEY,
       title varchar(25) UNIQUE NOT NULL);

 
------------------------------------
-- 3. Create employees table
CREATE TABLE employees (
       emp_no varchar(10) PRIMARY KEY,
       first_name varchar(25) NOT NULL,
       last_name varchar(25) NOT NULL,
       sex varchar(10) NOT NULL,
       birth_date date NOT NULL,
       hire_date date NOT NULL,
       emp_title_id varchar(10) NOT NULL,
       FOREIGN KEY(emp_title_id) REFERENCES titles (title_id));


------------------------------------
-- 4. Create dept_employees table
-- Note, some employees are assigned to multiple departments.
-- Composite key required.
CREATE TABLE dept_employees (
       emp_no varchar(10) NOT NULL,
       dept_no varchar(10) NOT NULL,
       PRIMARY KEY(emp_no,dept_no),
       FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
       FOREIGN KEY(dept_no) REFERENCES departments (dept_no));


------------------------------------
-- 5. Create dept_managers table
CREATE TABLE dept_managers (
       emp_no varchar(10) PRIMARY KEY,
       dept_no varchar(10) NOT NULL,
       FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
       FOREIGN KEY(dept_no) REFERENCES departments (dept_no));


------------------------------------
-- 6. Create salaries table
CREATE TABLE salaries (
       emp_no varchar(10) PRIMARY KEY,
       salary integer NOT NULL,
       FOREIGN KEY(emp_no) REFERENCES employees (emp_no));

