select * FROM employees;

--Find out all the employees with department of id  of 60 or 100
select * from  employees where department_id = 60 or department_id = 100;

-- On the top above query only get first_name and last_name, salary, job_id 
select first_name, last_name, salary, job_id from  employees where department_id = 60 or department_id = 100;

--findout all the jobs info if the min salary is more than 5000 and less than 10000
select * from jobs where min_salary >= 5000 and min_salary <= 10000;
select * from jobs where min_salary between 5000 and 10000;


-- Find out all the employees with frist_name, phone and department of id  of 60 or 100 or 90 or 80,120

-- if we are checking for multiple possible values for same column, we use IN (value1,value2,value3...)
--it is same as using OR
select first_name, phone_number,department_id from employees where department_id in (60,100,90,80,120);
SELECT FIRST_NAME, PHONE_NUMBER , DEPARTMENT_ID
    FROM EMPLOYEES  
WHERE DEPARTMENT_ID =60 OR 
      DEPARTMENT_ID =70 OR 
      DEPARTMENT_ID =80 OR 
      DEPARTMENT_ID =90 ;

-- get all the first names that start with letter A from employee table
-- % is wildcard that can represent 0 or more characters
-- for example 'A%' means ---> any string that start with letter A
-- we can use it to partial string match

select first_name from employees where first_name LIKE 'A%';
select last_name from employees where last_name like 'Z%';

-- if it is related to last letter, we put % before letter
select first_name from employees where first_name LIKE '%a';
select last_name from employees where last_name like '%t';

-- find out all first_name and last_name from employees table
-- if the first name start with A and last name ends with n
select first_name, last_name 
from employees 
where first_name LIKE 'A%' 
and last_name like '%n';


-- if it is related to contains a letter,
-- we put % before and after the letter
select last_name from employees where last_name like '%t%';
select first_name from employees where first_name like '%x%';

---Task1: FROM EMPLOYEES TABLE FIND OUT ALL JOB_IDs start with AD
select job_id from employees where job_id like 'AD%';
---Task2: FROM EMPLOYEES TABLE FIND OUT ALL JOB_IDs END with REP 
select job_id from employees where job_id like '%REP';

-- FROM EMPLOYEES TABLE FIND OUT ALL JOB_IDs does NOT END with REP 
select job_id from employees where job_id not like '%REP';


-- FROM EMPLOYEES TABLE FIND OUT ALL first_names does NOT contain letter a
select first_name from employees where first_name not like '%a%';

-- FROM EMPLOYEES TABLE FIND OUT 
-- ALL first_names does NOT contain letter a 
-- and it does not start with A 
select first_name 
from employees 
where first_name not like '%a%' 
and first_name not like 'A%';

-- Working with null value
-- if a cell has no value  entered it is NULL

-- Find out all the employee info if the employees manager_id  is null

select * from employees where manager_id is null;

-- Find out first name and manage id the employee info if the employees manager_id  is null
select first_name, manager_id 
from employees 
where manager_id is not null;


-- Functions in SQL  --PRE-WRITTEN functioality we can directly use
-- 1:Single Row Function

-- Display all Employees first name in uppercase
SELECT first_name, upper(first_name) , lower (first_name)
FROM employees;

-- How to change the Query Name?
-- Return all employee first name and salary from employee tables
--display the resulting column as name , money
-- we can give alias(nickname) to the query resultcolumn name using as
select first_name AS name, salary AS money from employees;

-- Return first name and last name in one column and name it as FULLNAME
select first_name, last_name, first_name ||' '|| last_name 
as FULLNAME from employees;


-- I love SQL Already LaLALA

-- find out all the first name does not contain letter A and a
select first_name, upper(first_name) 
from employees where upper(first_name) like '%A%' ;

select first_name, lower(first_name) 
from employees where lower(first_name) like '%a%' ;

select first_name, upper(first_name) 
from employees where upper(first_name) not like '%A%' ;

select first_name, lower(first_name) 
from employees where lower(first_name) not like '%a%' ;


-- Display first 3 letters of first name
-- substr (value, begIndex, endIndex)
select first_name, SUBSTR(first_name,1,3) from employees;


-- 2:Multi-Row Function  |  Group Function  | Aggreage Function







