select
    a.id,
    a.haltepunkt_id,
    h2.halt_lang,
    h.GPS_Latitude,
    h.GPS_Longitude,
    a.fahrweg_id,
    l.linie,
    a.datumzeit_ist_an,
    a.datumzeit_soll_an,
    a.delay
from
    vbzdat.ankunftszeiten a
inner join vbzdat.haltepunkt h on
    a.haltepunkt_id = h.halt_punkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
    group by h2.halt_lang 
order by a.delay   ;
