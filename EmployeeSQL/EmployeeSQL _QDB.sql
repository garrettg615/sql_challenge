-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "department_no" INTEGER   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "department_no"
     )
);

CREATE TABLE "Employee_Junction" (
    "employee_no" INTEGER   NOT NULL,
    "dept_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Employee_Junction" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Managers" (
    "dept_no" INTEGER   NOT NULL,
    "employee_no" INTEGER   NOT NULL
);

CREATE TABLE "Employee_Master" (
    "employee_no" INTEGER   NOT NULL,
    "emp_title_id" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

CREATE TABLE "Title" (
    "title_no" INTEGER   NOT NULL,
    "title_name" VARCHAR(20)   NOT NULL
);

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_department_no" FOREIGN KEY("department_no")
REFERENCES "Employee_Junction" ("dept_no");

ALTER TABLE "Employee_Junction" ADD CONSTRAINT "fk_Employee_Junction_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employee_Master" ("employee_no");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("department_no");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employee_Junction" ("employee_no");

ALTER TABLE "Employee_Master" ADD CONSTRAINT "fk_Employee_Master_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employee_Master" ADD CONSTRAINT "fk_Employee_Master_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Title" ("title_no");

