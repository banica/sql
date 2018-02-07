select sum(salariu) from angajati;
select min(salariu) as salariul_minim from angajati;
select max(salariu) from angajati;
select distinct salariu from angajati order by salariu asc limit 3;
select count(salariu) from angajati;

select avg(salariu) , id_departament  from angajati group by id_departament;

select avg(salariu) as salariu_mediu , id_departament
  from angajati
  where id_departament>2
  group by id_departament 
  having  salariu_mediu>1000; 
  
select       nume,
		     prenume, 
             month(data_angajarii) as luna_angajare
from angajati
where month(data_angajarii) IN (6,7,8)
ORDER BY LUNA_ANGAJARE ASC;

SELECT round(15.35, 1);
select truncate(15.35, 1) ;
select least(1,3);

select concat(id_angajat,' ', nume, ' ', prenume) as nume_complet from angajati;
select concat_ws(' ', id_angajat, nume, prenume) as nume_complet from angajati;
select concat_ws(
' ', 
id_angajat,
 trim(nume),
 trim(prenume)
 ) as nume_complet from angajati;

select curtime();
select curdate();
select dayofyear('2010-10-10');














