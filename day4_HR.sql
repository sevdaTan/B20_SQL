
select department_id, count(*) 
from employees group by department_id order by department_id;


select * from employees order by salary desc;

select * from employees order by first_name desc;

-- ordering by column number rather than name
select * from employees order by 2 desc;

-- GETTING DISTINCT VALUE FROM THE TABLE
-- finding unique manager_ids from Employees table
select distinct manager_id from employees;

-- finding unique first_names from Employees table
select distinct first_name from employees;

-- finding count of unique first_names from Employees table
select count(distinct first_name) as Number_Of_Unique_Names from employees;


-- WE CAN USE EITHER DISTINCT KEYWORD OR UNIQUE KEYWORD TO RETURN THE UNIQUE VALUE

--3,  USING EMPLOYEES TABLE 
--  FIND OUT HOW MANY EMPLOYEES EACH MANAGER MANAGE (group by manager_id)
 -- ARADA BOSLUK KOYMAK ISTIYORSAK TABLO ISMINDE BU SEKILDE YAZARIZ --> "NUM OF EMPLOYEE " 
SELECT MANAGER_ID, COUNT(*) AS NUM_OF_EMPLOYEE
FROM EMPLOYEES GROUP BY MANAGER_ID ORDER BY 1;


--  continue above 
--      3.1 -- find out manager who mange more than 10 employees 
SELECT MANAGER_ID, COUNT(*) AS NUM_OF_EMPLOYEE
FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(*) > 10 ;
--      3.2 -- find out manager who manage exactly 6 employees 
SELECT MANAGER_ID, COUNT(*) AS NUM_OF_EMPLOYEE
FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(*) = 6 ;


-- 5.0 GET THE COUNT OF EMPLOYEE THAT HAVE EXACTLY 5 CHARACTERS IN FIRST NAME (no need for group by)
select first_name from employees where length(first_name) = 5;

select count(first_name) as "name with 5 chars" from employees where length(first_name) = 5;

-- group the first_name by the length of character count in employees table
-- name_length, name_count
select length(first_name) as name_length,
count(*) as name_count from employees 
group by length(first_name) order by 1;

-- (this is not goup by task) 
--sort the first name by character count of first name in employees table
select first_name from employees order by length(first_name);


-- ordering by 2 columns
--sort employees table by first_name, if first names are same, then order by last name
-- if we don't have duplicated names, adding " last_name ASC " does not make sense
select first_name ,last_name 
from employees order by first_name ASC, last_name ASC ;

-- RELATIONAL DATABASE
-- consists of tables that related to each other

-- each and every table has a unique identifier column
-- kown as Primary Key
-- This column cannot be null, cannot have duplicate value


    
    






































