-- TO CREATE DATABASE (comment is ctrl+?) 
create database DA;

-- TO DROP/DELETE A DATABASE
drop database DA;

-- TO CHECK NUMBER OF DATABASES WE HAVE
show databases;

-- USING DATABASES (start work in database)
use DA;

-- TO CREATE TABLE IN DATABASE
create table  employees ( 
emp_id INT PRIMARY KEY, 
name VARCHAR(50), 
department VARCHAR(50), 
salary DECIMAL(10,2), 
hire_date DATE 
); 

create table info(
cid INT PRIMARY KEY,
address VARCHAR(100),
age INT,
gender VARCHAR(10)
);

-- Get table info( Fields/Type/Null/KeyDefault/Extra)
describe employees;

-- Delete Table
drop table employees;

-- Show all tables in current database
show tables;

-- Insert Values
insert into employees (emp_id, name, department, salary, hire_date) values
(1, 'Amit Sharma', 'HR', 55000.00, '2020-01-15'),
(2, 'Priya Verma', 'Finance', 62000.00, '2019-03-10'),
(3, 'Ravi Kumar', 'IT', 75000.00, '2021-07-01'),
(4, 'Sneha Gupta', 'Marketing', 58000.00, '2018-11-20'),
(5, 'Arjun Singh', 'Sales', 60000.00, '2022-05-05'),
(6, 'Meera Joshi', 'Finance', 67000.00, '2020-09-12'),
(7, 'Vikram Patel', 'IT', 80000.00, '2017-06-18'),
(8, 'Neha Reddy', 'HR', 54000.00, '2021-02-25'),
(9, 'Karan Malhotra', 'Operations', 59000.00, '2019-12-30'),
(10, 'Anjali Desai', 'Marketing', 61000.00, '2022-08-14');

INSERT INTO info (cid, address, age, gender) VALUES
(30, 'Delhi, India', 32, 'Male'),          -- Amit Sharma
(45, 'Mumbai, India', 29, 'Female'),       -- Priya Verma
(90, 'Bangalore, India', 35, 'Male'),      -- Ravi Kumar
(156, 'Pune, India', 28, 'Female'),         -- Sneha Gupta
(34, 'Lucknow, India', 31, 'Male'),        -- Arjun Singh
(39, 'Chennai, India', 33, 'Female'),      -- Meera Joshi
(01, 'Ahmedabad, India', 40, 'Male'),      -- Vikram Patel
(56, 'Hyderabad, India', 27, 'Female'),    -- Neha Reddy
(79, 'Jaipur, India', 34, 'Male'),         -- Karan Malhotra
(78, 'Surat, India', 30, 'Female');        -- Anjali Desai

-- constraints "not null", "unique","primary key"
-- Show Full Table (All attributes/Entries) Employee
select * from employees;
select * from enroll;

create table enroll(
enrollid INT primary key,
emp_id INT,
cid int,
mstatus varchar(50),

foreign key (emp_id) references employees(emp_id),
foreign key (cid) references info(cid)
);

INSERT INTO enroll (enrollid, emp_id, cid, mstatus) VALUES
(101, 1, 30, 'Married'),       -- Amit Sharma
(102, 2, 45, 'Single'),        -- Priya Verma
(103, 3, 90, 'Married'),       -- Ravi Kumar
(104, 4, 156, 'Single'),       -- Sneha Gupta
(105, 5, 34, 'Married'),       -- Arjun Singh
(106, 6, 39, 'Single'),        -- Meera Joshi
(107, 7, 1, 'Married'),        -- Vikram Patel
(108, 8, 56, 'Single'),        -- Neha Reddy
(109, 9, 79, 'Married'),       -- Karan Malhotra
(110, 10, 78, 'Single');       -- Anjali Desai


-- SHOW SELECTED COLUMNS (FULL COLUMNS)
select emp_id, name, salary from employees;
select salary from employees;

-- SHOW SELECTED COLUMNS (WITH CONDITIONS) (Filtering Data)
select name,salary from employees
where salary> 60000;

select name from employees
where salary= 60000;

-- Logical Operators
select * from employees
where salary>60000 and department="Finance";

select * from employees
where salary>60000 or department="IT";

-- ORDERING/SORTING COLUMNS
-- Name in aescending (Alphabetical) order
select * from employees
order by name asc;

-- Salary in descending order
select * from employees
order by salary desc;

-- Show every dept except IT, sort in desc order
select * from employees
where not department = "IT" 
order by emp_id desc;

-- Sort salaray in asc order for each dept in desc irder 
SELECT * FROM employees 
ORDER BY department desc, salary asc;

-- Show unique values in a columns eg- a class can have 10 male and 20 female students output will be male and female
-- Here there are 10 entries but only 6 depts, therefore 6 unique outputs(dept) will be displayed
select distinct department from employees;

-- Check NULL 
SELECT * FROM employees WHERE salary IS NULL; 

-- NOT NULL 
SELECT * FROM employees WHERE salary IS NOT NULL
order by emp_id desc; 

