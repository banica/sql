select concat(nume,' ' ,prenume) as nume, salariu  from angajati 
where salariu>1700 
and nume like '%escu';

SELECT nume, prenume, salariu 
FROM angajati 
WHERE salariu > 100 
ORDER BY salariu dESC, nume asc, prenume asc;    


/* inclusiv ianuarie 2015*/
select nume ,prenume , data_angajarii from angajati
where  (year(data_angajarii)<2015 or (year(data_angajarii) <=2))  and salariu<2000 
order by data_angajarii asc;

/*persoanele din dept 1,2,3*/
select nume, id_departament from angajati where id_departament in (1,2,3);

/*nastere ani
*/
select nume from angajati
where year(data_nasterii)>1970 and year(data_nasterii)<1980;

select nume, prenume, data_nasterii from angajati
where year(data_nasterii)between 1970 and 1980;

/*7. selectie nume, prenume, data_angajarii din tabela angajati si, daca data_angajarii este din 2015, afisare text 'Angajat nou', altfel afisarea valorii din campul data_angajarii
*/
select nume, prenume, 
if  (
      year(data_angajarii)=2015,
           concat('Angajat nou-nout ',data_angajarii),
            concat('Angajat vechi ', data_angajarii)
     ) as tip_angajat
from angajati;


/* corecta:  */
select nume, prenume,
concat ( 
         if  (
              year(data_angajarii)=2015,
		      'Angajat nou-nout ',
		      'Angajat vechi '
		), 
              data_angajarii
			) as tip_angajat
from angajati;




/* 8. selectie nume si prenume din tabela angajati si, daca salariul este mai mic de 1500 afisare text Salariu mic, altfel, afisarea valorii din campul salariu */

select nume , prenume , 
                       if(salariu<1500 ,
'salariu mic de bugetar ',
salariu
)                       as tip_salariu_indicat
from angajati
limit 10 ;

/* 12. Sa se afiseze doar numele care au mai mult de 8 litere */
SELECT distinct nume 
FROM angajati 
               WHERE LENGTH(nume) > 8;

/* 13. Sa se afiseze cel mai lung nume din tabela si lungimea acestuia */
SELECT nume, char_length(nume) as lungime
FROM angajati 
order by lungime desc 
limit 1;

/*salariu mediu , afisare cu 2 zecimale, id depart.

*/
select round( avg(salariu) , 2) as salariu_mediu, id_departament from angajati

group by id_departament;