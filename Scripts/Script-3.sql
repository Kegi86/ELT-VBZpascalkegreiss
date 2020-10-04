select
    h.halt_punkt_id,
    h2.halt_lang,
    h.GPS_Latitude,
    h.GPS_Longitude,
    a.datumzeit_ist_an,
    a.datumzeit_soll_an,
    a.delay,
    l.linie,
    a.id
from
    vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.linie l on
    l.fahrweg_id = a.fahrweg_id
inner join vbzdat.ankunftszeiten a on
    a.haltepunkt_id = h.halt_punkt_id;
