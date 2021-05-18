--Sql Queries

select Name||'('||substr(Occupation,1,1)||')' from OCCUPATIONS
order by Name;
select 'There are a total of '||count(Name)||' '||lower(Occupation)||'s.' from OCCUPATIONS
group by Occupation
order by count(Name) asc, Occupation asc;


--i/p:
Name   Occupations
Aamina Doctor

--o/p:

Aamina(D)
Ashley(P)
Belvet(P)
Britney(P)
Christeen(S)
Eve(A)
Jane(S)
Jennifer(A)
Jenny(S)
Julia(D)
Ketty(A)
Kristeen(S)
Maria(P)
Meera(P)
Naomi(P)
Priya(D)
Priyanka(P)
Samantha(A)
There are a total of 3 doctors.
There are a total of 4 actors.
There are a total of 4 singers.
There are a total of 7 professors.


---
select d.name, p.name, s.name, a.name from (
(select row_number() OVER (PARTITION BY OCCUPATION ORDER BY name ) as sno, name from OCCUPATIONS
where OCCUPATION='Doctor') d
full outer join 
(select row_number() OVER (PARTITION BY OCCUPATION ORDER BY name ) as sno, name from OCCUPATIONS
where occupation='Professor') p
on d.sno = p.sno
full outer join
(select row_number() OVER (PARTITION BY OCCUPATION ORDER BY name ) as sno, name from OCCUPATIONS
where occupation='Singer') s
on p.sno = s.sno
full outer join
(select row_number() OVER (PARTITION BY OCCUPATION ORDER BY name ) as sno, name from OCCUPATIONS
where occupation='Actor') a
on s.sno = a.sno  
);

---second solution : - (pivot concept : https://www.oracletutorial.com/oracle-basics/oracle-pivot/)

select D1_max_name, P1_max_name,  S1_max_name, A1_max_name from 
( 
select row_number() over(partition by occupation order by name) as sno, occupation, name from occupations 
) 
pivot (
    max(name) as max_name for occupation in ('Doctor' D1,'Professor' P1,'Actor' A1,'Singer' S1)
)
order by sno
;

--pivot column names would be : pivot_in_clause alias || '_' || pivot_clause alias
--i/p:
Name , Occupation 
Samantha Doctor
Julia	 Actor

--o/p 
D1, P1, A1, S1
Aamina Ashley Christeen Eve 
Julia Belvet Jane Jennifer 
Priya Britney Jenny Ketty 
NULL Maria Kristeen Samantha 
NULL Meera NULL NULL 
NULL Naomi NULL NULL 
NULL Priyanka NULL NULL


---- not in will not work if sub query has null values in list of values.
--Sol 1:-
select n, type from (
select n, 'Root' as type from bst
where p is null
union
select n, 'Leaf' as type from bst
where n not in (select distinct p from bst where p is not null)
union
select n, 'Inner' as type from bst
where p is not null 
and n in (select distinct p from bst))
order by n asc;

--Sol 2:-

select N, Case When P IS NULL then 'Root' 
               when N in (select distinct P from BST) then 'Inner'
               else 'Leaf' end Type from BST
order by N asc;

--Sol 3: - 

SELECT N, IF(P IS NULL,'Root',IF((SELECT COUNT(*) FROM BST WHERE P=B.N)>0,'Inner','Leaf')) 
FROM BST AS B ORDER BY N;

--i/p 
1 2
3 2
5 6
7 6
2 4
6 4
4 15
8 9
10 9
12 13
14 13
9 11
13 11
11 15
15 NULL

--o/p
1 Leaf
2 Inner
3 Leaf
4 Inner
5 Leaf
6 Inner
7 Leaf
8 Leaf
9 Inner
10 Leaf
11 Inner
12 Leaf
13 Inner
14 Leaf
15 Root

---left join & group 
select c.company_code, c.founder, count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), count(distinct m.manager_code), count(distinct e.employee_code)
from company c
left join lead_manager l on c.company_code=l.company_code
left join senior_manager s on l.lead_manager_code=s.lead_manager_code
left join manager m on s.senior_manager_code=m.senior_manager_code
left join employee e on m.manager_code=e.manager_code
group by c.company_code,c.founder 
order by c.company_code;

--Printing prime numbers

