select
    distinct h.GPS_Latitude,
    h.GPS_Longitude,
    h2.halt_id,
    h.halt_id,
    h2.halt_lang,
     fn.halt_id_von,
    fn.halt_id_nach,
    fn.betriebsdatum,
    fn.abfahrtszeit
from
    vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.fahrplan_neu fn on
    fn.halt_lang = h2.halt_lang
group by
    halt_lang;

