use world;
/*tari din Africa cu populatie > 100.000 */
select name, Continent, Population from country where Continent like '%Africa%' and population > 1000000;
/* selectarea tuturor oraselor care incep cu litera D */
select name, population from city where name like 'D%' and population between 100000 and 500000;

use classicmodels;
/*clientii din Italia, Franta si Spania */
select customerName, country from customers where country not in ('France', 'Italy', 'Spain');
/*produsele Ford care au cantitatea in stoc < 1000 */
select productName, quantityInStock from products where productName like '%Ford%' and quantityInStock <1000;

select truncate (1.2841, 1);
select round (1.2841, 1);
select 13%5, MOD(13,5) as rest;

select if (13/0=0, 'Incorect', 'corect');
select if (14%2=0, 'Corect', 'Incorect');

use world;
select if(Population < 1000000, 'tari mici', name) as tari from country order by tari;
select ifnull(capital, 'fara valoare') from country; 

/*cele mai putin populate 5 tari*/
select * from country where continent like ('Europe') order by population ASC limit 5;
select * from country order by population ASC limit 5;

use classicmodels;
select concat(contactFirstName, ' ', contactFirstName) as CustomerName  from customers;

/*concat_ws pune un caracter intre campuri */
select concat_ws(' ', contactFirstName, contactLastName);

SELECT phone, length(phone) as NumberOfDigit from customers;

/* clientii care au numar de telefon mai mare de 10 caractere */
select concat_ws(' ', contactFirstName, contactLastName) as CustomerName, length(phone) from customers where length(phone) > 10 order by length(phone);



/*LTRIM, RTRIM, TRIM */
select trim('         exemplu   ');

/* Draga d-nule I. Popescu - doar prima litera de la nume */
use classimodels; 
select concat_ws(' ', 'Draga D-le', substr(contactFirstName, 1, 1), contactFirstName) as ExpresieAdresare from customers;

/*prima litera mare a numelui */
select  concat(upper(substr(contactFirstName,1, 1)), lower(substr(contactFirstName,2))) from customers; 

/*comenzi anulate in iunie 2004*/
select *  from orders where status = 'cancelled' and month(orderdate) = 6 and  year(orderdate) = 2004;
/*ultima zi a lunii curente */
select last_day(now());
select dayname('1985-06-07');

/* totalul populatiei tarilor din Africa */
use world;
select continent, sum(population) as 'Total' from country where continent = 'Africa';

/*suprafata medie a continentului, round 2 zecimale */
select continent, ROUND(AVG(SurfaceArea),2) from country group by continent;
/*cand se aplica conditii pe functii de aplicatii se foloseste HAVING */

/*la tema:
1) coloane => Tabele
from TABELA

2) folosind where
3) group by
4) having  (conditie de agregare)
5) order by
6) LIMIT

*/
