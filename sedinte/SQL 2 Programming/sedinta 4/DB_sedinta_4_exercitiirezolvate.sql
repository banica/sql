/*FUNCTII*/
select * from produse;
delimiter $$
create function total_produse_comandate (produs int)
returns int
begin
declare v1 int;
select count(*) into v1 from  produse_comandate where id_produs=produs;
return v1;
end $$
select total_produse_comandate (3), denumire_produs from produse where id_produs=3;


/*-------------------------------------------------------------------------------*/

delimiter $$
create function PRET_DUBLU (produs int)
returns DOUBLE
begin
declare v1 DOUBLE;
select PRET into v1 from  produse where id_produs=produs;
return v1;
end $$
select * from produse where id_produs=2;
SELECT PRET_DUBLU (2) AS PRET_DUBLU;

/*-------------------------------------------------------------------------------*/
delimiter $$
create function PROFIT (VENIT DOUBLE , CHELTUIELI DOUBLE)
returns DOUBLE
begin
declare SUMA DOUBLE;
SET SUMA:= VENIT-CHELTUIELI;
RETURN SUMA;
END 
$$
SELECT PROFIT (10000, 6500);

/*-------------------------------------------------------------------------------*/
/*PROCEDURI*/
DELIMITER $$
CREATE PROCEDURE FARA_PARAM
BEGIN
SELECT  COUNT (*) FROM CLIENTI;
END 
$$
CALL FARA_PARAM;

/*-------------------------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE PRODUSE_COMANDATE(AN INT);
BEGIN
SELECT A.DENUMIRE_PRODUS, C.DATA_COMANDA FROM PRODUSE A
JOIN PRODUSE B USING  (ID_PRODUS)
JOIN COMENZI C USING (ID_COMANDA) WHERE YEAR(C.DATA_COMANDA)=AN;
END
$$
CALL PRODUSE_COMANDATE(2015);

/*-------------------------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE  PCT3 (IN PRODUS INT, OUT CATEGORIE VARCHAR (30)) 
BEGIN
SELECT  C.DENUMIRE INTO CATEGORIE FROM CATEGORII C
JOIN PRODUSE P USING (ID_CATEGORIE) WHERE P.ID_PRODUS=PRODUS;
END
$$
CALL  PCT3 (8, @PCT3_V1);
SELECT @PCT3_V1;

/*-------------------------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE PCT4 (INOUT NR INT)
BEGIN
SELECT NR*NR INTO NR;
END
$$
SET @V1=2;
CALL PCT4(@V1);
SELECT @V1;

/*-------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------*/

delimiter $$

create procedure produse_comandate_nume(produs int)
begin
select  a.denumire_produs, count(b.id_prod_com) from produse a
join produse_comandate b using (id_produs) where id_produs=produs group by a.denumire_produs ;
end $$
call produse_comandate_nume(3);

/*-------------------------------------------------------------------------------*/
delimiter $$
create procedure suma_parametri (in param1 int, in param2 int, out param3 int)
begin
set param3:=param1+param2;
end
$$
call suma_parametri(10, 1000, @v1);
select @v1;

/*-------------------------------------------------------------------------------*/
delimiter $$
create procedure_ex8 
begin
 
declare a int default 5;
declare b varchar(50);
declare c int;

set b:='test';
set c:=7;

insert into procedure_ex8 values (a,b,c);

select * from procedure_ex8;

set a:=9;
set b:='Corect';
set c:=10;

insert into procedure_ex8 values (a,b,c);
select * from procedure_ex8 where id>6;
end
$$
call insert_ex8();

