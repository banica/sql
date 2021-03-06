use sedinta_3;
/* insert into departament (id, denumire)
values (null, 'HR'); */
/* insert into departament (denumire) values ('IT'); */


/* insert into angajati (nume, prenume, cnp, salariul, iddepartament) values 
('Popescu', 'Mihai', 1234567891012, '274.00', 1); 
/* SELECT * FROM DEPARTAMENT; */

/* insert into Proiect set codproiect = 'P10', denumire = 'Testare', durata = 3;

select * from proiect;

INSERT INTO proiect (codproiect, denumire, durata)
values
('P50','Validare', 10),
('P70', 'implementare', 10),
('P11', 'retestare' , 10)

update proiect set denumire = 'VALIDARE' where codproiect = 'P50';
update proiect set codproiect = 'P1' where codproiect = 'P11'; */
/* update angajati set salariul = salariul * 1.10;

delete from departament where id = 3; */

/* insert into departament (denumire) values ('IT'); */
/* STERGE TOATE DATELE DIN TABELA SI RESETEAZA AUTO-INCREMENT 
TRUNCATE TABLE angajati; */
/*
SELECT nume, prenume from angajati where prenume LIKE 'M%'; /*afiseaza doar nume si prenume*/ 
/* select nume, prenume, salariul from angajati where nume='Popescu'; */
/* select nume, prenume from angajati where salariul between 1 and 5;

select * from angajati where prenume = 'Mihai' and salariul > 1; */
select * from angajati where data_angajarii between '2018-01-01' and '2018-12-31';
use sedinta_3;
insert into angajati (nume, prenume, cnp, salariul, iddepartament) values ('Ion', 'Ionescu', 1234567891013, '275.00', 1); 
insert into angajati (nume, prenume, cnp, salariul, iddepartament) values ('Ion', 'Popescu', 1234567891023, '75.00', 1); 
insert into angajati (nume, prenume, cnp, salariul, iddepartament) values ('Aurel', 'Ilie', 1234567891014, '285.00', 1); 
SELECT idDepartament, COUNT(nume), SUM(salariul) from angajati group by idDepartament; /* group by se face de obicei, nu mereu dupa cheie primara */

SELECT nume, count(nume) from angajati group by nume;
/* Salariul mediu mai mare decat o valoare ... */
SELECT idDepartament, AVG(salariul) AS SalariuMediu from angajati group by idDepartament having AVG(salariul) > 100 ORDER BY SalariuMediu DESC;
/*LIMIT 5 Limiteaza la 5 randuri */

SELECT DISTINCT nume, prenume from angajati;  /*DISTINCT ELIMINA DUPLICATE doar ca afisare */

use sedinta_3;
UPDATE proiect SET durata = durata + 2 where durata < 100 ;
SELECT durata, durata+2 from proiect where durata <100 ;

SELECT nume, prenume, data_angajarii from angajati where idDepartament = 1 order by data_angajarii; 
