delimiter $$


      create procedure  tnr_intregi()
      
      begin 
      
          declare a  int default 1;
          
		  declare b  varchar(255) ;
          
          set b:='Numere mai mici ca 10, care se impart exact la 3 sunt :';
          
          loop_1: loop 
          
            if a >10
            
               then leave loop_1;
               
               end if;
                  
	  set a:=a+1;
      
           if (a % 3 != 0)  then
           
                    iterate loop_1;
                    
                    else
                    
					set b:=concat(b,a,' , ');
                    
                    
                    end if;
                    
                    
                    end loop loop_1;
                    
                    
                    select b;
                    
                    end $$
          
          
          /*un algoritm elemntar ce ne returneaza numerele ce se impart la 3 */
          
      
      
      