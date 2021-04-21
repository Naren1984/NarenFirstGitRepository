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
