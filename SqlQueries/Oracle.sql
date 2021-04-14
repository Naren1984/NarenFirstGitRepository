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