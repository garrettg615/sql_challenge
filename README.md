# sql_challenge
PostgreSQL Homework

employeeSQL_tables.sql will create and define tables with primary keys and foreign keys.
I have seperated the file into 3 sections
    section 1 will create the tables without the foreign keys
    section 2 will use the ALTER TABLE method to add the foreign key constraints
    section 3 can be used to display the table but is not necessary for table creation.

After sections 1 & 2 are completed, the CSV files can be uploaded from the data folder. Please note that in order for the import to work with the foreign key constraints, the following order should be used:
    Table Names:
    1. Title
    2. Employee_Master
    3. Employee_Junction
    4. Managers
    5. Departments
    6. Salaries

** You can also import the files after creating the tables and before using ALTER TABLE to add the foreign key constraints. You should not get an error. However, I did not test that method but should work in theory. To avoid any errors, you can follow the steps above. **

After tables have been created and data imported, homework_question_queries.sql will run the queries requested from the assignment. I copied and pasted the queries from the assignment into this file as the layout. Each query will appear under it associated question.

--BONUS
The beginning of the bonus objective will also appear at the bottom of homework_question_queries.sql. I chose to create a view to hold the table I wanted to use in the Jupyter Notebook. When you open the EmployeeSQL.ipynb file, you will see that I reference the view name in the query variable in the second cell.

One last thing to be aware of, I have removed the username and password arguement from the path requesting the database. You can replace username and password with your information. Also, the name of the database in the path for me was "EmployeeSQL", you may need to change this in the path name as well.

Thank you,
Garrett Gomez-Spillane