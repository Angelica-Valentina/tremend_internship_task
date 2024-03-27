# Task 3

1. MySQL container:
   ```
   docker run -d --name mysql_db -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 mysql:latest
   ```

   
2. Database named "company"
   ```
   CREATE DATABASE company;
   ```


3. Import company.sql:
   ```
   mysql -u root -p company < company.sql
   ```


4. Creation of a user and assigning permissions
   ```
   CREATE USER 'user'@'%' IDENTIFIED BY 'password';
   GRANT ALL PRIVILEGES ON company.* TO 'user'@'%';
   FLUSH PRIVILEGES;
   ```


5. Finding the average salary for each department
   ```
   SELECT department_name, AVG(salary) AS average_salary
   FROM employees
   JOIN departments ON employees.department = departments.department_id
   GROUP BY department_name;
   ```
