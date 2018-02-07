delimiter $$

create procedure loop_1()

begin 

declare a int default 0;

declare loop_ex1 varchar(255);

set loop_ex1:='Start';

loop_ex1:loop

set a:=a+1;
set loop_ex1:=(concat(loop_ex1, a, ' , '));

if a=5 then 

       leave loop_ex1;
       
       
    end if;
    
    
  end loop;
  
  select loop_ex1;
  
  end $$
  
  call  loop_1;
  
  
  /*un exercitiu cu functia loop*/