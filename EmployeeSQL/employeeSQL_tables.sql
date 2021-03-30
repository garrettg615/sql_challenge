select * from Departments
select * from Employee_Junction
select * from Managers
select * from Employee_Master
select * from Salaries
select * from Title

drop table Salaries

CREATE TABLE Departments (
    department_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employee_Junction (
	"employee_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL,
	FOREIGN KEY (employee_no) REFERENCES public.employee_master(employee_no),
	FOREIGN KEY (dept_no) REFERENCES public.departments(department_no)
);

CREATE TABLE Managers (
    "dept_no" VARCHAR(10) NOT NULL,
    "employee_no" INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Departments(department_no)
);

CREATE TABLE Employee_Master (
    "employee_no" INTEGER NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL),
	FOREIGN KEY(emp_title_id) REFERENCES Title(title_no)
);

CREATE TABLE Salaries (
    "emp_no" INTEGER NOT NULL PRIMARY KEY,
    "salary" INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employee_Master(employee_no)
);

CREATE TABLE Title (
    "title_no" VARCHAR(10) NOT NULL PRIMARY KEY,
    "title_name" VARCHAR(30) NOT NULL
);