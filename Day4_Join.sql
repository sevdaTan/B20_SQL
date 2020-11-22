
-- CONSTRAINT -- RULES FOR COLUMNS
    ---1.PRIMARY KEY 
    ---2.FOREIGN KEY

-- find out the first name and department name
-- use employees table and department table

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES 
INNER JOIN DEPARTMENTS ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID;

-- above query just work but adding table name in front of column name all the time is not efficient
-- we can use alias to make this simpler

select e.first_name,d.department_name 
from employees e -- this is how we put alias for table
inner join departments d 
on e.department_id = d.department_id; 

-- get the first name and job title
-- use employees and jobs table

select e.first_name,j.job_title
from employees e
inner join jobs j 
on e.job_id = j.job_id; 

-- firstname, department name, city, country name, region name

select e.first_name, d.department_name, l.city, c.country_name, r.region_name 
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on l.location_id = d.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id;












