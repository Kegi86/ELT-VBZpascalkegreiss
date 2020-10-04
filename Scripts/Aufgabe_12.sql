select distinct 
    h.halt_lang,
    fsi.betriebsdatum,
    fsi.fahrt_id,
    fsi.linie,
    fsi.richtung,
   date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltestelle h on
    h.halt_id = fsi.halt_id_von
where
 linie = "7" and fsi.richtung = "1" and fsi.betriebsdatum = "06.05.19" -- and fsi.fahrt_id = "40143"
 
-- group by h.halt_lang
order by fahrt_id, abfahrtszeit ;