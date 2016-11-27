1.1
select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-11-12' and '2013-11-20';
17

1.2
select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-12-01' and '2013-12-06'
or  datarealizacji between '2013-12-15' and '2013-12-20';
44

1.3
select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-12-01' and '2013-12-31';
100

1.4
select idzamowienia, datarealizacji from zamowienia
where extract(month from datarealizacji) = 11
and extract(year from datarealizacji) = 2013;
41

1.5
select idzamowienia, datarealizacji from zamowienia
where (extract(month from datarealizacji) = 11
or extract(month from datarealizacji) = 12)
and extract(year from datarealizacji) = 2013;
141

1.6
select idzamowienia, datarealizacji from zamowienia
where date_part('day', datarealizacji) = 17
or date_part('day', datarealizacji) = 18
or date_part('day', datarealizacji) = 19;
26

1.7
select idzamowienia, datarealizacji from zamowienia
where date_part('week', datarealizacji) = 47
or date_part('week', datarealizacji) = 46;
22

2.1
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%';
11

2.2
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%i';
4

2.3
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^S.* m.*';
3

2.4
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^A|B|C';
6

2.5
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ 'orzech' or nazwa ~'^Orzech';
7

2.6
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%i';
4

2.7
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like '%maliny%' or nazwa like '%truskawki%';


select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '(maliny)|(truskawki)';
2

2.8
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^[^D-KST]';
20

2.9
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^(Orzechy)';
1

2.10
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^[A-Z][a-z]+$';
2

3.1
select nazwa, miejscowosc from klienci
where miejscowosc ~ '^[A-Z][a-z]+ ';
0

3.2
select nazwa, miejscowosc, telefon from klienci
where telefon~ '^(012) [0-9]{3} [0-9]{2} [0-9]{2}$';
8

3.3
select nazwa, miejscowosc, telefon from klienci
where telefon~ '^[0-9]{3} [0-9]{3} [0-9]{3}$';
57

4.1
select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24)
UNION select nazwa, koszt, masa from czekoladki
where (koszt between 0.15 and 0.24);
24

4.2
select nazwa, koszt, masa from czekoladki
where (masa between 25 and 35)
EXCEPT select nazwa, koszt, masa from czekoladki
where (koszt between 0.25 and 0.35);
12

4.3
(select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24)
INTERSECT select nazwa, koszt, masa from czekoladki
where (koszt between 0.15 and 0.24)) 
UNION
(select nazwa, koszt, masa from czekoladki
where (masa between 25 and 35)
INTERSECT select nazwa, koszt, masa from czekoladki
where (koszt between 0.25 and 0.35));
14

4.4
select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24)
INTERSECT select nazwa, koszt, masa from czekoladki
where (koszt between 0.15 and 0.24);
3

4.5
(select nazwa, koszt, masa from czekoladki
where (masa between 29 and 35)
EXCEPT select nazwa, koszt, masa from czekoladki
where (koszt between 0.25 and 0.35))
EXCEPT select nazwa, koszt, masa from czekoladki
where (koszt between 0.15 and 0.24);
1

5.1
select idklienta from klienci
except select idklienta from zamowienia;
0

5.2
select idpudelka from pudelka
except select idpudelka from artykuly;
0

5.3
select nazwa from klienci
where nazwa like '%rz%' or nazwa like '%Rz%'
union
select nazwa from czekoladki
where nazwa like '%rz%' or nazwa like '%Rz%'
union
select nazwa from pudelka
where nazwa like '%rz%' or nazwa like '%Rz%';
19

5.4
select idczekoladki from czekoladki
except select idczekoladki from zawartosc;
1



6.1
select idmeczu,
(gospodarze[1] + gospodarze[2] + gospodarze[3]
+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0)) as Pkt_gospodarzy,
(goscie[1]+goscie[2]+goscie[3]
+coalesce(goscie[4],0)+coalesce(goscie[5],0)) as Pkt_gosci from statystyki


6.2
select idmeczu,
(gospodarze[1] + gospodarze[2] + gospodarze[3]
+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0)) as Pkt_gospodarzy,
(goscie[1]+goscie[2]+goscie[3]
+coalesce(goscie[4],0)+coalesce(goscie[5],0)) as Pkt_gosci from statystyki
where gospodarze[5] is not null and (gospodarze[5] = 15 or goscie[5] = 15);
17

6.3
select idmeczu, 
((case when gospodarze[1]>goscie[1] then 1 else 0 end +
case when gospodarze[2]>goscie[2] then 1 else 0 end +
case when gospodarze[3]>goscie[3] then 1 else 0 end +
case when gospodarze[4]>goscie[4] then 1 else 0 end +
case when gospodarze[5]>goscie[5] then 1 else 0 end) 
|| ':' ||
(case when gospodarze[1]<goscie[1] then 1 else 0 end +
case when gospodarze[2]<goscie[2] then 1 else 0 end +
case when gospodarze[3]<goscie[3] then 1 else 0 end +
case when gospodarze[4]<goscie[4] then 1 else 0 end +
case when gospodarze[5]>goscie[5] then 1 else 0 end)) as wynik
from statystyki;

6.4
select idmeczu,
(gospodarze[1] + gospodarze[2] + gospodarze[3]
+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0)) dd,
(goscie[1]+goscie[2]+goscie[3]
+coalesce(goscie[4],0)+coalesce(goscie[5],0)) as Pkt_gosci from statystyki
where (gospodarze[1] + gospodarze[2] + gospodarze[3]
+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0))  > 100;
19

6.5
select idmeczu, gospodarze[1] as gosp1, (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) as gosp from statystyki
where sqrt(gospodarze[1]+goscie[1]) < log(2, (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) + goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5], 0)));
87

7.1s






