drop table if exists ankunftszeiten;

create table ankunftszeiten

select  
	fsi.linie,
	fsi.richtung,
	fsi.betriebsdatum,
	fsi.fahrzeug,
	fsi.kurs,
	fsi.seq_nach,
	fsi.halt_kurz_nach1,
	fsi.datum_nach,
	fsi.fahrt_id,
	fsi.fw_lang
	-- halt_punkt_id_nach as haltepunkt_id,
	-- fahrweg_id,
	-- fahrt_id,
	-- datumzeit_ist_an_nach as datumzeit_ist_an,
	-- datumzeit_soll_an_nach as datumzeit_soll_an,
	-- datumzeit_soll_ab_nach as datumzeit_soll_ab,
	-- timestampdiff (second, datumzeit_soll_an_nach, datumzeit_ist_an_nach) as delay
	
	from 
	fahrzeiten_soll_ist fsi 
	
	where 
	
	linie ="7"
	
union 

select
	fsi.linie,
	fsi.richtung,
	fsi.betriebsdatum,
	fsi.fahrzeug,
	fsi.kurs,
	fsi.seq_von,
	fsi.halt_kurz_von1,
	fsi.datum_nach,
	fsi.fahrt_id,
	fsi.fw_lang
	-- halt_punkt_id_von as haltepunkt_id,
	-- fahrweg_id,
	-- fahrt_id,
	-- datumzeit_ist_an_von as datumzeit_ist_an,
	-- datumzeit_soll_an_von as datumzeit_soll_an,
	-- datumzeit_soll_ab_von as datumzeit_soll_ab,
	-- timestampdiff (second, datumzeit_soll_an_von, datumzeit_ist_an_von) as delay
	
	from 
	fahrzeiten_soll_ist fsi 
	
	where 
	seq_von ="1" and
	linie ="7";


	
alter table ankunftszeiten add id int primary key auto_increment first;