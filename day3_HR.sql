-- SINGLE RAW FUNCTION
--WILL AFFECT EACH AND EVERY RAW AND RETURN SAME NUMBER OF RAWS
--

SELECT UPPER(FIRST_NAME) , LOWER(LAST_NAME), 
SUBSTR (FIRST_NAME,1,1) || SUBSTR (LAST_NAME,1,1)
AS INITIALS FROM EMPLOYEES;

-- FIND EMPLOYEES THAT CONTAINS MI IN THEIR NAME(FIRST NAME OR LAST NAME),CASE INSENSETIVE

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE UPPER(FIRST_NAME) LIKE '%MI%' OR UPPER(LAST_NAME) LIKE '%MI%' ;
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE LOWER(FIRST_NAME) LIKE '%mi%' OR LOWER (LAST_NAME) LIKE '%mi%';
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE LOWER(FIRST_NAME) LIKE '%mi%' OR UPPER(LAST_NAME) LIKE '%MI%' ;

--  123456789
--  21-MAY-07
-- SUBSTR (VALUE, STARTING INDEX, CHARACTER COUNT YOU WANT TO GET!)

select hire_date, substr(hire_date,4,3) from employees; -- 3 IS FOR THREE CHARACTERS OF MONTH

-- finding from a specific month
-- BY EXTENDING ABOVE QUERY, FIND OUT EVERYONE WHO WAS HIRED IN JAN
select first_name, hire_date from employees where substr(hire_date,4,3) = 'JAN';


--SIMPLE MATH OPERATION IN SQL
-- IF YOU HAVE FRACTIONALNUMBER YOU CAN USE ROUND FUNCTION TO ROUND UP THE NUMBER
SELECT SALARY AS MONTHLY_SALARY,
       SALARY+1000 AS AFTER_RAISE, 
       SALARY/4 AS WEEKLY_SALARY,
       ROUND(SALARY/30 ,2) AS ROUNDED_DAILY
       FROM EMPLOYEES;
-- BURADAKI 2 VIRGULDEN SONRA KAC DIGIT OLDUGUNU GOSTERIYOR. 
--EGER KESIRLI SAYI ISTEMIYORSAK VIRGUL VE SAYIYI YAZMIYORUZ


--GROUP FUNCTION | MULTI-ROW FUNCTION | AGGREGATE FUNCTION
-- COUNT, MAX, MIN, SUM, AVG

--- LETS COUNT HOW MANY PEOPLE ARE IN EMPLOYEE TABLE
SELECT COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES;
SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;

SELECT COUNT(*) AS DEPARTMENT_COUNT FROM DEPARTMENTS;

SELECT COUNT(*) AS COUNTRY_COUNT FROM COUNTRIES;

SELECT COUNT(*) AS JOBS_COUNT FROM JOBS;

SELECT COUNT(*) AS JOBHISTORY_COUNT FROM JOB_HISTORY;

SELECT COUNT(*) AS LOCATION_COUNT FROM LOCATIONS;

SELECT COUNT(*) REGION_COUNT FROM REGIONS;


-- FIND OUT WHO MAKES THE MOST MONEY ON THE EMPLOOYES TABLE
-- FIND OUT WHO MAKES THE LEAST MONEY ON THE EMPLOOYES TABLE
-- FIND OUT THE MONTHLY TOTAL BUDGET FOR EMPLOYEES SALARY (GET THE SUM OF ALL SALARY)
-- FIND OUT THE AVERAGE SALARY OF ALL EMPLOOYES 

SELECT MAX(SALARY) FROM EMPLOYEES;
SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT SUM(SALARY) FROM EMPLOYEES;

SELECT AVG(SALARY),
  ROUND(AVG(SALARY)) AS AVERAGE_SALARY,
  ROUND(AVG(SALARY), 2)AS AVERAGE_SALARY_2DIGIT
 FROM EMPLOYEES;

