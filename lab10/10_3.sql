select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idklienta
	from zamowienia where datarealizacji = '12-11-2013');
--        nazwa        |     ulica      | miejscowosc 
-- --------------------+----------------+-------------
--  Wandziak Wojciech  | Gregorowa 3    | Warszawa
--  Witak Nina         | Kasztanowa 23  | Warszawa
--  Helkowski Andrzej  | Edwarda Bera 5 | Katowice
--  Walendziak Andrzej | Kasztanowa 23  | Siedlce
--  Moniak Rafał       | Krucza 12/43   | Kraków
-- (5 rows)

select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idklienta
	from zamowienia where date_part('month', datarealizacji) = 11 
	and date_part ('year',datarealizacji) = 2013);
--31 rows

select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idzamowienia 
		from zamowienia natural join artykuly natural join pudelka
		where nazwa in ('Kremowa fantazja', 'Kolekcja jesienna'));
--         nazwa        |     ulica      | miejscowosc 
-- ---------------------+----------------+-------------
--  Górka Wojciech      | Krucza 12/43   | Siedlce
--  Górka Andrzej       | Stefanowska 35 | Gdańsk
--  Witak Nina          | Kasztanowa 23  | Warszawa
--  Fisiak Antoni       | Akacjowa 3     | Konstancin
--  Wojak Stefan        | Towarowa 3     | Gdańsk
--  Wolski Wojciech     | Edwarda Bera 5 | Lubinek
--  Wojak Dalia         | Boczna 23/91   | Kraków
--  Górka Dalia         | Beringa 89     | Gdańsk
--  Fisiak Regina       | Towarowa 3     | Kraków
--  Piotrowski Wojciech | Prosta 345     | Kraków
--  Wojak Mirosław      | Akacjowa 3     | Borki
--  Hern Alicja         | Młyńska 34     | Doły
--  Moniak Mirosław     | Trakt 10       | Gdańsk
--  Herron Stefan       | Wolna 12/89    | Gdańsk
--  Moniak Wojciech     | Beringa 89     | Pomiechówek
--  Piotrowski Antoni   | Kasztanowa 23  | Kownik
--  Sokół Antoni        | Prosta 345     | Siedlce
--  Wojak Robert        | Rzeczna 44     | Siedlce
--  Górka Tomasz        | Boczna 23/91   | Gdańsk
--  Wandziak Wojciech   | Gregorowa 3    | Warszawa
-- (20 rows)

select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idklienta
	from zamowienia natural join artykuly natural join pudelka
	where sztuk = 2 and nazwa in ('Kremowa fantazja', 'Kolekcja jesienna'));

--        nazwa       |     ulica      | miejscowosc 
-- -------------------+----------------+-------------
--  Czarnkowska Dalia | Wolska 89      | Iława
--  Wandziak Wojciech | Gregorowa 3    | Warszawa
--  Górka Andrzej     | Stefanowska 35 | Gdańsk
--  Witak Nina        | Kasztanowa 23  | Warszawa
--  Piotrowska Regina | Rzeczna 44     | Borki
--  Górka Alicja      | Wolna12/89     | Katowice
--  Moński Andrzej    | Towarowa 3     | Kraków
--  Miszak Helena     | Akacjowa 3     | Kraków
--  Moniak Wojciech   | Beringa 89     | Pomiechówek
--  Sokół Miroslaw    | Rzeczna 4      | Borki
--  Witak Nina        | Akacjowa 3     | Siedlce
--  Fisiak Antoni     | Akacjowa 3     | Konstancin
--  Fisiak Tomasz     | Krucza 12      | Katowice
--  Górka Helena      | Boczna 23/91   | Regina
--  Moniak Rafał      | Krucza 12/43   | Kraków
-- (15 rows)

select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idklienta
	from zamowienia natural join artykuly natural join pudelka
	where idpudelka in (select idpudelka
		from czekoladki natural join zawartosc
		where orzechy = 'migdały'));
--(42 rows)

select nazwa, ulica, miejscowosc
from klienci
where idklienta in (select idklienta from zamowienia);
--(67 rows)

select nazwa, ulica, miejscowosc
from klienci
where idklienta not in (select idklienta from zamowienia);