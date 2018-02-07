CREATE DATABASE curs1_28Nov;
use curs1_28Nov;

CREATE TABLE doctori ( doctor_id INT AUTO_INCREMENT PRIMARY KEY,
								doctor_name VARCHAR(255) NOT NULL );

INSERT INTO DOCTORI(doctor_name) VALUES ('Marin Ion'),('Miron Alex'),('Marian M'), ('Stefan P') , ('Pediatrie 2');

CREATE TABLE specializare ( id_specializare INT AUTO_INCREMENT PRIMARY KEY,
								descriere VARCHAR(255) NOT NULL ,
								doctor_id INT NOT NULL );

ALTER TABLE specializare ADD CONSTRAINT fk1 FOREIGN KEY (doctor_id) REFERENCES  doctori(doctor_id);

INSERT INTO specializare (descriere,doctor_id) VALUES ('Chirurgie',1) , ('Oftalmologie',2),('Pediatrie',5),('Ginecologie',4);


CREATE TABLE programari ( id_programare INT AUTO_INCREMENT PRIMARY KEY,
								   zi VARCHAR(255) NOT NULL,
								   ora DATETIME NOT NULL,
								   doctor_id INT NOT NULL);
						   
INSERT INTO programari(zi,ora,doctor_id) VALUES ('Luni', '2017-04-17 11:12:07',1),('Luni', '2017-04-17 14:12:07',2),
('Marti', '2017-04-17 09:12:07',3),('Luni', '2017-04-17 16:12:07',1);

CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
Name NVARCHAR(50),
ManagerID INT
);
INSERT INTO Employee values ( 1, 'Mike', 3) ,
(2, 'David', 3),
(3, 'Roger', NULL) ,
(4, 'Marry',2) ,
(5, 'Joseph',2) ,
(7, 'Ben',2 );



/*exercitiul  2*/
select d.doctor_id, s.id_specializare, d.doctor_name
from doctori as d 
join specializare as s 
using (doctor_id);

/*exercitiul  3*/

select doctor_id, doctor_name, descriere , zi, ora 
from doctori as d 
join specializare as s using (doctor_id)
join programari as p using (doctor_id)
where descriere='Oftalmologie';


/*exercitiul  4*/
select a.name as angajat, b.name as manager ,
if ( b.name is null , 'Top Manager', b.name  ) as top_manageri_in_lista_afisati
from employee a left join employee b on a.managerid=b.employeeid ;




