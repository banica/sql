CREATE DATABASE curs4;
	
USE curs4;

CREATE TABLE produse(
id_produs INT(6) PRIMARY KEY AUTO_INCREMENT,
denumire_produs VARCHAR(100) NOT NULL,
pret DOUBLE(7,2) NOT NULL );
	
INSERT INTO PRODUSE VALUES (1,'Iphone 7', 3000) , (2,'Samsung S8' , 2800 );

CREATE TABLE vanzari (prod_id INT NOT NULL AUTO_INCREMENT, 
prod_name VARCHAR(20) NOT NULL, 
prod_cost FLOAT NOT NULL DEFAULT 0.0, 
prod_price FLOAT NOT NULL DEFAULT 0.0, PRIMARY KEY(prod_id));

INSERT INTO vanzari (prod_name, prod_cost, prod_price) VALUES ('Basic Widget',5.95,8.35),('Micro Widget',0.95,1.35),('Mega Widget',99.95,140.00);