--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" m
JOIN "Employees" e
ON m.emp_no = e.emp_no
JOIN "Departments" d
ON d.dept_no = m.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT d.dept_no, d.emp_no, e.last_name, e.first_name, p.dept_name
FROM "Employees" e
JOIN "Dept_Employees" d
ON e.emp_no = d.emp_no
JOIN "Departments" p
ON p.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT e.emp_no, e.last_name, e.first_name, m.dept_name
FROM "Employees" e
JOIN "Dept_Employees" d
ON e.emp_no = d.emp_no
JOIN "Departments" m
ON m.dept_no = d.dept_no
WHERE m.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no, e.last_name, e.first_name, m.dept_name
FROM "Employees" e
JOIN "Dept_Employees" d
ON e.emp_no = d.emp_no
JOIN "Departments" m
ON m.dept_no = d.dept_no
WHERE m.dept_name = 'Sales' or m.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(e.last_name) AS "Count"
FROM "Employees" e
GROUP BY last_name
ORDER BY "Count" DESC;
