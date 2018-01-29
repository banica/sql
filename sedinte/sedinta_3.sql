/* Creare tabela cu numele student */
create database if not exists sedinta_3; 

/* Comanda de folosire a bazei de date recent creata */
use sedinta_3;

DROP TABLE IF EXISTS clienti;
DROP TABLE IF EXISTS proiect;
DROP TABLE IF EXISTS detaliiproiect;

/* creare tabela departament */
create table departament(
id int(2) primary key auto_increment,
denumire varchar(100) not null
); 

DROP TABLE IF EXISTS angajati;
/* Creare tabela angajati */

create table angajati(
id int primary key auto_increment, 
nume varchar(50) not null,
prenume varchar(150) not null,
varsta tinyint,
CNP char(13) not null, 
data_angajarii datetime not null default now(), /*data actuala a sistemului */
salariul double(5,2),
poza blob
);


/* MODIFICARE NUME BAZA DE DATE */
alter table angajati rename angajat;
 
/* Stergere camp VARSTA din tabela anggajat */
alter table angajat drop varsta; 

/* Adaugare camp data_nasterii in tabela angajat de tip DATETIME */
alter table angajat add data_nasterii datetime; 

/* Setare tip DATETIME pentru camp data_nasterii din tabela angajat */
alter table angajat change data_nasterii  datanasterii datetime; 

/* Setare tip VARCHAR(75) not NULL pentru camp denumire in tabela departament */
alter table departament change denumire denumire varchar(75) not null; 

/* Creare tabela PROIECT */
create table proiect (
codproiect varchar(5) primary key,
denumire varchar(50),
durata tinyint
);

/* Creare tabela DetaliiProiect. Creare legatura intre tabela Proiect si Angajat*/

create table DetaliiProiect(
codproiect varchar(5),
idAngajat int,
primary key (codproiect, idangajat),
foreign key (codproiect) references proiect(codproiect),
foreign key (idAngajat) references angajat(id)
);

/*Adaugare camp idDepartament de int(2) in tabela angajat */
alter table angajat add column idDepartament int(2); 

alter table angajat add foreign key (idDepartament) references departament(id); 

/*redenumire foregin key din angajat_ibfk_1 in fkPopescu */
alter table angajat drop foreign key angajat_ibfk_1; 
alter table angajat add constraint fkPopescu foreign key (idDepartament) references departament(id);  

/*redenumire tabele; facem CNP din angajat UNIQUE */
 alter table angajat change cnp cnp char(13) not null unique;
/* redenumire tabela angajat in angajati */
rename table angajat to angajati;