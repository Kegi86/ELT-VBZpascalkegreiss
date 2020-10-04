select
    h2.halt_lang,
    a.delay,
    h.GPS_Latitude,
    h.GPS_Longitude,
    a.id,
    a.haltepunkt_id,
    a.fahrweg_id,
    l.linie,
    a.datumzeit_ist_an,
    a.datumzeit_soll_an
from
    vbzdat.ankunftszeiten a
inner join vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
    
where 
	linie = "7"
    
order by a.delay desc; 

fetch first "20" rows only;
