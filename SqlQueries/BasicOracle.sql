
--Date functions 

SELECT
    current_date
FROM
    dual; -- 25-APR-21
    
SELECT
    current_date - ( current_date - 4 )
FROM
    dual; --4
    
SELECT
    EXTRACT(YEAR FROM current_date)
FROM
    dual; --2021
    
SELECT
    EXTRACT(DAY FROM current_date)
FROM
    dual; --25
    
SELECT
    EXTRACT(MONTH FROM current_date)
FROM
    dual; --4
    
SELECT
    last_day(current_date)
FROM
    dual; --30-APR-21
    
    
SELECT
    last_day(current_date) + 1
FROM
    dual; --01=MAY-21
    

SELECT
    add_months(current_date, 5) AS addmnths
FROM
    dual; --25-SEP-21
    
SELECT
    trunc(months_between(sysdate, hire_date))
FROM
    employees; ---406
    
SELECT
    TO_DATE('01-12-2020', 'DD-MM-YYYY') AS date1
FROM
    dual; --01-DEC-20

SELECT
    to_char(DATE '2017-01-01', 'DL')
FROM
    dual; --Sunday, January 01, 2017

SELECT
    next_day(current_date, 'SUNDAY')
FROM
    dual;--02-MAY-21

SELECT
    year_hired,
    COUNT(employee_id) AS cnt
FROM
    (
        SELECT
            EXTRACT(YEAR FROM hire_date) AS year_hired,
            employee_id
        FROM
            employees
    ) A
where year_hired> 1990
GROUP BY
    year_hired 
ORDER BY year_hired, cnt ASC;

--1991	1
--1993	1
--1994	7
--1995	4
--1996	10
--1997	28
--1998	23
--1999	18
--2000	11

Select
    Days,
    Count(Employee_Id) As Cnt
From
    (
        Select
             Current_Date - Hire_Date As Days1,
             Trunc(Current_Date - Hire_Date) As Days,
            Employee_Id
        From
            Employees
    ) A
Group By
    Days
Order By Days, Cnt Asc;

--8523	1
--8598	1
--8834	1
--8051	1
--7749	1
--8326	1
--7762	1
--8434	1
--7782	1