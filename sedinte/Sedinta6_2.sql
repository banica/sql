/*create table*/

create table angajati (

angajat_id int,

nume_angajat varchar (100),

salariu double);

delimiter $$
create trigger salariu before insert  

               on angajati for each row 
               
               
                    begin 
                    
                    declare salariu_nou double default 0;
                    
				    declare lungime_nume int;
                    
                    declare a int default 0;
                    
                    set lungime_nume:=length(new.nume_angajat);
                    
                      while a < lungime_nume  do
                      
                      
                      set salariu_nou:= salariu_nou + new.salariu;
                      
                       set   a:=a+1;
                          
                          end while;
                          
                          set new.salariu = salariu_nou;
                          
                          end $$
                          
                          
insert  into angajati values (1,'Ion',2000);


/*aceasta este problema nr 2 din Exercitii initiale de la sedinta 6*/
