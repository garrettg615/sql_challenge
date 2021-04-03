-- This file was used to create tables for each of the CSV file 
-- stored in the Data Folder

-- when importing CSV files, the order of import should be:
-- Title, Employee_Master, Employee_Junction, Managers, Departments, Salaries


-- Create Table to display departments.csv
CREATE TABLE Departments (
    department_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

-- Create Table to display dept_emp.csv
CREATE TABLE Employee_Junction (
	"employee_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL
);

-- Create Table to display dept_managers.csv
CREATE TABLE Managers (
    "dept_no" VARCHAR(10) NOT NULL,
    "employee_no" INTEGER NOT NULL    
);

-- Create Table to display employees.csv
CREATE TABLE Employee_Master (
    "employee_no" INTEGER NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL
);

-- Create Table to display salaries.csv
CREATE TABLE Salaries (
    "emp_no" INTEGER NOT NULL PRIMARY KEY,
    "salary" INTEGER NOT NULL
);

-- Create Table to display titles.csv
CREATE TABLE Title (
    "title_no" VARCHAR(10) NOT NULL PRIMARY KEY,
    "title_name" VARCHAR(30) NOT NULL
);


-- Run this section after all tables have been created.
-- This sections adds foreign keys to tables

ALTER TABLE Employee_Junction
ADD CONSTRAINT fk_Employee_Master_employee_no
FOREIGN KEY (employee_no)
REFERENCES public.employee_master(employee_no);

ALTER TABLE Employee_Junction
ADD CONSTRAINT fk_Department_department_no
FOREIGN KEY (dept_no) 
REFERENCES public.departments(department_no);

ALTER TABLE Managers
ADD CONSTRAINT fk_Department_department_no
FOREIGN KEY (dept_no)
REFERENCES Departments(department_no);

ALTER TABLE Managers
ADD CONSTRAINT fk_Employee_Master_employee_no
FOREIGN KEY (employee_no)
REFERENCES Employee_Master(employee_no);

ALTER TABLE Employee_Master
ADD CONSTRAINT fk_Title_title_no
FOREIGN KEY(emp_title_id)
REFERENCES Title(title_no);

ALTER TABLE Salaries
ADD CONSTRAINT fk_Employee_Master_employee_no
FOREIGN KEY (emp_no)
REFERENCES Employee_Master(employee_no);


-- Display all data from Department table
select * from Departments;

-- Display all data from Employee_Junction table
select * from Employee_Junction;

-- Display all data from Managers table
select * from Managers;

-- Display all data from Employee_Master table
select * from Employee_Master;

-- Display all data from Salaries table
select * from Salaries;

-- Display all data from Title table
select * from Title;