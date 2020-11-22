select first_name, last_name,substr(first_name,1,1)||''|| substr(last_name,1,1) from employees;

select first_name ||' '|| last_name as FullName from employees ;

select max(first_name ||' '|| last_name) as FullName from employees;

select first_name, last_name, department_id from employees where department_id in(90,60,100,130,120);

select first_name, last_name, department_id from employees where department_id not in(90,60,100,130,120);

select * from employees group by job_id;





