select datarealizacji, idzamowienia
from zamowienia
where idklienta in (select idklienta from klienci where nazwa ~ 'Antoni');

select datarealizacji, idzamowienia
from zamowienia
where idklienta in (Select idklienta from klienci where ulica ~ '/');

select datarealizacji, idzamowienia
from zamowienia
where idklienta in (Select idklienta from klienci where miejscowosc = 'Kraków') 
and date_part('month', datarealizacji) = 11 and date_part('year', datarealizacji) = 2013;