-- Update already existing values
update employees
set name= null, salary= null
where emp_id= 3;

update employees
set salary= 70000
where emp_id= 1;

-- View full table after updates
select * from employees;

-- Delete entire row
delete from employees
where emp_id= 4;

-- Delete All Records (Keep Table) 
DELETE FROM employees; 

-- view top 5 rows
select * from employees
order by emp_id
limit 5
;
-- view 3 rows after row 1
SELECT * FROM employees 
LIMIT 3 
OFFSET 1; 

-- Join 2 tables
-- as em and as en is used as alias, on means on what basis are we joining it
select * from employees as em
join enroll as en
on em.emp_id= en.emp_id;

-- Count the number of married employees
select count(*) from employees as em
join enroll as en
on em.emp_id= en.emp_id
where mstatus="Married";

-- Count num of employees in IT Dept
-- Count is used to counts rows
select count(*) from employees as em
join enroll as en
on em.emp_id= en.emp_id
where department="IT";

-- Group by certain category
select count(*),mstatus from employees as em
join enroll as en
on em.emp_id= en.emp_id
group by mstatus;

SELECT COUNT(*),AVG(salary),MIN(salary), MAX(salary), department FROM employees
GROUP BY department;

-- ● All non-aggregated columns must be in GROUP BY 
-- ● GROUP BY runs before ORDER BY 

SELECT department, AVG(salary) 
FROM employees 
GROUP BY department;

-- Display everything of employees having salary 60k to 70k
SELECT * FROM employees WHERE salary BETWEEN 60000 AND 70000; 

-- Display everything of IT and HR employees
SELECT * FROM employees WHERE department IN ('IT', 'HR'); 

-- Name Searching
SELECT * FROM employees WHERE name LIKE 'R%'; -- (Name Starts with R)
SELECT * FROM employees WHERE name LIKE '%a'; -- (Ends with a)
SELECT * FROM employees WHERE name LIKE '_a%'; -- (Second letter is a)

-- Calculate avg salary of each dept
SELECT department, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department;

-- Display avg salary of departments having avg salary greater than 60k
SELECT department, AVG(salary) AS avg_salary 
FROM employees
GROUP BY department
HAVING avg_salary > 60000  
;

-- Conditional Logics
SELECT name, 
CASE 
    WHEN salary > 70000 THEN 'High' 
    WHEN salary BETWEEN 60000 AND 70000 THEN 'Medium'
	ELSE 'Low' 
END AS salary_category 
FROM employees; 

-- ADDING TABLES
-- Create second table: 
CREATE TABLE departments ( 
dept_id INT PRIMARY KEY, 
dept_name VARCHAR(50) 
); 

INSERT INTO departments (dept_id, dept_name) VALUES
(111, 'HR'),
(222, 'Finance'),
(333, 'IT'),
(444, 'Marketing'),
(555, 'Sales'),
(666, 'Operations');



-- Modify employees (Adding dept id, copying it from another table called "departments"):  
ALTER TABLE employees 
ADD dept_id INT;

UPDATE employees e
JOIN departments d ON e.department = d.dept_name
SET e.dept_id = d.dept_id
WHERE e.dept_id IS NULL AND e.emp_id > 0; -- to avoid error

-- ALTERING TABLES 
-- Add Column 
ALTER TABLE employees ADD email VARCHAR(100); 
-- Modify Column 
ALTER TABLE employees MODIFY salary DECIMAL(12,2); 
-- Drop Column 
ALTER TABLE employees DROP dept_id; 

-- INNER JOIN 
-- Returns matching records from both tables. 
select * from employees;
SELECT *
FROM employees as e 
INNER JOIN departments d 
ON e.dept_id = d.dept_id; 

-- LEFT JOIN 
-- Returns all records from left table. Non-matching → NULL 
SELECT * 
FROM employees e 
RIGHT JOIN departments d 
ON e.dept_id = d.dept_id; 
 
select * from employees;
select * from enroll;
select * from info;
select * from departments;

-- RIGHT JOIN 
-- Returns all records from right table. 
SELECT *
FROM enroll e 
RIGHT JOIN info i 
ON e.cid = i.cid;

-- FULL JOIN (Not Directly Supported in MySQL) 
-- Simulated using UNION: 
SELECT e.name, d.dept_name 
FROM employees e 
LEFT JOIN departments d 
ON e.dept_id = d.dept_id 
UNION 
SELECT e.name, d.dept_name 
FROM employees e 
RIGHT JOIN departments d 
ON e.dept_id = d.dept_id;

-- UNION 
-- Combines results of two SELECT queries. 
SELECT name FROM employees 
UNION 
SELECT dept_name FROM departments; 
 
/* Rules: 
● Same number of columns 
● Same data type 
Note: UNION removes duplicates. Use UNION ALL to keep duplicates. 
Advanced Filtering Order (Execution Order) 

SQL runs in this specific order (Very important for interviews): 
1. FROM (and JOINs) 
2. WHERE 
3. GROUP BY 
4. HAVING 
5. SELECT 
6. ORDER BY 
7. LIMIT 
*/
