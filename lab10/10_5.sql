select idczekoladki, nazwa, koszt
from czekoladki
where koszt > all(select koszt
	from czekoladki
	where idczekoladki = 'd08');

--  idczekoladki |        nazwa         | koszt 
-- --------------+----------------------+-------
--  b01          | Płomienna ekstaza    |  0.30
--  b03          | Marcepanowe listki   |  0.40
--  d01          | Migdałowy smak       |  0.30
--  d02          | Serce na dłoni       |  0.32
--  d03          | Potęga orzechów      |  0.30
--  d04          | Migdalowa ambrozja   |  0.44
--  d11          | Marcepanowe delicje  |  0.38
--  m02          | Smak macadamia       |  0.40
--  m03          | Smak pistacji        |  0.30
--  m05          | Marcepanki           |  0.32
--  m08          | Marcepanowy klon     |  0.37
--  m16          | Cud marcepanu        |  0.33
--  m17          | Amaretto z orzechali |  0.36
--  m18          | Orzechy w kremie     |  0.33
--  w01          | Marcepanowa jaskółka |  0.34
--  w03          | Zlamane serce        |  0.30
-- (16 rows)

select nazwa
from klienci
where idklienta in (select idklienta
	from zamowienia 
	where idzamowienia in (select idzamowienia
		from artykuly
		where idpudelka in (select idpudelka
			from pudelka 
			where idpudelka in (select idpudelka
				from artykuly
				where idzamowienia in (select idzamowienia
					from zamowienia
					where idklienta in (select idklienta
						from klienci
						where nazwa = 'Górka Alicja'))))));
--(61 rows)
