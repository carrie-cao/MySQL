use employees;
select first_name, last_name
from employees;
select * from employees;

SELECT    *
FROM    employees
WHERE    first_name = 'Elvis';
SELECT    dept_no
FROM    departments;
SELECT    *
FROM    employees
WHERE   first_name = 'Kellie' AND gender = 'F'; 
SELECT    *
FROM    employees
WHERE    first_name = 'Kellie' OR first_name = 'Aruna'; 
SELECT    *
FROM    employees
WHERE    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');
SELECT    *
FROM    employees
WHERE    first_name IN ('Denis' , 'Elvis');
SELECT    *
FROM    employees
WHERE    first_name NOT IN ('John' , 'Mark', 'Jacob');
SELECT    *
FROM    employees
WHERE    first_name LIKE('Mark%');
SELECT *
FROM employees
WHERE hire_date LIKE ('%2000%');
SELECT    *
FROM    employees
WHERE    emp_no LIKE ('1000_');
SELECT    *
FROM    employees
WHERE    first_name LIKE ('%JACK%');
SELECT    *
FROM    employees
WHERE    first_name NOT LIKE ('%Jack%'); 
SELECT    *
FROM    salaries; 
SELECT    *
FROM    salaries
WHERE    salary BETWEEN 66000 AND 70000    ;  
SELECT    *
FROM    employees
WHERE    emp_no NOT BETWEEN '10004' AND '10012'    ;   
SELECT    dept_name
FROM    departments
WHERE    dept_no BETWEEN 'd003' AND 'd006';
SELECT    dept_name
FROM    departments
WHERE    dept_no IS NOT NULL;
SELECT    *
FROM    employees
WHERE    hire_date >= '2000-01-01'        AND gender = 'F';
SELECT    *FROM    salaries
WHERE    salary > 150000;
SELECT DISTINCT    hire_date
FROM    employees;
SELECT    COUNT(*)
FROM    salaries
WHERE    salary >= 100000;
SELECT    COUNT(*)
FROM    dept_manager;
SELECT    *
FROM    employees
ORDER BY hire_date DESC;
SELECT    salary, COUNT(emp_no) AS emps_with_same_salary
FROM    salaries
WHERE    salary > 80000
GROUP BY salary
ORDER BY salary;
SELECT    emp_no, AVG(salary)
FROM    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;
SELECT    emp_no
FROM    dept_emp
WHERE    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
select *
from salaries;
SELECT    *
FROM    dept_emp
LIMIT 100;
SELECT

    *

FROM

    titles

LIMIT 10;

 

insert into titles

(

                emp_no,

    title,

    from_date

)

values

(

                999903,

    'Senior Engineer',

    '1997-10-01'

);

 
SELECT *
FROM titles
ORDER BY emp_no DESC;
SELECT *
FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10; 
insert into dept_emp( emp_no, dept_no, from_date, to_date)values( 999903, 'd005', '1997-10-01', '9999-01-01');
INSERT INTO employees
VALUES
(
999903,
'1977-09-14',
'Johnathan',
'Creek',
'M',
'1999-01-01'
);
INSERT INTO departments VALUES ('d010', 'Business Analysis');
use employees;
UPDATE departments
SET    dept_name = 'Data Analysis'
WHERE    dept_no = 'd010';
DELETE FROM departments
WHERE    dept_no = 'd010';
SELECT    COUNT(DISTINCT dept_no)
FROM    dept_emp;
SELECT    SUM(salary)
FROM    salaries
WHERE    from_date > '1997-01-01';
SELECT    MIN(emp_no)
FROM    employees;
SELECT    MAX(emp_no)
FROM    employees;
SELECT    AVG(salary)
FROM    salaries
WHERE    from_date > '1997-01-01';
SELECT    ROUND(AVG(salary), 2)
FROM    salaries
WHERE    from_date > '1997-01-01';
SELECT    dept_no,    dept_name , 
COALESCE(dept_no, dept_name) AS dept_info
FROM    departments
ORDER BY dept_no ASC;
SELECT    IFNULL(dept_no, 'N/A') as dept_no,    
IFNULL(dept_name,            'Department name not provided') AS dept_name,   
 COALESCE(dept_no, dept_name) AS dept_info
 FROM    departments 
 ORDER BY dept_no ASC;
 DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup 
(  
emp_no int(11) NOT NULL,  
dept_no char(4) NULL,  
from_date date NOT NULL,  to_date date NULL  
);
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE    dept_no = 'd001';

