/*

TEMA SEDINTA 3


Creaţi o bază de date în care să se păstreze evidenţa clienţilor unei companii, precum şi facturile emise clienților. 
Un client poate să aibă mai multe facturi, în timp ce o factură este emisă unui singur client. 
Baza de date se va numi clienti_companie.

Tabela clienti reţine informaţii de bază despre clienţii companiei: 
- id_client
- nume
- prenume
- număr de telefon
- localitate. 
Tabela facturi conţine informaţii despre facturile clienţilor: 
- id_factura
- data_factura
- valoare
- clientul caruia i-a fost emisă factura.

Cerinţe:

1) Scrieți instrucțiunea pentru crearea bazei de date.
2) Scrieţi instrucțiunile pentru crearea tabelelor clienti și facturi.
3) Stabiliți tipurile de dată și dimensiunile pentru fiecare câmp al celor două tabele.
4) Scrieţi o instrucţiune SQL prin care să modificați numele tabelei facturi în facturi_clienti.
5) Scrieţi o instrucţiune SQL prin care să reveniți la numele facturi pentru tabela facturi_clienti.
6) Scrieţi o instrucţiune SQL prin care să adăugați o constrângere NOT NULL pe câmpul data_factura din câmpul facturi.
7) Scrieţi o instrucţiune SQL prin care să măriți dimensiunea câmpului nume din tabela clienti.
8) Scrieţi o instrucţiune SQL prin care eliminați constrângerea FOREIGN KEY din tabela facturi.
9) Scrieţi o instrucţiune SQL prin care adăugați o constrângere FOREIGN KEY pe  tabela facturi cu numele fk_fact.
10) Scrieţi o instrucţiune SQL prin care adăugați valoarea implicită (DEFAULT) 0 pe câmpul valoare din tabela facturi.

*/


/* 1. Scrieți instrucțiunea pentru crearea bazei de date. */
CREATE DATABASE IF NOT EXISTS clienti_companie;
use clienti_companie;

DROP TABLE IF EXISTS clienti;

/* 2. Scrieţi instrucțiunile pentru crearea tabelelor clienti și facturi. */
/* 3. Stabiliți tipurile de dată și dimensiunile pentru fiecare câmp al celor două tabele. */

create table clienti(
id_client int(10) primary key auto_increment not null, /* id_client */
nume varchar(20) not null, /* nume client*/ 
prenume varchar(50) not null, /* prenume client */
numar_telefon char(12), /* număr de telefon client */
localitate varchar(50) /* localitate client */
);

DROP TABLE IF EXISTS facturi;
DROP TABLE IF EXISTS facturi_clienti;

create table facturi(
id_factura int(10) primary key auto_increment not null, /* id_factura */
data_factura datetime not null default now(), /* data factura */
valoare double(10,2), /*valoare factura */
id_client int(10), FOREIGN KEY (id_client) REFERENCES clienti(id_client) /*clientul caruia i-a fost emisă factura */
); 

/* 4. Scrieţi o instrucţiune SQL prin care să modificați numele tabelei facturi în facturi_clienti. */
alter table facturi rename facturi_clienti;

/* 5. Scrieţi o instrucţiune SQL prin care să reveniți la numele facturi pentru tabela facturi_clienti. */

alter table facturi_clienti rename facturi;

/* 6. Scrieţi o instrucţiune SQL prin care să adăugați o constrângere NOT NULL pe câmpul data_factura din tabela facturi. */
alter table facturi add constraint fkFacturi foreign key (data_factura) references facturi(id)
/* alter table angajat add constraint fkPopescu foreign key (idDepartament) references departament(id);  */

/* 7. Scrieţi o instrucţiune SQL prin care să măriți dimensiunea câmpului nume din tabela clienti. */

alter table clienti change nume nume varchar(40); 

/* 8.Scrieţi o instrucţiune SQL prin care eliminați constrângerea FOREIGN KEY din tabela facturi. */
/* 9.Scrieţi o instrucţiune SQL prin care adăugați o constrângere FOREIGN KEY pe  tabela facturi cu numele fk_fact. */
/* 10. Scrieţi o instrucţiune SQL prin care adăugați valoarea implicită (DEFAULT) 0 pe câmpul valoare din tabela facturi. */ 

