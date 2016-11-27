--1.1
insert into czekoladki values('W98', 'Bialy Kiel',
'biala', 'laskowe', 'marcepan', 'rozplywajace sie w rekach i kieszeniach',
0.45, 20);

insert into klienci
values(91, 'Matusiak Alina', 'Kropiwinickiego 6/3', 'Leningrad', 
'31-471', '031');

insert into klienci
values(94, 'Matusiak Edward', 'Kropiwinickiego 6/3', 'Leningrad', 
'31-471', '031 423');

insert into klienci
values(93, 'Iza Matusiak',
(select ulica from klienci where idklienta = 94),
(select miejscowosc from klienci where idklienta = 94),
(select kod from klienci where idklienta = 94),
(select telefon from klienci where idklienta = 94)
);

--other way
insert into klienci
select 93, 'Matusiak Iza', ulica, miejscowosc, kod, telefon
from klienci
where idklienta=94;

insert into czekoladki values('X91', 'Biaaaaaly Kiel',
null, null, null, 'rozplywajace sie w rekach i kieszeniach',
0.45, 0);

insert into czekoladki(idczekoladki, nazwa, opis, koszt, masa)
values('MM', 'aaaaa', 'awwwww', 0.26, 0);

update klienci set nazwa='Iza Nowak'
where idklienta = 93;

update czekoladki koszt=(koszt-(0.1*koszt))
where idczekoladki like 'W98';