use employees;
drop table if exists departments_dup;
CREATE TABLE  departments_dup 
SELECT  IFNULL(dept_no, 'N/A') as dept_no,    
IFNULL(dept_name,'Department name not provided') AS dept_name,   
 COALESCE(dept_no, dept_name) AS dept_info
 FROM    departments;

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations'); 
DELETE FROM departments_dup
WHERE    dept_no = 'd002'; 

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (  
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
  (999905, '2017-01-01'),
 (999906, '2017-01-01'),
 (999907, '2017-01-01');
 DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    SELECT
    e.emp_no,  
    e.first_name,  
    e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  
    employees e  
        LEFT JOIN   
   
dept_manager dm ON e.emp_no = dm.emp_no  
WHERE  
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC, e.emp_no;
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 
    SELECT
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no
;   
SELECT
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;
SELECT    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;
SELECT    e.first_name,    e.last_name,    e.hire_date,    t.title,    
m.from_date,    d.dept_name
FROM    employees e        
JOIN    dept_manager m 
ON e.emp_no = m.emp_no        
JOIN    departments d 
ON m.dept_no = d.dept_no        
JOIN    titles t 
ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'ORDER BY e.emp_no;
SELECT    e.first_name,    e.last_name,    e.hire_date,    
t.title,    m.from_date,    d.dept_name
FROM    employees e        
JOIN    dept_manager m 
ON e.emp_no = m.emp_no        
JOIN    departments d 
ON m.dept_no = d.dept_no        
JOIN    titles t 
ON e.emp_no = t.emp_no            
AND m.from_date = t.from_date
ORDER BY e.emp_no;
SELECT    e.gender, COUNT(dm.emp_no)
FROM    employees e        
JOIN    dept_manager dm 
ON e.emp_no = dm.emp_no
GROUP BY gender;
SELECT    *
FROM    (SELECT  e.emp_no,e.first_name,
e.last_name,NULL AS dept_no,  NULL AS from_date    
FROM  employees e    
WHERE  last_name = 'Denis'
UNION 
SELECT  NULL AS emp_no,NULL AS first_name,NULL AS last_name,dm.dept_no,dm.from_date    
FROM  dept_manager dm) as a
ORDER BY -a.emp_no DESC;
SELECT    *
FROM    dept_manager
WHERE    emp_no 
IN (SELECT emp_no  FROM employees  WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
SELECT    *
FROM    employees e
WHERE    EXISTS
( SELECT *
  FROM            titles t       
   WHERE            t.emp_no = e.emp_no                
   AND title = 'Assistant Engineer');
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager
 (   emp_no INT(11) NOT NULL,   dept_no CHAR(4) NULL,   manager_no INT(11) NOT NULL);
 CREATE OR REPLACE VIEW v_manager_avg_salary 
AS    
SELECT  
ROUND(AVG(salary), 2)   
 FROM        salaries s            
 JOIN        dept_manager m 
 ON s.emp_no = m.emp_no;
 DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN                
SELECT                               
 AVG(salary)                
 FROM    salaries;
 END$$
 DELIMITER ;
 CALL avg_salary;
 CALL avg_salary();
 CALL employees.avg_salary;
 CALL employees.avg_salary();
 
 DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
                SELECT
                                e.emp_no
                INTO p_emp_no FROM
                                employees e
                WHERE
                                e.first_name = p_first_name
                                                AND e.last_name = p_last_name;
END$$
DELIMITER ;
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
                DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;      
                RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO('Aruna', 'Journel');
DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     
                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
                END IF;  
END $$  
DELIMITER ;    

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  
SELECT  
    *  
FROM  
    employees
ORDER BY emp_no DESC;
CREATE INDEX i_hire_date ON employees(hire_date);
ALTER TABLE employees
DROP INDEX i_hire_date;
SELECT    *
FROM    salaries
WHERE    salary > 89000;
CREATE INDEX i_salary ON salaries(salary);
SELECT    *
FROM    salaries
WHERE    salary > 89000;
SELECT    e.emp_no,    e.first_name,    e.last_name,    
CASE        WHEN dm.emp_no IS NOT NULL THEN 'Manager'        ELSE 'Employee'    END AS is_manager
 FROM    employees e        
 LEFT JOIN    dept_manager dm 
 ON dm.emp_no = e.emp_no
 WHERE    e.emp_no > 109990;
 
 SELECT    dm.emp_no,      e.first_name,      e.last_name,      MAX(s.salary) - MIN(s.salary) AS salary_difference,      
CASE          
WHEN MAX(s.salary) - MIN(s.salary) > 30000 
THEN 'Salary was raised by more then $30,000'         
 ELSE 'Salary was NOT raised by more then $30,000'      
 END AS salary_raise  
 FROM      dept_manager dm          
 JOIN      employees e 
 ON e.emp_no = dm.emp_no          
 JOIN      salaries s 
 ON s.emp_no = dm.emp_no 
  GROUP BY s.emp_no;     
  SELECT      dm.emp_no,      e.first_name,      e.last_name,      
  MAX(s.salary) - MIN(s.salary) AS salary_difference,      
  IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 
  'Salary was NOT raised by more then $30,000') AS salary_increase  
  FROM      dept_manager dm          
  JOIN      employees e 
  ON e.emp_no = dm.emp_no         
JOIN      salaries s
ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;
SELECT    e.emp_no,    e.first_name,    e.last_name,    CASE      
 WHEN MAX(de.to_date) > SYSDATE() 
 THEN 'Is still employed'        
 ELSE 'Not an employee anymore'    
 END AS current_employee
 FROM    employees e        
 JOIN    dept_emp de 
 ON de.emp_no = e.emp_no
 GROUP BY de.emp_no
 LIMIT 100;