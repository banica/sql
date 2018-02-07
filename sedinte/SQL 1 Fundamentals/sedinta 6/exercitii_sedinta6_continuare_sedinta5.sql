/*  angajatii nascuti toamna */
select * from angajati where month(data_nasterii) in (9,10,11);

/*          salariu mediu rotunjit la 2 zecimale     */
select round( avg(salariu) , 2) as salariu_mediu, id_departament from angajati
group by id_departament;

/* 19. afisarea departamentului si a salariului mediu pentru fiecare departament din baza de date in care salariul mediu este mai mare de 1500 lei - rezultatul obtinut este afisat ordonat crescator dupa salariul mediu */
SELECT id_departament, AVG(salariu) AS salariu_mediu FROM angajati 
GROUP BY id_departament 
HAVING salariu_mediu > 1500 
ORDER BY salariu_mediu ASC;

/* 20. afisarea departamentului (id_departament) si a numarului de angajati din fiecare departament */
SELECT id_departament, COUNT(*) as numar_angajati FROM angajati
GROUP BY id_departament;


/* 21. afisarea departamentului (id_departament) si a numarului de angajati din fiecare departament care are cel putin 2 angajati */
SELECT id_departament, COUNT(*) AS numar_angajati FROM angajati
 GROUP BY id_departament 
 HAVING numar_angajati >= 2;


/* 22. Departamentele cu 3 angajati (Afisare: id_departament, nr_angajati) */
SELECT id_departament, COUNT(*) AS numar_angajati FROM angajati 
GROUP BY id_departament 
HAVING numar_angajati = 3;