SELECT LISTAGG(x.l, '&') WITHIN GROUP (ORDER BY x.l) gr
FROM 
	(
		SELECT 1 g
		, seq.l
		, CASE WHEN seq.l = 1 THEN NULL
		WHEN seq.l IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31) THEN 0
		WHEN MOD(seq.l, 2) = 0 THEN NULL
		WHEN MOD(seq.l, 3) = 0 THEN NULL
		WHEN MOD(seq.l, 5) = 0 THEN NULL
		WHEN MOD(seq.l, 7) = 0 THEN NULL
		WHEN MOD(seq.l, 11) = 0 THEN NULL
		WHEN MOD(seq.l, 13) = 0 THEN NULL
		WHEN MOD(seq.l, 17) = 0 THEN NULL
		WHEN MOD(seq.l, 19) = 0 THEN NULL
		WHEN MOD(seq.l, 23) = 0 THEN NULL
		WHEN MOD(seq.l, 29) = 0 THEN NULL
		WHEN MOD(seq.l, 31) = 0 THEN NULL
		ELSE 0
		END p
		FROM 
			(
				SELECT LEVEL l 
				FROM DUAL connect by level <= 1000
			) seq
	) x
WHERE x.p IS NOT NULL
GROUP BY x.g;

--o/p
2&3&5&7&11&13&17&19&23&29&31&37&41&43&47&53&59&61&67&71&73&79&83&89&97&101&103&107&109&113&127&131&137&139&149&151&157&163&167&173&179&181&191&193&197&199&211&223&227&229&233&239&241&251&257&263&269&271&277&281&283&293&307&311&313&317&331&337&347&349&353&359&367&373&379&383&389&397&401&409&419&421&431&433&439&443&449&457&461&463&467&479&487&491&499&503&509&521&523&541&547&557&563&569&571&577&587&593&599&601&607&613&617&619&631&641&643&647&653&659&661&673&677&683&691&701&709&719&727&733&739&743&751&757&761&769&773&787&797&809&811&821&823&827&829&839&853&857&859&863&877&881&883&887&907&911&919&929&937&941&947&953&967&971&977&983&991&997


SELECT
    employee_id,
    department_id,
    salary,
    row_number() OVER(PARTITION BY department_id ORDER BY salary DESC)  AS rownumber,
    RANK() OVER(PARTITION BY department_id ORDER BY salary DESC)  AS RANK,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC)  AS denserank
FROM
    employees
    where department_id=60;

EMPLOYEE_ID, DEPARTMENT_ID, SALARY, ROWNUMBER, RANK, DENSERANK
103	60	9000	1	1	1
104	60	6000	2	2	2
105	60	4800	3	3	3
106	60	4800	4	3	3
107	60	4200	5	5	4


SELECT 
    DEPARTMENT_ID,
    FIRST_NAME,
    salary,
    SUM(salary) OVER (PARTITION BY DEPARTMENT_ID ORDER BY salary,FIRST_NAME) CUMDEPTTOT,
    SUM(salary) OVER (PARTITION BY DEPARTMENT_ID) DEPTTOTAL,
    SUM(salary) OVER (ORDER BY DEPARTMENT_ID, salary) CUMTOT,
    SUM(salary) OVER () TOTSAL
FROM 
    employees
WHERE DEPARTMENT_ID IN (10,20,30,40)
ORDER BY 
    DEPARTMENT_ID, 
    salary
;


DEPARTMENT_ID, FIRST_NAME, SALARY, CUMDEPTTOT, DEPTTOTAL, CUMTOT, TOTSAL
10				Jennifer	4400		4400	4400	4400	54800
20				Pat			6000		6000	19000	10400	54800
20				Michael		13000		19000	19000	23400	54800
30				Karen		2500		2500	24900	25900	54800
30				Guy			2600		5100	24900	28500	54800
30				Sigal		2800		7900	24900	31300	54800
30				Shelli		2900		10800	24900	34200	54800
30				Alexander	3100		13900	24900	37300	54800
30				Den			11000		24900	24900	48300	54800
40				Susan		6500		6500	6500	54800	54800


---Grouping sets

SELECT
    department_id,
    manager_id,
    COUNT(*)
FROM
    employees 
