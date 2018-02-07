/* afisati angajatii si departamentele in care lucreaza
(id, nume, prenume, denumire departament) */
SELECT a.id_angajat, a.nume, a.prenume, d.denumire from angajati a
	LEFT JOIN departamente d ON a.id_departament = d.id_departament;

/* afișați departamentele din companie (id și denumire) 
și numărul de angajați din fiecare departament */
SELECT d.id_departament, d.denumire, COUNT(*) numar FROM angajati a 
	JOIN departamente d ON a.id_departament = d.id_departament 
    GROUP BY a.id_departament;
    
/* afișați angajații (id, nume, prenume) care nu au proiecte alocate */
SELECT a.id_angajat, nume, prenume FROM angajati a
	LEFT JOIN angajat_proiect ap ON a.id_angajat = ap.id_angajat
    WHERE ap.id_angajat IS NULL;
    
/* afișați angajații care au proiecte alocate
(id, nume, prenume, denumire departament, denumire proiect, durata in zile a proiectului) */
SELECT a.id_angajat, a.nume, a.prenume, 
	d.denumire, p.nume, 
    DATEDIFF(data_sfarsit, data_inceput) durata
	FROM angajati a 
	JOIN departamente d ON a.id_departament = d.id_departament
    JOIN angajat_proiect ap ON a.id_angajat = ap.id_angajat
    JOIN proiecte p ON ap.id_proiect = p.id_proiect;
    
/* afișați managerii care au salariul mai mare de 2500 
(id, nume, prenume, salariu) */
SELECT DISTINCT a.id_angajat, a.nume, a.prenume, a.salariu FROM angajati a 
	JOIN angajati m ON a.id_angajat = m.manager
    WHERE a.salariu > 2500 ORDER BY salariu;
