CREATE DATABASE bitacad_sedinta_5_dec2017;

USE bitacad_sedinta_5_dec2017;

/* creare tabela categorii*/
CREATE TABLE categorii(
	id_categorie INT(5) PRIMARY KEY AUTO_INCREMENT,
	denumire varchar(100)
);

/* creare tabela produse*/
CREATE TABLE produse(
	id_produs INT(6) PRIMARY KEY AUTO_INCREMENT,
	denumire_produs VARCHAR(100) NOT NULL,
	pret DOUBLE(7,2),
	cantitate INT(4) DEFAULT 1,
	data_introducerii DATE,
	id_categorie INT(5),
	CONSTRAINT fk_prod_cat FOREIGN KEY (id_categorie) 
		REFERENCES categorii(id_categorie)
);


/* creare tabela clienti*/
CREATE TABLE clienti(
	id_client int(5) AUTO_INCREMENT PRIMARY KEY,
	nume varchar(50),
	prenume varchar(50),
	localitate varchar(100),
	telefon varchar(10)
);


/* creare tabela comenzi*/
CREATE TABLE comenzi(
	id_comanda int(7) AUTO_INCREMENT PRIMARY KEY,
	id_client int(5),
	data_comanda date,
	FOREIGN KEY (id_client) REFERENCES clienti(id_client)
);

/* creare tabela produse_comandate*/
CREATE TABLE produse_comandate (
    id_prod_com INT(7) AUTO_INCREMENT PRIMARY KEY,
    id_comanda INT(7),
    id_produs INT(6),
    cantitate INT(8),
    FOREIGN KEY (id_produs)
        REFERENCES produse (id_produs),
    FOREIGN KEY (id_comanda)
        REFERENCES comenzi (id_comanda)
);


/* introducere inregistrari in tabela categorii*/
INSERT INTO categorii SET denumire = 'Laptop-uri';

INSERT INTO categorii SET denumire = 'Tablete';

INSERT INTO categorii SET denumire = 'Imprimante';

/* introducere inregistrari in tabela produse*/
INSERT INTO produse VALUES
(null, 'Laptop HP', 2400, 10,'2015-01-14',1),
(null, 'Laptop Dell Inspire', 1840, 7,'2015-03-16',1),
(null, 'Tableta Utok', 1200, 15,'2015-04-01',2),
(null, 'Tableta Apple', 3300, 10,'2015-06-02',2),
(null, 'Laptop Fujitsu i5', 2900, 8,'2015-03-27',1),
(null, 'Imprimanta Canon Laser', 1200, 14,'2015-04-01',3),
(null, 'Tableta Utok 2', 950.50, 5,'2015-02-17',2),
(null, 'Imprimanta Samsung Inkjet', 430, 3,'2015-01-21',3),
(null, 'Laptop Toshiba i7', 3100, 31,'2015-06-02',1),
(null, 'Laptop Toshiba i5', 2850.35, 8,'2015-06-23',1),
(null, 'Tableta Apple 2', 2800, 9,'2015-04-01',2),
(null, 'Imprimanta Canon Inkjet', 320.99, 21,'2015-05-12',3),
(null, 'laptop Dell', 1920.50, 2,'2015-06-02',1);

/* introducere inregistrari in tabela clienti*/
INSERT INTO clienti (nume, prenume,localitate, telefon) VALUES
('Ionescu','Maria','Bucuresti','0721112233'),
('Costea','Ionut','Bucuresti','0745010203'),
('Aioanei','Adela','Iasi','0744115501'),
('Stefanescu','Mircea','Bucuresti','0731123456'),
('Georgescu','Adriana','Bucuresti','0722112311'),
('Stanescu','Maria','Bucuresti','0212331515'),
('Ionescu','Maria','Brasov','0745090908'),
('Stefan','Eduard','Brasov','0767987123'),
('Toma','Alina','Arad','0768919801'),
('Ciobotaru','Mircea','Sibiu','0768900123'),
('Constantinescu','Amalia','Bucuresti','0311234341'),
('Manolescu','Ioana','Ploiesti','0720110017'),
('Teodorescu','Maria','Sibiu','0751123321');

/* introducere inregistrari in tabela comenzi*/
INSERT INTO comenzi VALUES
(null, 1, '2015-06-02'),
(null, 2, '2015-07-19'),
(null, 1, '2015-07-02'),
(null, 3, '2015-06-29'),
(null, 3, '2015-07-25'),
(null, 7, '2015-07-12'),
(null, 11, '2015-07-01'),
(null, 8, '2015-07-21'),
(null, 6, '2015-07-02'),
(null, 5, '2015-06-12'),
(null, 5, '2015-07-10'),
(null, 10, '2015-07-03'),
(null, 4, '2015-07-23'),
(null, 1, '2016-01-23'),
(null, 8, '2016-01-15'),
(null, 5, '2015-12-19'),
(null, 2, '2015-12-21'),
(null, 7, '2016-02-27'),
(null, 3, '2016-03-03'),
(null, 4, '2016-03-01'),
(null, 2, '2016-02-12');

/* introducere inregistrari in tabela produse_comandate*/
INSERT INTO produse_comandate (id_comanda,id_produs,cantitate) VALUES
(1, 3, 3),
(1, 7, 1),
(2, 1, 1),
(3, 3, 1),
(4, 9, 4),
(5, 7, 1),
(5, 8, 1),
(5, 2, 2),
(6, 6, 1),
(7, 1, 2),
(7, 2, 1),
(8, 8, 2),
(9, 5, 3),
(10, 4, 2),
(10, 12, 1),
(11, 13, 1),
(12, 7, 5),
(13, 3, 2),
(13, 1, 1),
(13, 9, 1),
(13, 8, 1),
(14, 1, 1),
(15, 1, 1),
(16, 6, 2),
(17, 3, 8),
(18, 5, 3),
(18, 3, 2),
(19, 8, 1),
(20, 6, 2),
(20, 12, 2),
(21, 11, 1);


select * from comenzi;
select * from clienti;

/*------------------------------------------------*/
select id_client , count(id_comanda) from comenzi 
group by id_client
having count(id_comanda) >=2;

select id_client , count(id_comanda) from comenzi 
group by id_client
having count(id_comanda) > (select count(id_comanda) from comenzi where id_client =8);

/*------------------------------------------------*/
select id_categorie, sum(cantitate) as suma from produse 
group by id_categorie 
having suma > (select max(cantitate) from produse);
 /*------------------------------------------------*/
 select id_client, nume from clienti 
 where exists (select id_client from comenzi);
 
 select id_client, nume from clienti 
 where id_client in (select id_client from comenzi);
 /*------------------------------------------------*/
 select * from clienti 
 where id_client in 
(select id_client from comenzi where year(data_comanda)> (select year(now())-2));

select id_client from comenzi where year(data_comanda)> (select year(now())-2);
select year(now())-2;
/*------join-*/
select a.* from clienti a join comenzi b
using (id_client)
where year(b.data_comanda)>(select year(now())-2);
/*------------------------------------------------*/

select a.* from produse a,
(select id_produs , sum(cantitate) as suma_maxima from produse_comandate group by id_produs) as b
where a.id_produs=b.id_produs
and a.cantitate>b.suma_maxima;
 /*------------------------------------------------*/
 select * from produse where denumire_produs like 'L&';
/*------------------------------------------------*/


 