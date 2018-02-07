/* Afisati numele categoriilor de produse si 
numarul de produse din fiecare categorie, 
ordonand descrescator dupa numarul de produse si numele categoriei */
SELECT 
    a.denumire, COUNT(b.id_produs) AS nr_produse
FROM
    categorii a
        LEFT JOIN
    produse b ON a.id_categorie = b.id_categorie
GROUP BY a.denumire
ORDER BY nr_produse , a.denumire DESC;

/* Afisati id, nume, prenume client si 
numarul de comenzi al fiecaruia, 
ordonand descrescator dupa numarul de comenzi, nume si prenume*/
SELECT 
    c1.id_client,
    c1.nume,
    c1.prenume,
    COUNT(c2.id_comanda) AS nr_comenzi
FROM
    clienti c1
        LEFT JOIN
    comenzi c2 ON c1.id_client = c2.id_client
GROUP BY c1.id_client
ORDER BY nr_comenzi DESC , nume , prenume;

/* Afisati produsele comandate (denumire, data comenzii) in anul 2016 */
SELECT 
    a.denumire_produs, c.data_comanda
FROM
    produse a
        JOIN
    produse_comandate b ON a.id_produs = b.id_produs
        JOIN
    comenzi c ON c.id_comanda = b.id_comanda
WHERE
    YEAR(c.data_comanda) = 2016;

/* Afisati clientii(id, nume, prenume) care au 
comandat, in total, de mai mult de 7000 de RON */
SELECT 
    a.id_client,
    a.nume,
    a.prenume,
    SUM(d.pret * c.cantitate) AS suma_totala
FROM
    clienti a
        JOIN
    comenzi b ON a.id_client = b.id_client
        JOIN
    produse_comandate c ON b.id_comanda = c.id_comanda
        JOIN
    produse d ON d.id_produs = c.id_produs
GROUP BY a.id_client
HAVING suma_totala > 7000;

/* Afisati lungimea maxima a numelui de client 
si toti clientii care au numele egal cu lungimea maxima */
SELECT 
    nume, LENGTH(nume)
FROM
    clienti
WHERE
    LENGTH(nume) = (SELECT 
            MAX(LENGTH(nume))
        FROM
            clienti); 

/* Afisati toti clientii care data comenzii 
egala cu data ultimei comenzi */
SELECT 
    a.nume, a.prenume, b.data_comanda
FROM
    clienti a
        JOIN
    comenzi b ON a.id_client = b.id_client
WHERE
    b.data_comanda = (SELECT 
            MAX(data_comanda)
        FROM
            comenzi);
            
/* Afisati produsele care sunt mai scumpe decat orice imprimanta */
SELECT 
    b.denumire_produs, b.pret, a.denumire AS categoria
FROM
    categorii a
        JOIN
    produse b ON a.id_categorie = b.id_categorie
WHERE
    pret > (SELECT 
            MAX(pret)
        FROM
            produse
        WHERE
            id_categorie = (SELECT 
                    id_categorie
                FROM
                    categorii
                WHERE
                    denumire LIKE 'imprimante'));
                    
/* varianta fara al treilea subquery */
SELECT 
    b.denumire_produs, b.pret, a.denumire AS categoria
FROM
    categorii a
        JOIN
    produse b ON a.id_categorie = b.id_categorie
WHERE
    pret > (SELECT 
            MAX(pret)
        FROM
            produse
                JOIN
            categorii ON produse.id_categorie = categorii.id_categorie
        WHERE
            categorii.denumire LIKE 'imprimante');
            
/* Afisati produsele care au fost comandate 
atat in anul 2015, cat si in anul 2016 */
SELECT DISTINCT
    a.*
FROM
    produse a
        JOIN
    produse_comandate b ON a.id_produs = b.id_produs
        JOIN
    comenzi c ON c.id_comanda = b.id_comanda
WHERE
    YEAR(c.data_comanda) = 2016
        AND b.id_produs IN (SELECT 
            id_produs
        FROM
            produse_comandate
        WHERE
            id_comanda IN (SELECT 
                    id_comanda
                FROM
                    comenzi
                WHERE
                    YEAR(data_comanda) = 2015));
                    
/* Creati un view care sa contina toti clientii din Bucuresti,
Efectuati operatii de INSERT, UPDATE, DELETE atat pe tabela clienti,
cat si view */
CREATE VIEW clienti_bucuresti AS
    SELECT 
        *
    FROM
        clienti
    WHERE
        localitate LIKE 'bucuresti';
    
/* creati un view cu produsele comandate in lunile de vara (6,7,8) */    
CREATE VIEW comenzi_vara AS
    SELECT 
        denumire_produs, pret, data_comanda
    FROM
        produse a
            JOIN
        produse_comandate b ON a.id_produs = b.id_produs
            JOIN
        comenzi c ON c.id_comanda = b.id_comanda
    WHERE
        MONTH(data_comanda) IN (6, 7, 8);
        
/* creati un view cu produsele comandate in lunile de vara, 
dar mai scumpe de 1000 de RON  */
CREATE VIEW comenzi_vara_1000RON_plus AS
    SELECT 
        *
    FROM
        comenzi_vara
    WHERE
        pret > 1000;