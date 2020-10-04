select distinct 
	h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
   	null as color,
    h2.halt_lang as note
from
    vbzdat.haltepunkt h
inner join vbzdat.ankunftszeiten a on
    h.halt_punkt_id = a.haltepunkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id

group by h2.halt_lang;
   

