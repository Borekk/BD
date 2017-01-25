create or replace function masaPudelka (id char(4))
	returns integer as
	$$
	begin
		return (select sum(sztuk*masa)
			from czekoladki natural join zawartosc
			where zawartosc.idpudelka = id
			group by zawartosc.idpudelka);
	end;
	$$
	language plpgsql;

create or replace function liczbaCzekoladek (id char(4))
	returns integer as
	$$
	begin
		return (select sum(sztuk)
			from zawartosc
			where idpudelka = id);
	end;
	$$
	language plpgsql;