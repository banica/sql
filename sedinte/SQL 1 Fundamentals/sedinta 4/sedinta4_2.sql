
INSERT INTO profesori (id,nume, prenume, localitate, data_angajare,salariu)
VALUES
 (1,'vasile','robert','bucuresti','2015-02-23','5000'),
 (2,'ion','silviu','gaesti','2017-02-17','2300'),
 (3,'popescu','mircea','ploiesti','2013-05-21','6500'),
 (4,'popa','ionel','slatina','2015-06-30','3600'),
 (5,'vasile','mirel','bucuresti','2016-09-23','5000');
 
 
INSERT INTO cursuri (id,denumire, durata)
VALUES
 (1,'curs 1',7),
 (2,'curs 2',5),
  (3,'curs 3',2),
   (4,'curs 4',9),
    (5,'curs 5',1);
    
    
  INSERT INTO cursuri_predate (id,id_profesor, id_curs)
  VALUES
  (1,1,1),
  (2,2,2),
  (3,3,3),
  (4,4,4),
  (5,5,5);
   
  UPDATE cursuri SET durata='9';
  UPDATE cursuri_predate SET id_profesor=4 WHERE id_profesor =1;
  
 UPDATE profesori SET salariu =salariu *1.2 WHERE localitate = 'bucuresti';
 
 SELECT nume,prenume, localitate FROM profesori
 WHERE localitate<>'bucuresti'
 ORDER BY nume ASC ,prenume ASC;
  
SELECT nume,prenume, localitate FROM profesori
ORDER BY localitate ASC ,prenume DESC;


SELECT DISTINCT  localitate FROM profesori;

SELECT * FROM profesori LIMIT 3;

SELECT * FROM profesori LIMIT 1,3;

SELECT * FROM profesori LIMIT 2,2;


UPDATE cursuri SET durata=7 WHERE id<=3;

SELECT * FROM cursuri 
ORDER BY durata DESC, denumire ASC
LIMIT 4;