WHERE department_id IN (10,20, 30,40)
GROUP BY
    GROUPING SETS ( department_id,
                    manager_id )
ORDER BY department_id, manager_id
 ;

DEPARTMENT_ID, MANAGER_ID, COUNT(*)
10							1
20							2
30							6
40							1
						100	2
						101	2
						114	5
						201	1

select rpad('*', 6-(level), '*')
from dual
connect by level <= 5;

*****
****
***
**
*	

----Consecutive dates where people visited more than 100.

CREATE TABLE visits (
    id          INTEGER,
    visit_date  DATE,
    people      INTEGER
);

insert into visits values( 1, to_date('2021-04-01', 'YYYY-MM-DD'), 110);
insert into visits values( 2, to_date('2021-04-02', 'YYYY-MM-DD'), 110);
insert into visits values( 3, to_date('2021-04-03', 'YYYY-MM-DD'), 115);
insert into visits values( 4, to_date('2021-04-04', 'YYYY-MM-DD'), 110);
insert into visits values( 5, to_date('2021-04-06', 'YYYY-MM-DD'), 118);
insert into visits values( 6, to_date('2021-04-08', 'YYYY-MM-DD'), 119);
insert into visits values( 7, to_date('2021-04-09', 'YYYY-MM-DD'), 110);
insert into visits values( 8, to_date('2021-04-10', 'YYYY-MM-DD'), 118);
insert into visits values( 9, to_date('2021-04-11', 'YYYY-MM-DD'), 110);

WITH t AS (
    SELECT
        id,
        visit_date,
        people,
        visit_date - id AS diff
    FROM
        visits
), t1 AS (
    SELECT
        id,
        visit_date,
        people,
        COUNT(id)
        OVER(PARTITION BY diff) AS cnt
    FROM
        t
)
SELECT
    id,
    visit_date,
    people
FROM
    t1
WHERE
    cnt > 3;

--output:
ID, VISIT_DATE, PEOPLE
1	01-APR-21	110
2	02-APR-21	110
3	03-APR-21	115
4	04-APR-21	110
6	08-APR-21	119
7	09-APR-21	110
8	10-APR-21	118
9	11-APR-21	110

---Write a SQL query to get the second highest salary from the Employee table.

select max(Salary) as SecondHighestSalary  from Employee
where salary not in (select max(Salary) from Employee );

---Write a SQL query to get the nth highest salary from the Employee table.

CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    select salary into result from (
    select salary, dense_rank() over (order by salary desc) as rnk from Employee
    )
    where rnk=N
    and rownum=1;
    
    RETURN result;
END;

--i/p
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

--o/p
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

---Write an SQL query to find all numbers that appear at least three times consecutively.

select distinct Num as ConsecutiveNums from (
select ID - lag(id, 2) over (partition by Num order by Id, Num asc) as CID , Num from logs
)
where CID=2;

Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result table:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

-------Cancellation Rate

with t as (select id, Request_at, status from Trips p, users u, users u1
           where p.Driver_Id = u.users_Id
           and p.client_id=u1.users_Id
           and u.banned='No'
           and u1.banned='No'
           and (Request_at between '2013-10-01' and '2013-10-03'))
           
select Request_at as "Day", cast(count(case when status like 'cancelled%' then 1 else null end)/count(status) as decimal(4,2)) as "Cancellation Rate"
from t
group by Request_at
order by Request_at asc;


Trips table:
+----+-----------+-----------+---------+---------------------+------------+
| Id | Client_Id | Driver_Id | City_Id | Status              | Request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+

Users table:
+----------+--------+--------+
| Users_Id | Banned | Role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

Result table:
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+

On 2013-10-01:
  - There were 4 requests in total, 2 of which were canceled.
  - However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
  - Hence there are 3 unbanned requests in total, 1 of which was canceled.
  - The Cancellation Rate is (1 / 3) = 0.33

 ----- top three salaries.
 The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

---Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+


--Exchange Seats
i/p
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+

o/p
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+

query : 
select id, case when mod(id,2) = 0 then lag(student) over (order by id asc)
                else nvl(lead(student) over (order by id asc), student) end as student
from seat
order by 1;

-->>>>>>>>>>>>>>>
--Write sql to reset sequence numbers after changing dept number.
drop table t1;

create table t1 (
  dept number,
  date1 date
);

