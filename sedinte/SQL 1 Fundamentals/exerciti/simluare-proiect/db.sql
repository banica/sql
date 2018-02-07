/* ------------------------- punctul 1 ------------------- */
create database bitacad_sedinta_9;
use bitacad_sedinta_9;

CREATE TABLE student (
    id_student INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(30),
    prenume VARCHAR(30),
    cnp CHAR(13),
    data_admitere DATE,
    telefon VARCHAR(20),
    email VARCHAR(30)
);

CREATE TABLE materie (
    id_materie INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(30)
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(30),
    prenume VARCHAR(30),
    grad VARCHAR(30),
    id_materie INT,
    CONSTRAINT fk_materie FOREIGN KEY (id_materie)
        REFERENCES materie (id_materie)
);

CREATE TABLE nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    id_profesor INT,
    valoare TINYINT,
    CONSTRAINT fk_student FOREIGN KEY (id_student)
        REFERENCES student (id_student)
);

/* ------------------------- punctul 3 ------------------- */

alter table nota 
	add constraint fk_profesor foreign key (id_profesor) 
    references profesor(id_profesor);
    
alter table nota rename note;
alter table note rename nota;

alter table materie add optional ENUM('0','1');
alter table materie drop optional;

alter table materie change nume nume char(30);
alter table materie change nume nume varchar(30);

alter table materie add unique(nume);

/* ------------------------- punctul 4 ------------------- */

insert into materie(nume) 
	values ('Matematica'), ('Informatica'), ('Economie'), ('Filosofie'),
    ('Statistica');
    
/* alte instructiuni de insert aici */    

/* ------------------------- punctul 5 ------------------- */

UPDATE materie 
SET 
    nume = 'Info'
WHERE
    nume = 'Informatica';
UPDATE materie 
SET 
    nume = 'Informatica'
WHERE
    nume = 'Info';

/* ------------------------- punctul 6 ------------------- */

DELETE FROM nota 
WHERE
    id_nota = 1;

/* ------------------------- punctul 7 ------------------- */

SELECT 
    nume
FROM
    materie
ORDER BY nume;

SELECT 
    nume, prenume
FROM
    profesor
ORDER BY nume , prenume;

SELECT 
    COUNT(*)
FROM
    student;

SELECT 
    *
FROM
    student
WHERE
    YEAR(data_admitere) = 2015;

/* ------------------------- punctul 8 ------------------- */

SELECT 
    p.nume, p.prenume, m.nume
FROM
    profesor p
        JOIN
    materie m ON p.id_materie = m.id_materie;
    
SELECT 
    s.nume,
    p.nume AS 'Nume profesor',
    p.prenume AS 'Prenume profesor'
FROM
    student s
        JOIN
    nota n ON s.id_student = n.id_student
        JOIN
    profesor p ON n.id_profesor = p.id_profesor
WHERE
    s.cnp = 123;
    
SELECT 
    s.nume,
    p.nume AS 'Nume profesor',
    p.prenume AS 'Prenume profesor',
    m.nume as 'Nume materie'
FROM
    student s
        JOIN
    nota n ON s.id_student = n.id_student
        JOIN
    profesor p ON n.id_profesor = p.id_profesor
		join materie m on p.id_materie = m.id_materie
WHERE
    s.cnp = 123; 
    
/* ------------------------- punctul 9 ------------------- */

SELECT DISTINCT
    nume, prenume
FROM
    student s
        JOIN
    nota n ON s.id_student = n.id_student
        AND n.valoare = (SELECT 
            MAX(valoare)
        FROM
            nota);
            
/* ------------------------- punctul 10 ------------------- */
            
CREATE VIEW view81 AS
    SELECT 
        s.nume,
        p.nume AS 'Nume profesor',
        p.prenume AS 'Prenume profesor'
    FROM
        student s
            JOIN
        nota n ON s.id_student = n.id_student
            JOIN
        profesor p ON n.id_profesor = p.id_profesor
    WHERE
        s.cnp = 123;
        
CREATE VIEW view82 AS
    SELECT 
        s.nume,
        p.nume AS 'Nume profesor',
        p.prenume AS 'Prenume profesor',
        m.nume AS 'Nume materie'
    FROM
        student s
            JOIN
        nota n ON s.id_student = n.id_student
            JOIN
        profesor p ON n.id_profesor = p.id_profesor
            JOIN
        materie m ON p.id_materie = m.id_materie
    WHERE
        s.cnp = 123;

update view82 set `Nume profesor` = 'John' where nume = 'Vasilescu';

/* Update-urile merg, dar inserturile nu vor functiona datorita 
restrictiilor legate de cheile externe */