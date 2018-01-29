/*

TEMA SEDINTA 4

Creaţi o bază de date în care să se păstreze evidenţa profesorilor și a cursurilor pe care aceștia le predau. 
Presupunem că un profesor poate să predea mai multe cursuri, în timp ce un curs poate fi predat de mai mulți profesori. 
Baza de date se va numi scoala.

Tabela profesori reţine informaţii de bază despre profesori: 
- id_profesor
- nume
- prenume
- localitate
- data angajării
- salariu 

Tabela cursuri conţine informaţii despre cursurile predate: 
- id_curs
- denumire
- durată (număr de lecții).

Cerinţe:

1)  Scrieți instrucțiunea SQL pentru crearea bazei de date.
2)  Stabiliți tipurile de dată și dimensiunile pentru fiecare câmp al celor două tabele și scrieţi instrucțiunile SQL pentru crearea tabelelor profesori și cursuri.
3)  Stabiliți tipul de relație care există între cele 2 tabele și realizați legătura între tabele.
4)  Introduceți înregistrări în tabele (minim 5 înregistrări în fiecare tabelă). Utilizați mai multe variante ale instrucțiunii INSERT.
5)  Scrieți o instrucțiune SQL prin care să modificați localitatea profesorului cu id-ul 3 din tabela profesori.
6)  Scrieți o instrucțiune SQL prin care să mutați cursurile predate de profesorul cu id-ul 1 la profesorul cu id-ul 4.
7)  Scrieți o instrucțiune SQL prin care să majorați cu 20% salariul profesorilor din București.
8)  Scrieţi o instrucţiune SQL prin care să afișați profesorii din provincie (câmpuri afișate: nume, prenume, localitate) ordonați alfabetic după nume și prenume.
9)  Scrieţi o instrucţiune SQL prin care să afișați localitățile existente în tabela profesori. Nu afișati valorile duplicate - (câmp afișat: localitate).
10) Scrieţi o instrucţiune SQL prin care să afișați primele 4 cursuri existente în tabela cursuri, ordonate după durată descrescător și după denumire alfabetic (câmpuri afișate: id_curs, denumire, durată).
11) Scrieţi o instrucţiune SQL prin care să ștergeți cursurile ce sunt alocate profesorului cu id-ul 2.

*/

/* 1)  Scrieți instrucțiunea SQL pentru crearea bazei de date. */
/* 2)  Stabiliți tipurile de dată și dimensiunile pentru fiecare câmp al celor două tabele și scrieţi instrucțiunile SQL pentru crearea tabelelor profesori și cursuri. */

CREATE DATABASE IF NOT EXISTS scoala;
use scoala;

DROP TABLE IF EXISTS profesori;
CREATE TABLE profesori(
id_profesor int(10) primary key auto_increment not null,
nume varchar(20),
prenume varchar(50),
localitate varchar(100),
data_angajarii date not null default now(),/* data angajării */
salariu int
);

DROP TABLE IF EXISTS cursuri;
CREATE TABLE cursuri(
id_curs int(10) primary key auto_increment not null,
denumire varchar(100),
durata  tinyint/* durată (număr de lecții). */
);

/* 4)  Introduceți înregistrări în tabele (minim 5 înregistrări în fiecare tabelă). Utilizați mai multe variante ale instrucțiunii INSERT. */
insert  into profesori(id_profesor,nume,prenume,localitate,data_angajarii,salariu) values 
('1','Anghel','Sorin','Arad','2018-01-01','1500')
/* ('2','Banica','Marian','Arges','2018-01-02','2001,04'),
('3','Baltaretu','Alexandra','2018-01-03','100,40'),
('4','Barbulescu','Elena','Brasov','2018-01-04','500,97'),
('5','Buzea','Mihai','Craiova', '2017-07-07','600,57'),
('6','Coaca','Ionut','Craiova','2016-02-03','400,87'),
('7','Geamanu','Oana','Dambovita','2010-01-10','588,10'),
('8','Ilie','Leonard','Iasi','2019-02-03','10023,45') */
