CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    department_id INT
);
--selecting data
-- Select all columns from the employees table
SELECT * FROM employees;
-- Select specific columns from the employees table
SELECT first_name, last_name, email FROM employees;


--2.Filtering data
-- Select employees with a specific job title
SELECT * FROM employees WHERE job_title = 'Sales Manager';
-- Select employees with a salary greater than a specific amount
SELECT * FROM employees WHERE salary > 50000;

-- Select employees hired in a specific year
SELECT * FROM employees WHERE YEAR(hire_date) = 2020;


--3.Grouping and aggregating data
-- Count the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
-- Find the average salary by department
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;


--4.Using sunqueries
-- Select employees who earn more than the average salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
-- Select departments with more than 10 employees (assuming you have department data in the employees table)
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;


--5.Updating and deleting data
-- Update the salary of a specific employee
UPDATE employees
SET salary = 60000
WHERE employee_id = 101;
-- Delete employees from a specific department
DELETE FROM employees
WHERE department_id = 5;
