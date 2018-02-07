create view /*pastram denumirea  sa nu fie egal cu numele unui tabel existent*/   as (query);

/*  luam un query */
select distinct p.* from produse as p  left join produse_comandate as pc on p.id_produs=pc.id_produs left join comenzi as c on pc.id_comanda=c.id_comanda where
                    month(c.data_comanda)=3;
      /*  facem view-ul */   
create view produse_comandate_martie as (
select distinct p.* from produse as p  left join produse_comandate as pc on p.id_produs=pc.id_produs left join comenzi as c on pc.id_comanda=c.id_comanda where
                    month(c.data_comanda)=3
										 );
     /* lucram cu  el  ca  un tabel virtual:  produse_comandate_martie */                                    
select * from produse_comandate_martie where pret>400;

/* la operatiunile de scriere ,view-ul nu se mai comporta la fel  */
insert into produse_comandate_martie (
denumire_produs,pret, cantitate, data_introducerii, id_categorie) values
('produs nou' ,1300, 5, now(), 3);
 /*  facem view-ul mai simplu, chiar daca e gresit, vedem greseala si merge si insertul */   
create view clienti_bucuresti as (
select * from clienti  where localitate='Bucuresti');
select *  from clienti_bucuresti;
insert into clienti_bucuresti (nume, prenume, localitate, telefon ) values (
'nume1', 'prenume1', 'Bucuresti', '0749234567'); select *  from clienti_bucuresti;
  /*  pare ca randul e inserat, dar id-ul a fost introdus doar in tabelul de clienti  
  
  !!! obs:
  nu putem face insert intr un view , doar in tabela parinte .
  selectul de la baza sa aibe o asemenea structura incat sa stie unde sa redirectioneze insertul.
  */
  
  /* continuare in sedinta 8
  */
  
    /* view: produsele comandante in lunile de vara
    1.din comenzi scoatem id-urile de comenzi pt perioada de vara
    2. din produse comandante scoatem id-uile de produs care au id-urile de comanda de la pct 1
    3. din produse scoatem detaliile pt produsele cu id-urile de la pct 2
  */
create view produse_comandate_vara_join as
    SELECT p.* ,  c.data_comanda
    FROM produse as p
	JOIN produse_comandate as pc ON p.id_produs = pc.id_produs
	JOIN comenzi as c  ON c.id_comanda = pc.id_comanda
    WHERE
	MONTH(c.data_comanda) IN (6, 7, 8)
    order by p.id_produs;
    
    select * from produse_comandate_vara_join;
    
    insert into produse_comandate_vara_join
    (denumire_produs, pret, cantitate, data_introducerii, id_categorie, data_comanda)  values
    ('test',  12. 23, '2017-10-31', 2, '2015-07-01');
    
    select * from produse_comandate_vara;
    insert into produse_comandate_vara  
    (denumire_produs, pret, cantitate, data_introducerii, id_categorie)  values
    ('test',  12. 23, '2017-10-31', 2);
    select * from produse;
    
    
        /* view: produsele comandate din lunile de vara , dar mai  scumpe de 1000 ron*/
        
  SELECT p.denumire_produs, p.pret, c.data_comanda
    FROM produse as p
	JOIN produse_comandate as pc ON p.id_produs = pc.id_produs
	JOIN comenzi as c  ON c.id_comanda = pc.id_comanda
    WHERE
	MONTH(data_comanda) IN (6, 7, 8) 
    and p.pret>1000.00;
    
  /*tabel temporar: creare, select, delete inregistrare
  */
  create temporary table produse_tmp as ( select * from produse );
  select * from produse_tmp;
  delete from produse_tmp where id_produs>5;
  
    /*tabel temporar: clonare structura
  */
   create temporary table produse_tmp2 like produse;
   
   
    /*tabel temporar: query
  */
  insert into produse_tmp values 
  (select * from produse where id_produs <6);
  
     /*tranzactii
  */
  
  start transaction 
  select * from produse_comandate 
  order by id_produs;

delete from produse_comandate
 where id_produs=1;
 rollback;
 start transaction;
 
insert into produse_comandate (id_comanda, id_produs,cantitate) values 
(7,1,3) ,
          (5,1,5), 
                    (1,1,1,);
commit;
rollback;
 
 start transaction ;
 delete from produse_comandate where id_produs=1;
 select * from produse_comandate 
  order by id_produs;

  
     /*teste si  aplicatii
  */
   select * from produse_comandate 
  order by id_produs;
  rollback;
  start transaction ;
  delete from produse_comandate where id_produs=2;
  savepoint primul;
  delete from produse_comandate where id_produs=3;
  
  savepoint aldoilea;
   delete from produse_comandate where id_produs=4;
  
  savepoint altreilea;
     delete from produse_comandate where id_produs=5;

     rollback to altreilea;
     
     
     alter table produse_comandate add index idx_produs (id_produs);
     
     
     