  delimiter $$

   create procedure test1( in marti int)

      begin


         declare x int;

         declare a int default 0;
         
         select count(*) into x from information_schema.tables  where table_name = 'exemplu1';

          if x > 0 then

                    drop table exemplu1;
                    
                             end if;
 
       create table exemplu1 (marti int);
 
       while a < marti do
 
             insert into exemplu1  values (a);
  
                 set a:= a+1;
  
                      end while;
   
          select count(*) from exemplu1;
  
        end $$
   
   call test1 (5);
   
   /*acsta este codul de la problema numarul 1 din exercitii initiale de la sedinta 6*/