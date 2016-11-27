z1

select s.imie, s.nazwisko, d.miasto, m.termin, p.punkty from
siatkarki s join punktujace p using(numer, iddruzyny) natural 
join mecze m natural join druzyny d
where p.idmeczu in (
	select distinct p.idmeczu from punktujace p natural join mecze m natural 	join druzyny d 
	where p.numer = 4 and d.miasto like 'Bydgoszcz' and m.termin between '2001-11-01' and '2014-01-31'
);


--other way
SELECT DISTINCT s.imie, s.nazwisko, d.miasto, m.termin, p.punkty
FROM punktujace p JOIN siatkarki s ON p.iddruzyny=s.iddruzyny AND p.numer=s.numer JOIN mecze m ON p.idmeczu=m.idmeczu JOIN druzyny d ON s.iddruzyny=d.iddruzyny
WHERE p.idmeczu IN (
					SELECT DISTINCT m.idmeczu
					FROM punktujace p JOIN siatkarki s ON p.iddruzyny=s.iddruzyny AND p.numer=s.numer JOIN mecze m ON p.idmeczu=m.idmeczu JOIN druzyny d ON s.iddruzyny=d.iddruzyny
WHERE date_part('month', m.termin)=10 AND date_part('year', m.termin)=2009 AND s.numer=4 AND d.miasto='Piła');



--zadanie z update

--do sprawdzenia rezultatu
select s.numer, s.imie, s.nazwisko, p.punkty from siatkarki s join punktujace p using(numer, iddruzyny) natural join druzyny d
where d.iddruzyny like 'pila' and s.numer = 4 and p.idmeczu = 21;

update punktujace p set punkty = 212
from siatkarki s, druzyny d
where
s.numer = p.numer and s.iddruzyny = p.iddruzyny and p.iddruzyny = d.iddruzyny and
 d.iddruzyny like 'pila' and s.numer = 4 and idmeczu = 21;


--or
update punktujace p set punkty = 112
from siatkarki s natural join druzyny d
where s.numer = p.numer and
p.iddruzyny = s.iddruzyny and d.iddruzyny like 'pila' and p.idmeczu = 21 and p.numer = 4;
