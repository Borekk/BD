select nazwa
from pudelka natural join zawartosc
group by idpudelka, nazwa
having sum(sztuk) >= all(select sum (sztuk) 
	from pudelka 
	natural join zawartosc 
	group by idpudelka);

--       nazwa       
-- ------------------
--  Kremowa fantazja
-- (1 row)

-- 10.6.3
with x as (select sum(sztuk) as suma
	from pudelka natural join zawartosc
	group by idpudelka)

select nazwa
from pudelka natural join zawartosc
group by nazwa
having sum(sztuk) >= (select avg(suma) from x);

--          nazwa         
-- -----------------------
--  Kolekcja północna
--  Kremowa fantazja
--  Islandzka kolekcja
--  Kolekcja jesienna
--  Gorzkie czekoladki
--  Kolekcja romantyczna
--  Mieszanka czekoladowa
--  Międzynarodowe
-- (8 rows)
