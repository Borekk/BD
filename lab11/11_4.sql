create or replace function podwyzka() 
	returns boolean as 
	$$
	declare
	skoszt numeric(7,2);
	id char(3);
	nowykoszt numeric(7,2);
	begin
		for skoszt, id in select koszt, idczekoladki from czekoladki
		loop
			if skoszt < 0.20 then
				nowykoszt:=skoszt+0.03;
			elsif skoszt between 0.20 and 0.29 then
				nowykoszt:=skoszt+0.04;
			else 
				nowykoszt:=skoszt+0.05;
			end if;
			update czekoladki
				set koszt = nowykoszt
				where idczekoladki = id;
		end loop;
		return true;
	end
	$$
	language plpgsql;

create or replace function obnizka() 
	returns boolean as 
	$$
	declare
	skoszt numeric(7,2);
	id char(3);
	nowykoszt numeric(7,2);
	begin
		for skoszt, id in select koszt, idczekoladki from czekoladki
		loop
			if skoszt < 0.23 then
				nowykoszt:=skoszt-0.03;
			elsif skoszt between 0.24 and 0.33 then
				nowykoszt:=skoszt-0.04;
			else 
				nowykoszt:=skoszt-0.05;
			end if;
			update czekoladki
				set koszt = nowykoszt
				where idczekoladki = id;
		end loop;
		return true;
	end
	$$
	language plpgsql;