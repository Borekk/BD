select nazwa, cena 
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where idczekoladki = 'd09');
--         nazwa         | cena  
-- ----------------------+-------
--  Międzynarodowe       | 34.00
--  Kolekcja północna    | 32.20
--  Kolekcja romantyczna | 34.00
-- (3 rows)

select nazwa, cena 
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where idczekoladki in (select idczekoladki 
		from czekoladki
		where nazwa = 'Gorzka truskawkowa'));
--          nazwa         | cena  
-- -----------------------+-------
--  Pory roku             | 14.00
--  Kolekcja alpejska     | 20.00
--  Gorzkie czekoladki    | 27.70
--  Kremowa fantazja      | 18.00
--  Słodkie kremowe       | 23.00
--  Mieszanka czekoladowa | 27.00
-- (6 rows)

select nazwa, cena 
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where sztuk >= 4);

--        nazwa        | cena  
-- --------------------+-------
--  Kolekcja alpejska  | 20.00
--  Kolekcja jesienna  | 43.00
--  Gorzkie czekoladki | 27.70
--  Klasyczne wiśnie   | 16.20
--  Kremowa fantazja   | 18.00
--  Międzynarodowe     | 34.00
--  Islandzka kolekcja | 35.00
--  Serca kochanków    | 17.50
--  Kolekcja północna  | 32.20
--  Kremowe delikatesy | 19.00
--  Słodkie kremowe    | 23.00
-- (11 rows)


select nazwa, cena 
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where sztuk = 3 and idczekoladki in (select idczekoladki 
		from czekoladki
		where nazwa = 'Gorzka truskawkowa'));
--          nazwa         | cena  
-- -----------------------+-------
--  Mieszanka czekoladowa | 27.00
-- (1 row)

select nazwa, cena 
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where idczekoladki in (select idczekoladki 
		from czekoladki
		where nadzienie = 'truskawki'));
--          nazwa         | cena  
-- -----------------------+-------
--  Pory roku             | 14.00
--  Kolekcja alpejska     | 20.00
--  Gorzkie czekoladki    | 27.70
--  Kremowa fantazja      | 18.00
--  Słodkie kremowe       | 23.00
--  Mieszanka czekoladowa | 27.00
-- (6 rows)

select nazwa, cena
from pudelka
where idpudelka not in (select idpudelka
	from zawartosc
	where idczekoladki in (select idczekoladki
		from czekoladki
		where czekolada = 'gorzka'));
--        nazwa        | cena  
-- --------------------+-------
--  Międzynarodowe     | 34.00
--  Islandzka kolekcja | 35.00
--  Serca kochanków    | 17.50
--  Obfitość Pacyfiku  | 21.00
--  Kremowe delikatesy | 19.00
--  Smaki              | 18.00
-- (6 rows)


select nazwa, cena
from pudelka
where idpudelka not in (select idpudelka
	from zawartosc
	where idczekoladki in(select idczekoladki
		from czekoladki
		where orzechy is not null));
--          nazwa         | cena  
-- -----------------------+-------
--  Pory roku             | 14.00
--  Kolekcja alpejska     | 20.00
--  Kolekcja jesienna     | 43.00
--  Gorzkie czekoladki    | 27.70
--  Klasyczne wiśnie      | 16.20
--  Marcepanowy cud       | 32.20
--  Kolekcja północna     | 32.20
--  Kremowe delikatesy    | 19.00
--  Słodkie kremowe       | 23.00
--  Mieszanka czekoladowa | 27.00
-- (10 rows)

select nazwa, cena
from pudelka
where idpudelka in (select idpudelka
	from zawartosc
	where idczekoladki in(select idczekoladki
		from czekoladki
		where nadzienie is null));
--         nazwa         | cena  
-- ----------------------+-------
--  Niebiańskie orzechy  | 15.00
--  Międzynarodowe       | 34.00
--  Islandzka kolekcja   | 35.00
--  Serca kochanków      | 17.50
--  Kolekcja północna    | 32.20
--  Obfitość Pacyfiku    | 21.00
--  Kolekcja romantyczna | 34.00
--  Smaki                | 18.00
-- (8 rows)
