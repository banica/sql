/* 1. Sa se afiseze angajatii al caror nume se termina in 'escu' si au salariul mai mare decat 1700. */
SELECT nume, salariu FROM angajati WHERE nume LIKE '%escu' AND salariu > 1700;
/* 2. Angajatii (nume, prenume, salariu) cu salariul mai mare de 1100 ordonati dupa salariu descrescator si dupa nume si prenume alfabetic */
SELECT nume, prenume, salariu FROM angajati WHERE salariu > 1100 ORDER BY salariu DESC, nume, prenume;    
/* 3. Persoanele angajate pana la inceputul lui 2015 care au salariul mai mic de 2000 ordonare dupa data_angajarii crescator */
SELECT nume, data_angajarii FROM angajati WHERE YEAR(data_angajarii) < 2015 AND salariu < 2000 ORDER BY data_angajarii;   	 
/* 4. angajatii din departamentele 1,2 si 3 */
SELECT nume, id_departament FROM angajati WHERE id_departament IN (1,2,3);
/* 5. angajatii nascuti intre 1970 si 1980 */
SELECT nume, data_nasterii FROM angajati WHERE YEAR(data_nasterii) BETWEEN 1970 AND 1980;


/* exemple operatori matematici */    
/* 6. Se se selecteze un numar aleator intre 7 si 100 */
SELECT FLOOR(7 + (93*RAND()));

/* exemple functii conditionale MySQL */
/* 7. selectie nume, prenume, data_angajarii din tabela angajati si, daca data_angajarii este din 2015, afisare text 'Angajat nou', altfel afisarea valorii din campul data_angajarii */
SELECT nume, prenume, IF(YEAR(data_angajarii)=2015,'Angajat nou', data_angajarii) FROM angajati; 
/* 8. selectie nume si prenume din tabela angajati si, daca salariul este mai mic de 1500 afisare text Salariu mic, altfel, afisarea valorii din campul salariu */
SELECT nume, prenume, IF(salariu < 1500, 'Salariu mic :(', salariu) FROM angajati ;


/* exemple functii pentru siruri de caractere MySQL */
/* 9. Se se afiseze 'nume prenume' din tabela angajati */
SELECT CONCAT(nume,' ', prenume) FROM angajati;
/* 10. Se se afiseze 'nume-prenume' din tabela angajati */
SELECT CONCAT_WS('-', nume, prenume) FROM angajati;
/* 11. Se se afiseze 'nume prenume' din tabela angajati, dar cu majuscule */
SELECT UPPER(CONCAT(nume, ' ', prenume)) FROM angajati;
/* 12. Sa se afiseze doar numele care au mai mult de 8 litere */
SELECT nume FROM angajati WHERE LENGTH(nume) > 8;
/* 13. Sa se afiseze cel mai lung nume din tabela si lungimea acestuia */
SELECT nume, LENGTH(nume) AS lungime FROM angajati ORDER BY lungime DESC LIMIT 1;
/* 14. Sa se afiseze primele 3 litere din numele angajatului. Dar ultimele 3. */
SELECT LEFT(nume, 3) FROM angajati;
SELECT RIGHT(nume, 3) FROM angajati;


/* exemple functii pentru date calendaristice MySQL */
/* 15. afisare angajati nascuti toamna */
SELECT nume, data_nasterii FROM angajati WHERE MONTH(data_nasterii) IN(9,10,11);
/* 16. afisare persoane angajate in anul 2013 */
SELECT nume, data_angajarii FROM angajati WHERE YEAR(data_angajarii) = 2013;


/* exemple functii de agregare (de grup) MySQL */
/* 17. afisarea departamentului si a salariului mediu pentru fiecare departament din baza de date - salariul mediu este afisat rotunjit la 2 zecimale */
SELECT id_departament, ROUND(AVG(salariu),2) FROM angajati GROUP BY id_departament;    
/* 18. afisarea salariului mediu pentru toti angajatii din baza de date */    
SELECT AVG(salariu) FROM angajati;
/* 19. afisarea departamentului si a salariului mediu pentru fiecare departament din baza de date in care salariul mediu este mai mare de 1500 lei - rezultatul obtinut este afisat ordonat crescator dupa salariul mediu */
SELECT id_departament, AVG(salariu) AS salar_mediu FROM angajati GROUP BY id_departament HAVING salar_mediu > 1500 ORDER BY salar_mediu;
/* 20. afisarea departamentului (id_departament) si a numarului de angajati din fiecare departament */
SELECT id_departament, COUNT(*) FROM angajati GROUP BY id_departament;
/* 21. afisarea departamentului (id_departament) si a numarului de angajati din fiecare departament care are cel putin 2 angajati */
SELECT id_departament, COUNT(*) AS numar FROM angajati GROUP BY id_departament HAVING numar >= 2;
/* 22. Departamentele cu 3 angajati (Afisare: id_departament, nr_angajati) */
SELECT id_departament, COUNT(*) AS numar FROM angajati GROUP BY id_departament HAVING numar = 3;
