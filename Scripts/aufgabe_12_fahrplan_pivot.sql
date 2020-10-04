select s1.halt_lang,
	min(case when s1.fahrt_id = 39362 then s1.abfahrtszeit end) fahrt_id39362,
	min(case when s1.fahrt_id = 39364 then s1.abfahrtszeit end) fahrt_id39364,
	min(case when s1.fahrt_id = 39366 then s1.abfahrtszeit end) fahrt_id39366
from 
(select  
    h.halt_lang,
    fsi.fahrt_id,
 	date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltestelle h on
    h.halt_id = fsi.halt_id_von
    and fsi.linie = "7" and fsi.richtung = "1" and fsi.betriebsdatum = "06.05.19" and fsi.fahrt_id in (39362,39364,39366)    where date_format(fsi.datumzeit_soll_ab_von, '%H:%i') is not null
    
) s1

group by s1.halt_lang
order by s1.abfahrtszeit
;