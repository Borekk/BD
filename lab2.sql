Lab 2

1.1
select nazwa, ulica, miejscowosc from klienci order by nazwa; 


1.2
select nazwa, miejscowosc from klienci order by miejscowosc, nazwa;

1.3
select nazwa, miejscowosc from klienci 
where miejscowosc like 'Warszawa' or miejscowosc like 'Kraków'
order by miejscowosc DESC, nazwa ASC;

select nazwa, miejscowosc from klienci 
where miejscowosc in ('Borki','Warszawa') order by miejscowosc DESC, nazwa ASC;

1.4
select nazwa, miejscowosc from klienci order by miejscowosc DESC;

1.5
select nazwa, miejscowosc from klienci
where miejscowosc like 'Borki'
order by nazwa;

2.1
select nazwa, masa from czekoladki 
where masa < 20;
8
2.2
select nazwa, masa, koszt from czekoladki
where masa > 20 and koszt > 0.25;
14

2.3
select nazwa, masa, (koszt*100) as koszt_gr from czekoladki
where masa > 20 and koszt > 0.25;
14

2.4
select nazwa, czekolada, nadzienie, orzechy from czekoladki
where (czekolada like 'mleczna' and nadzienie like 'maliny')
or (czekolada like 'mleczna' and nadzienie like 'truskawki')
or (czekolada not like 'gorzka' and orzechy like 'laskowe');
6

2.5
select nazwa, koszt from czekoladki 
where koszt > 0.25;
24

2.6
select nazwa, czekolada from czekoladki
where czekolada like 'bia³a' or czekolada like 'mleczna';

3.1
select 124*7+45

3.2
select 2^20

3.3
select sqrt(3);

3.4
select pi();


4.1
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 15 and 24;
14

4.2
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.25 and 0.35;
22

4.3
select idczekoladki, nazwa, masa, koszt from czekoladki
where (masa between 25 and 35)
or (koszt between 0.15 and 0.24);
28

5.1
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is not null;
17

5.2
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is null;
24

5.3
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is not null or nadzienie is not null;
39

5.4
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada in ('mleczna', 'bia³a') and orzechy is null;

5.5
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada not in ('mleczna', 'biala') and (orzechy is not null or nadzienie is not null);

5.6
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nadzienie is not null;

5.7
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nadzienie is null;

5.8
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nadzienie is null and orzechy is null;

5.9
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada in ('mleczna', 'bia³a') and nadzienie is null;

6.1
select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24)
or (koszt between 0.15 and 0.24);
24

6.2

select nazwa, koszt, masa from czekoladki
where ((masa between 15 and 24)
and (koszt between 0.15 and 0.24))
or ((masa between 25 and 35)
and (koszt between 0.25 and 0.35));
14

6.3
select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24)
and (koszt between 0.15 and 0.24);
3

6.4
select nazwa, koszt, masa from czekoladki
where (masa between 25 and 35)
and (koszt not between 0.25 and 0.35);
12

6.5
select nazwa, koszt, masa from czekoladki
where (masa between 25 and 35)
and (koszt not between 0.14 and 0.24 and koszt not between 0.25 and 0.35);
4

7.2
\H
\o zapytani1.html

select idczekoladki, nazwa, opis from czekoladki;















