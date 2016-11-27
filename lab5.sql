--1.1
select count(*) from czekoladki;
--41

--1.2
select count(*) from czekoladki
where nadzienie is not null;

select count(nadzienie) from czekoladki;
--29

--1.3
select p.nazwa, sum(z.sztuk) as "czekoladek" from
pudelka p natural join zawartosc z
group by p.idpudelka
order by czekoladek DESC
limit 1;
--30

--1.4
select p.nazwa, sum(z.sztuk) as "czekoladek" from
pudelka p natural join zawartosc z
group by p.idpudelka;

--1.5
select z.idpudelka, sum(z.sztuk) from
zawartosc z right join czekoladki c on z.idczekoladki = c.idczekoladki
where c.orzechy is null
group by z.idpudelka;
--jak zrobiæ ¿eby zróci³o te¿ to pudelko gdzie jest 0?
select idpudelka, sum(sum) from (select z.idpudelka, sum(z.sztuk) from
zawartosc z natural join czekoladki c
where c.orzechy is null and z.idpudelka is not null
group by z.idpudelka
UNION
select z.idpudelka, sum(0) from
zawartosc z natural join czekoladki c 
where c.orzechy is not null 
group by z.idpudelka) as FO
group by idpudelka;


--1.6
select z.idpudelka, sum(z.sztuk) from
zawartosc z natural join czekoladki c 
where c.czekolada like 'mleczna'
group by z.idpudelka;

--2.1
select p.nazwa, sum(z.sztuk*c.masa) from
pudelka p natural join zawartosc z JOIN czekoladki c using(idczekoladki)
group by p.idpudelka
ORDER by 2 desc;

select z.idpudelka, sum(z.sztuk*c.masa) from
zawartosc z natural join czekoladki c
group by z.idpudelka
order by 2 DESC;

--2.2
select p.nazwa, sum(z.sztuk*c.masa) from
pudelka p natural join zawartosc z JOIN czekoladki c using(idczekoladki)
group by p.idpudelka
having sum(z.sztuk*c.masa)= (select sum(z.sztuk*c.masa) from
pudelka p natural join zawartosc z JOIN czekoladki c using(idczekoladki)
group by p.idpudelka
ORDER by 1 desc limit 1);

--2.3
select avg(suma) from (select sum(z.sztuk*c.masa) as suma from
zawartosc z natural join czekoladki c
group by z.idpudelka) as tab
--444.38888

--2.4
select p.nazwa, sum(z.sztuk*c.masa)/sum(z.sztuk) from
pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
group by p.idpudelka;

--3.1
select datarealizacji, count(idzamowienia) from
zamowienia group by datarealizacji;
--40

--3.2
select count(idzamowienia) from zamowienia;

--3.3
select sum(a.sztuk*p.cena) from
artykuly a natural join pudelka p;
--17047.00

--3.4
select k.nazwa, count(z.idzamowienia), sum(a.sztuk*p.cena) from
klienci k natural join zamowienia z join artykuly a using(idzamowienia)
join pudelka p using(idpudelka)
group by k.idklienta;

--4.1
select c.nazwa,count(z.idpudelka) from
czekoladki c natural join zawartosc z
group by c.idczekoladki
order by 2 DESC limit 1;
--6

--4.2
select z.idpudelka, sum(z.sztuk) from
zawartosc z natural join czekoladki c
where c.orzechy is null
group by z.idpudelka
having sum(z.sztuk) = (select sum(z.sztuk) from zawartosc z natural join czekoladki c
where c.orzechy is null group by z.idpudelka order by 1 DESC limit 1);
--autu, bitt, nort, swee

--4.3
--podobne do 1 to nie robie, pierdole

--4.4
select idpudelka, count(idzamowienia) from 
artykuly
group by idpudelka
order by 2 desc
limit 1;

--5.1
select extract('quarter' from datarealizacji), count(idzamowienia) from
zamowienia group by 1;

--5.2
select (extract('year' from datarealizacji)  || '-' || extract('month' from datarealizacji)), count(idzamowienia) from
zamowienia group by 1;

--5.3 prawie to samo

--5.4
select k.miejscowosc, count(z.idzamowienia) from
klienci k natural join zamowienia z
group by k.miejscowosc;

--6.1
select sum(waga) from 
(select p.stan * sum(z.sztuk*c.masa) as "waga" from 
pudelka p natural join zawartosc z
join czekoladki c using(idczekoladki)
group by p.idpudelka) as pud;
--3504000

--6.2
select sum(cena*stan) from pudelka;
--197930

--7.1
select p.idpudelka, p.cena-g.koszt
from pudelka p join
(select z.idpudelka, sum(z.sztuk*c.koszt) as koszt from
zawartosc z join czekoladki c using(idczekoladki)
group by z.idpudelka) g using(idpudelka);

--7.2
select sum(zyski) from
(select p.idpudelka, ilosc*zysk as zyski from
pudelka p natural join
(select idpudelka, sum(sztuk) as ilosc from artykuly
group by idpudelka) ile join
(select p.idpudelka, p.cena-k.koszt as zysk from
pudelka p natural join
(select z.idpudelka, sum(z.sztuk*c.koszt) as koszt from
zawartosc z join czekoladki c using(idczekoladki)
group by z.idpudelka) k) z using(idpudelka)) as zyyy;
--13471.78

--7.2
select sum(zysk) from 
(select a.idpudelka, a.sztuk*p.cena-k.koszt as zysk from
artykuly a natural join pudelka p 
join 
(select p.idpudelka, sum(p.cena-g.koszt) as koszt
from pudelka p join

(select z.idpudelka, sum(z.sztuk*c.koszt) as koszt from
zawartosc z join czekoladki c using(idczekoladki)
group by z.idpudelka) g using(idpudelka))
 k using(idpudelka)) as zyski;

--8.1
select row_number() over (order by idpudelka) as nr, idpudelka from pudelka;





