-- FINDOUT ALL ABOVE IN ONE SHOT
SELECT COUNT(*) AS EMPLOYEE_COUNT,
       MAX(SALARY) AS MAXIMIM_SALARY,
       MIN(SALARY) AS MINIMUM_SALARY,
       SUM(SALARY) AS SALARY_TOTAL,
       AVG(SALARY) AS AVERAGE_SALARY,
       ROUND(AVG(SALARY), 2)AS AVERAGE_SALARY_2DIGIT
FROM EMPLOYEES;


-- Getting the result by the Group Specified
-- FIND OUT HOW MANY EMPLOYEE IN EACH DEPARTMENTS
SELECT DEPARTMENT_ID  , COUNT(*) as DEPARTMENT_EMP_COUNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;


-- THIS IS A BAD QUERY !!! IF YOU ADD ANY EXTRA COLUMN 
-- YOU MUST USE GROUP BY TO SPECIFY THE GROUPING CRITERIA!!!!
-- ORA-00937: not a single-group group function
SELECT JOB_ID , COUNT(*) AS JOB_ID_EMP_CNT
FROM EMPLOYEES ; 
-- THIS DOES NOT MAKE SENSE!!!!!!
-- GROUP BY ONLY CAN BE USED WITH AGGREGATE FUNCTIONS !!!!!!!
-- ORA-00979: not a GROUP BY expression
SELECT FIRST_NAME 
FROM EMPLOYEES 
GROUP BY JOB_ID ; 




-- FIND OUT HOW MANY EMPLOYEE IN EACH job_id category
SELECT JOB_ID  , COUNT(*) AS JOB_ID_EMP_COUNT
FROM EMPLOYEES 
GROUP BY JOB_ID ;

--  FIND OUT MAX_SALARY IN EACH DEPARTMENT_ID
SELECT MAX(SALARY) as MAXIMUM_SALARY, DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

--  FIND OUT MIN_SALARY IN EACH DEPARTMENT_ID
SELECT MIN(SALARY) as MINIMUM_SALARY, DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

--  FIND OUT SUM_SALARY IN EACH DEPARTMENT_ID
SELECT SUM(SALARY)as SUM_SALARY, DEPARTMENT_ID 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

--  FIND OUT AVG_SALARY IN EACH DEPARTMENT_ID
SELECT ROUND( AVG(SALARY),2)as AVERAGE_SALARY, DEPARTMENT_ID 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

-- FIND OUT ALL ABOVE IN ONE SHOT 
SELECT  DEPARTMENT_ID , 
        COUNT(*) AS EMPLOYEE_COUNT , 
        MAX(SALARY) AS MAXIMUN_SALARY , 
        MIN(SALARY) AS MINIMUN_SALARY , 
        SUM(SALARY) AS SALARY_TOTAL , 
        ROUND( AVG(SALARY) , 2 ) AS AVERAGE_SAL_2DIGIT
FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
; 



-- FIND OUT HOW MANY EMPLOYEE IN EACH DEPARTMENTS 
--- RESTRICT THE RESULT TO DISPLAY ONLY THOSE DEPARTMENT WITH EMP COUNT MORE THAN 10 

--- IF YOU HAVE MORE CONDITIONS AFTER GROUP BY 
--- YOU CAN USE HAVING CLAUSE  (WHERE DOES NOT WORK HERE !!!!!!)

SELECT DEPARTMENT_ID  , COUNT(*) AS DEP_EMP_CNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING  COUNT(*) > 10   -- Aggregate function can be used after HAVING to restrict reuslt even more 
                        -- WHERE DOES NOT WORK HERE !!!!!!!
; 

-- FIND OUT MAX SALARY IN EACH DEPARTMENT_ID  
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

--- BY EXTENDING ABOVE QUERY , FIND FIND OUT DEPARTMENT WITH MAX SALARY LESS THAN 10000
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) <10000 
; 
-- ONLY PLACE HAVING CLAUSE CAN SHOW UP IS RIGHT AFTER THE GROUP BY !!!!!!!

