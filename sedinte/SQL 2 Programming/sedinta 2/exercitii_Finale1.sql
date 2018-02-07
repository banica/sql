
/* pentru exercitiile urmatoare este utilizata baza de date world */	
USE world;
/* capitalele din Europa; afisare: nume oras */


		
2) /* tarile din Europa cu suprafata mai mare decat suprafata medie a tuturor tarilor din Europa; afisare: nume tara si suprafata */

	
3) /* tarile cu cea mai mare populatie de pe fiecare continent */

select a.name, b.continent, populatie_maxima from country a, 
(select continent, max(population) as populatie_maxima  from country group by continent) as b
where a.continent=b.continent
and a.population=populatie_maxima;


/* pentru exercitiile urmatoare este utilizata baza de date company */
USE company;
4) /* angajatii de la locatiile din Canada */

	
5) /* managerii de departamente */


6) /* angajatii si managerii lor; Join pe o singura tabela (atentie la rezultatul final ) */


7) /* angajatii si managerii lor; subinterogari*/

	
8) /* angajatii care nu sunt manageri - utilizare operator NOT IN */

select manager_id  , last_name , first_name from employees where MANAGER_ID not in 
(select manager_id from  departments )
order by manager_id;


9) /* angajatii care nu sunt manageri - utilizare operator NOT EXISTS */


/* pentru exercitiile urmatoare este utilizata baza de date classicmodels */
USE classicmodels;
10) /* angajatii de la biroul din Boston */

	
/* pentru exercitiile urmatoare este utilizata baza de date company */	
USE company;

11) /* Scrieti o instructiune SQL prin care sa afisati cel mai vechi si cel mai nou angajat al companiei */

select * from employees where hire_date in 
((select max(hire_date) from employees), 
(select min(hire_date) from employees));

12) /* cel mai vechi si cel mai nou angajat din fiecare departament */


	

	
