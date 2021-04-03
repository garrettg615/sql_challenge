-- This file contains queries for homework questions and Bonus objective

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employee_master.employee_no, first_name, last_name, sex, salary
FROM public.employee_master
INNER JOIN public.salaries
ON public.employee_master.employee_no = public.salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM public.employee_master
WHERE hire_date BETWEEN '1986-01-01'
AND '1986-12-31'
ORDER BY hire_date ASC;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT managers.dept_no, depT_name, public.employee_master.employee_no, last_name, first_name
FROM public.managers
INNER JOIN public.employee_master
ON public.managers.employee_no = public.employee_master.employee_no
INNER JOIN public.departments
ON public.managers.dept_no = public.departments.department_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT public.employee_master.employee_no, last_name, first_name, dept_name
FROM public.employee_master
INNER JOIN public.employee_junction
ON public.employee_master.employee_no = public.employee_junction.employee_no
INNER JOIN public.departments
ON public.employee_junction.dept_no = public.departments.department_no
ORDER BY public.employee_master.employee_no ASC;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex FROM public.employee_master
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT public.employee_master.employee_no, last_name, first_name, dept_name 
FROM public.employee_master
INNER JOIN public.employee_junction
ON public.employee_master.employee_no = public.employee_junction.employee_no
INNER JOIN public.departments
ON public.employee_junction.dept_no = public.departments.department_no
WHERE public.departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW emp_dept_table AS
SELECT public.employee_master.employee_no, last_name, first_name, dept_name 
FROM public.employee_master
INNER JOIN public.employee_junction
ON public.employee_master.employee_no = public.employee_junction.employee_no
INNER JOIN public.departments
ON public.employee_junction.dept_no = public.departments.department_no;

SELECT * FROM emp_dept_table
WHERE dept_name = 'Sales'
OR dept_name = 'Development';


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT count(DISTINCT last_name) FROM public.employee_master --1638

SELECT last_name, count(first_name) as total
from public.employee_master
group by last_name
order by total DESC;

-- Bonus: create a view to be used in jupyter notebook

CREATE VIEW employee_db AS
SELECT * FROM public.employee_master
INNER JOIN salaries
on public.employee_master.employee_no = public.salaries.emp_no
INNER JOIN public.title
ON public.employee_master.emp_title_id = public.title.title_no;
