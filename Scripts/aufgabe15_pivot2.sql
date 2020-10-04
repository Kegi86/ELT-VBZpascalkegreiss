SELECT
select distinct 
	h.halt_lang,    
	sum(date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit)
    
    -- fsi.betriebsdatum,
    fsi.fahrt_id,
    -- fsi.linie,
    -- fsi.richtung,
   date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit