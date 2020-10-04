select
haltepunkt_id,
delay,
fahrweg_id,
datumzeit_ist_an,
datumzeit_soll_an 
from 
ankunftszeiten a 

union

select 
GPS_Latitude,
GPS_Longitude

select
    a.delay,
    a.haltepunkt_id,
    h2.halt_lang
from
    vbzdat.ankunftszeiten a
inner join vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id;
