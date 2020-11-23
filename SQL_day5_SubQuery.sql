-- SUBQUERY IS QUERY INSIDE OF QUERY

-- find out the highest erner first_name in employee table

select max(salary) from employees;

select first_name from employees
where salary = 24000;

select first_name from employees
where salary = (select max(salary) from employees); -- SUBQUERY


-- find out first_name, last_name of the lowest erner in employee table
select first_name ||' '|| last_name as FullName from employees
where salary = (select min(salary) from employees);

-- find out first_name, last_name of the above average erner in employee table
select first_name ||' '|| last_name as FullName from employees
where salary > (select avg(salary) from employees) ;

-- find out second max salary from employees table
select max(salary)
from employees
where salary != (select max(salary) from employees);
--where salary <> 24000;

-- find out the name of above person
select first_name from employees
where salary = (select max(salary)
from employees
where salary != (select max(salary) from employees));

-- HOW TO RETURN MAX AND MIN SALARY IN ONE COLUMN
-- THE COLUMN NAME SHOULD BE RESULT, IT SHOULD HAVE 2 ROWS
SELECT MAX(SALARY) AS RESULT FROM EMPLOYEES
UNION
SELECT MIN(SALARY) AS RESULT FROM EMPLOYEES  ;

-- FIND OUT THE NAME OF PEOPLE WHO MAKE 2100,24000
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY IN(2100,24000);

-- NOW REMOVE THOSE MAX AND MIN SALARY YOU HARD-CODED IN ABOVE QUERY
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY IN(SELECT MAX(SALARY) AS RESULT FROM EMPLOYEES
UNION
SELECT MIN(SALARY) AS RESULT FROM EMPLOYEES);



