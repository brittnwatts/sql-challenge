-- 1. List the emp_no, last_name, first_name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;


-- 2. List the first_name, last_name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1/11/986' and hire_date <= '12/31/1986';


-- 3. List the manager of each dept along with their dept_no, dept_name, emp_no, last_name, first_name
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no=departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no=employees.emp_no;



-- 4. List the dept_no, emp_no, last_name, first_name, and dept_name for each employee
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM dept_emp
LEFT JOIN employees ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name, COUNT(employees.last_name) AS "last names"
FROM employees
GROUP BY employees.last_name
ORDER BY "last names" DESC;