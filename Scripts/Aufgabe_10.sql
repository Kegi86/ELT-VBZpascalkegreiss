select 
    h2.halt_lang,
   	h.GPS_Latitude,
    h.GPS_Longitude,
    a.id,
    a.haltepunkt_id,
    a.fahrweg_id,
    l.linie,
    a.datumzeit_ist_an,
    a.datumzeit_soll_an,
    max(a.delay) as delay
from
    vbzdat.ankunftszeiten a
inner join vbzdat.haltepunkt h on 
	h.halt_punkt_id  = a.haltepunkt_id 
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
group by h2.halt_lang 
order by delay desc


limit 20;