---1. List the following details of each employee: 
---employee number, last name, first name, gender, 
---and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
LEFT JOIN salaries AS s on
e.emp_no=s.emp_no;

---2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date >= '1986-01-01' 
AND hire_date <='1986-12-31';

---3. List the manager of each department with the following information: 
---department number, department name, the manager's employee 
---number, last name, first name, and start and end employment 
---dates.
SELECT dmgr.dept_no, dept.dept_name, dmgr.emp_no, emp.last_name,
emp.first_name, dmgr.from_date, dmgr.to_date
FROM dept_manager AS dmgr
LEFT JOIN departments AS dept
ON dmgr.dept_no = dept.dept_no
LEFT JOIN employees AS emp
ON dmgr.emp_no=emp.emp_no;

---4. List the department of each employee with the following 
---information: employee number, last name, first name, and 
---department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees AS emp
LEFT JOIN dept_emp as dept 
ON emp.emp_no = dept.emp_no
LEFT JOIN departments as dp
ON dept.dept_no = dp.dept_no;

---5. List all employees whose first name is "Hercules" and 
---last names begin with "B."
SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

---6. List all employees in the Sales department, including their 
---employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
LEFT JOIN dept_emp as demp
ON emp.emp_no = demp.emp_no
LEFT JOIN departments as dept
ON demp.dept_no=dept.dept_no
WHERE dept_name LIKE 'Sales';
---7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and 
--department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
LEFT JOIN dept_emp as demp
ON emp.emp_no = demp.emp_no
LEFT JOIN departments as dept
ON demp.dept_no=dept.dept_no
WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development';

--8. In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT Last_name, COUNT(*) 
FROM employees 
GROUP BY last_name 
ORDER BY last_name DESC;