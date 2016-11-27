2.1
select z.idzamowienia, z.datarealizacji, k.nazwa from zamowienia z natural join klienci k
where k.nazwa like '% Antoni';
15

2.2
select z.idzamowienia, k.ulica, z.datarealizacji, k.nazwa from zamowienia z natural join klienci k
where k.ulica ~ '[0-9]+/[0-9]';
24

2.3
select z.idzamowienia, k.ulica, z.datarealizacji, k.nazwa from zamowienia z natural join klienci k
where miejscowosc like 'Kraków' 
and (date_part('month', z.datarealizacji) = 11
and date_part('year', z.datarealizacji) = 2013);
13

3.1
select distinct nazwa, ulica, miejscowosc, extract(year from datarealizacji) as "Rok" 
from klienci natural join zamowienia
where datarealizacji >= current_date - interval '5 years';
67

3.2
select distinct k.nazwa, k.ulica, p.nazwa from
klienci k join zamowienia z using(idklienta)
join artykuly a using(idzamowienia)
join pudelka p USING(idpudelka)
where p.nazwa like 'Kremowa fantazja'
or p.nazwa like 'Kolekcja jesienna';

3.3
select distinct k.nazwa, k.ulica from
klienci k left join zamowienia z on k.idklienta = z.idklienta where z.idzamowienia is not null;
67

3.4
select distinct k.nazwa, k.ulica from
klienci k left join zamowienia z on k.idklienta = z.idklienta where z.idzamowienia is null;

3.5
select distinct k.nazwa, k.ulica from
klienci k natural join zamowienia z
where z.datarealizacji::varchar like '2013-11-__';
31

3.6
select distinct k.nazwa, k.ulica, p.nazwa from
klienci k join zamowienia z using(idklienta)
join artykuly a using(idzamowienia)
join pudelka p USING(idpudelka)
where (p.nazwa like 'Kremowa fantazja'
or p.nazwa like 'Kolekcja jesienna') and a.sztuk >= 2;
17

3.7
select distinct k.nazwa, k.ulica, c.orzechy from
klienci k join zamowienia z using(idklienta)
join artykuly a using(idzamowienia)
join pudelka p USING(idpudelka)
join zawartosc zaw using(idpudelka)
join czekoladki c using(idczekoladki)
where orzechy like 'migda³y';
42

4.1
select p.nazwa, p.opis, c.nazwa, c.opis, p.idpudelka
from pudelka p natural join zawartosc z
join czekoladki c using(idczekoladki);
87

4.2
select p.nazwa, p.opis, c.nazwa, c.opis, p.idpudelka
from pudelka p natural join zawartosc z
join czekoladki c using(idczekoladki)
where p.idpudelka like 'heav';

4.3
select p.nazwa, p.opis, c.nazwa, c.opis, p.idpudelka
from pudelka p natural join zawartosc z
join czekoladki c using(idczekoladki)
where p.nazwa like '%Kolekcja%';

5.1
select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.idczekoladki like 'd09';
3

5.2
select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.nazwa like 'S%';
10

5.3
select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.sztuk >=4;
11

5.4
select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.nadzienie like 'truskawki';
6

5.5
select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
except select distinct p.nazwa, p.opis, p.cena from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.czekolada like 'gorzka';
6

6.1
select c1.idczekoladki, c1.nazwa from czekoladki as "c1", czekoladki as "c2" where
c2.idczekoladki like 'd08' and c1.koszt> c2.koszt;
16

6.2
select distinct k.nazwa from
(klienci k natural join zamowienia z join artykuly a using(idzamowienia) join pudelka p using(idpudelka)), 
(klienci k2 natural join zamowienia z2 join artykuly a2 using(idzamowienia) join pudelka p2 using(idpudelka))
where k2.nazwa like 'Górka Alicja' and a.idpudelka = a2.idpudelka
except select nazwa from klienci where nazwa like 'Górka Alicja';
53

6.3
select distinct k.nazwa, k.miejscowosc from
(klienci k natural join zamowienia z join artykuly a using(idzamowienia) join pudelka p using(idpudelka)), 
(klienci k2 natural join zamowienia z2 join artykuly a2 using(idzamowienia) join pudelka p2 using(idpudelka))
where k2.miejscowosc like 'Katowice' and a.idpudelka = a2.idpudelka
except select nazwa, miejscowosc from klienci where miejscowosc like 'Katowice';
62