Table created.

insert into t1 values (100, '01-jan-2013');
insert into t1 values (100, '02-jan-2013');
insert into t1 values (100, '03-jan-2013');
insert into t1 values (200, '04-jan-2013');
insert into t1 values (200, '05-jan-2013');
insert into t1 values (200, '06-jan-2013');
insert into t1 values (100, '07-jan-2013');
insert into t1 values (100, '08-jan-2013');
insert into t1 values (100, '09-jan-2013');
insert into t1 values (200, '10-jan-2013');
insert into t1 values (100, '11-jan-2013');
insert into t1 values (100, '12-jan-2013');
insert into t1 values (100, '13-jan-2013');
commit;

select dept, date1,StartFlag,grp,
       row_number() over (partition by dept, grp order by date1) as rnk
from (select dept, date1, startflag,
             sum(StartFlag) over (partition by dept order by date1) as grp
      from (select t1.*,
                   (case when dept = lag(dept) over (order by date1)
                         then 0
                         else 1
                    end) as StartFlag
            from t1
           ) t1
     ) t1
order by date1;

DEPT DATE1   STARTFLAG GRP RNK
100 01-JAN-13   1        1   1
100 02-JAN-13   0        1   2
100 03-JAN-13   0        1   3
200 04-JAN-13   1        1   1
200 05-JAN-13   0        1   2
200 06-JAN-13   0        1   3
100 07-JAN-13   1        2   1
100 08-JAN-13   0        2   2
100 09-JAN-13   0        2   3
200 10-JAN-13   1        2   1
100 11-JAN-13   1        3   1
100 12-JAN-13   0        3   2
100 13-JAN-13   0        3   3

---<<<<<<<<<<<<<<<<<<<<<<

--->>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Hierarchical employee and manager levels

with RECURSIVE emp_cte as
(
select empno, ename, mgr, cast('' as varchar(50)) as mgrname, 0 as emplevel
from scott.emp
where mgr is null
union all
select e.empno AS empno , e.ename AS ename, e.mgr AS mgr, cast(m.ename as varchar(50)) as mgrname, emplevel+1 as emplevel
from scott.emp as e inner join emp_cte as m
on e.mgr=m.empno
)
select * from emp_cte;


-->> LEVEL and connect by prior 

SELECT LEVEL, LPAD (' ', 2 * (LEVEL - 1)) || ename "employee", empno, mgr "manager"
FROM scott.emp START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

select level, lpad(' ',2*(level-1)) || ename as employeename, empno, mgr, sys_connect_by_path(ename,'/') as path
from scott.emp START WITH mgr IS NULL
connect by prior empno=mgr;

LEVEL,EMPLOYEENAME,EMPNO,MGR,PATH
1,KING,7839, - ,/KING
2,  JONES,7566,7839,/KING/JONES
3,    SCOTT,7788,7566,/KING/JONES/SCOTT
4,      ADAMS,7876,7788,/KING/JONES/SCOTT/ADAMS
3,    FORD,7902,7566,/KING/JONES/FORD
4,      SMITH,7369,7902,/KING/JONES/FORD/SMITH
2,  BLAKE,7698,7839,/KING/BLAKE
3,    ALLEN,7499,7698,/KING/BLAKE/ALLEN
3,    WARD,7521,7698,/KING/BLAKE/WARD
3,    MARTIN,7654,7698,/KING/BLAKE/MARTIN
3,    TURNER,7844,7698,/KING/BLAKE/TURNER
3,    JAMES,7900,7698,/KING/BLAKE/JAMES
2,  CLARK,7782,7839,/KING/CLARK
3,    MILLER,7934,7782,/KING/CLARK/MILLER



SELECT ename "Employee", CONNECT_BY_ROOT ename "Manager",
LEVEL-1 "Pathlen", SYS_CONNECT_BY_PATH(ename, '/') "Path"
FROM scott.emp
WHERE LEVEL > 1 and deptno = 10
CONNECT BY PRIOR empno = mgr
ORDER BY "Employee", "Manager", "Pathlen", "Path";


Employee  Manager Pathlen     Path
CLARK     KING        1     /KING/CLARK
MILLER    CLARK       1     /CLARK/MILLER
MILLER    KING        2     /KING/CLARK/MILLER