-- FROM LOCATIONS TABLE 
SELECT COUNTRY_ID, COUNT(*) FROM LOCATIONS GROUP BY COUNTRY_ID;

```sql
-- FIND OUT MAX SALARY IN EACH DEPARTMENT_ID  
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

-- FIND OUT MIN SALARY IN EACH DEPARTMENT_ID 
SELECT MIN(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

-- FIND OUT SUM OF SALARY IN EACH DEPARTMENT_ID 
SELECT SUM(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

-- FIND OUT AVG OF SALARY IN EACH DEPARTMENT_ID 
SELECT  ROUND ( AVG(SALARY) ) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

-- WE CAN COMBINE ALL ABOVE BECAUSE ALL OF THEM ARE GROUPING THE RESULT BY DEPARTMENT_ID

-- FIND OUT ALL ABOVE IN ONE SHOT 
SELECT  DEPARTMENT_ID , 
        COUNT(*) AS EMPLOYEE_COUNT , 
        MAX(SALARY) AS MAXIMUN_SALARY , 
        MIN(SALARY) AS MINIMUN_SALARY , 
        SUM(SALARY) AS SALARY_TOTAL , 
        ROUND( AVG(SALARY) , 2 ) AS AVERAGE_SAL_2DIGIT

FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
;

-- FIND OUT HOW MANY EMPLOYEE IN EACH DEPARTMENTS 
SELECT DEPARTMENT_ID  , COUNT(*) AS DEP_EMP_CNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

-- FIND OUT HOW MANY EMPLOYEE IN EACH DEPARTMENTS 
--- RESTRICT THE RESULT TO DISPLAY ONLY THOSE DEPARTMENT WITH EMP COUNT MORE THAN 10 

--- IF YOU HAVE MORE CONDITIONS AFTER GROUP BY 
--- YOU CAN USE HAVING CLAUSE  (WHERE DOES NOT WORK HERE !!!!!!)

SELECT DEPARTMENT_ID  , COUNT(*) AS DEP_EMP_CNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING  COUNT(*) > 10   -- Aggregate function can be used after HAVING to restrict reuslt even more 
                        -- WHERE DOES NOT WORK HERE !!!!!!!
; 

-- FIND OUT MAX SALARY IN EACH DEPARTMENT_ID  
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ; 

--- BY EXTENDING ABOVE QUERY , FIND FIND OUT DEPARTMENT WITH MAX SALARY LESS THAN 10000
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) <10000 
; 
-- ONLY PLACE HAVING CLAUSE CAN SHOW UP IS RIGHT AFTER THE GROUP BY !!!!!!!

-- FROM LOCAITONS TABLE , FIND OUT HOW MANY LOCATION IN EACH COUNTRY(_ID)
SELECT COUNTRY_ID , COUNT(*)
FROM LOCATIONS 
GROUP BY COUNTRY_ID ;

--- HOW DO I SORT IN SQL 
--- ORDER BY CLAUSE 
-- FOR EXAMPLE : ORDER BY COLUMN NAME OR COLUMN INDEX 

SELECT * FROM EMPLOYEES 
ORDER BY FIRST_NAME ASC  -- DEFAULT ORDER IS ALWAYS ASCENDING ORDER , LOW TO HIGH 
; 

SELECT * FROM EMPLOYEES 
ORDER BY FIRST_NAME DESC  -- MUST BE SET EXPLICITLY , HIGH TO LOW 
; 

-- ORDER THE RESULT BY THE SALARY ASC 
SELECT * FROM EMPLOYEES 
ORDER BY SALARY ASC  ; 

-- ORDER THE RESULT BY THE SALARY DESC 
SELECT * FROM EMPLOYEES 
ORDER BY SALARY DESC  ; 

-- FIND OUT MAX SALARY IN EACH DEPARTMENT_ID  AND ORDER BY DEPARTMENT_ID
SELECT MAX(SALARY) , DEPARTMENT_ID
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID
;
```









