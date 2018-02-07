select * from testsedinta6.angajati;


select a.nume, a.prenume, d.denumire
 from angajati as a
join departamente as d
on a.id_departament=d.id_departament;

select a.nume, a.prenume, d.denumire as departament 
from departamente as d
left join angajati as a
on  a.id_departament=d.id_departament;

select a.nume, a.prenume, d.denumire as departament 
from departamente as d
right join angajati as a
on  a.id_departament=d.id_departament;

/*
afisati angajatii si  dpt in care lucreaza
*/

select a.id_angajat , a.nume, a.prenume, d.denumire, a.id_departament as departament from angajati as a 
left join departamente as d 
on a.id_departament=d.id_departament
order by id_angajat;

/*
departm din companie si nr de angajati
*/
select d.denumire, d.id_departament as departament, count(a.id_angajat) as numar_angajati
from departamente  as d 
left join angajati as a
on d.id_departament=a.id_departament
group by d.id_departament;

/* afișați angajații (id, nume, prenume) care nu au proiecte alocate in 2 moduri  */

SELECT a.id_angajat, nume, prenume,  ap.id_proiect 
FROM angajati as a
LEFT JOIN angajat_proiect as ap
ON a.id_angajat = ap.id_angajat
WHERE ap.id_proiect IS not NULL;

SELECT a.id_angajat, nume, prenume, count(ap.id_proiect) as nr_proiecte
FROM angajati as a
LEFT JOIN angajat_proiect as ap
ON a.id_angajat = ap.id_angajat
group by a.id_angajat having nr_proiecte>0;

/* afișați angajații care au proiecte alocate
(id, nume, prenume, denumire departament, denumire proiect - data inceput si  final) */
SELECT  a.nume, a.prenume, d.denumire as departament, ap.id_proiect as nume_proiect, p.nume as proiect, 
  p.data_inceput,
  p.data_sfarsit, 
  datediff(p.data_sfarsit, p.data_inceput) as durata
FROM angajati as a
left JOIN angajat_proiect as ap ON a.id_angajat = ap.id_angajat
left JOIN departamente    as d  ON a.id_departament = d.id_departament
left JOIN proiecte        as p  ON ap.id_proiect = p.id_proiect
where p.nume is not null ;

  /* afișați managerii care au salariul mai mare de 2500 
(id, nume, prenume, salariu) */

select distinct a1.id_angajat, a1.nume, a1.prenume, a1.salariu from angajati as a1 
join angajati as a2 on a1.id_angajat=a2.manager
where a1.salariu>2500;



