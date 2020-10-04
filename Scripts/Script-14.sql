select distinct
    fsi.linie,
    fsi.halt_punkt_id_von,
    fsi.halt_punkt_id_nach,
    h.GPS_Latitude,
    h.GPS_Longitude,
    h2.halt_lang,
    h3.GPS_Latitude,
    h3.GPS_Longitude,
    fsi.fahrt_id,
    fsi.betriebsdatum,
    fsi.richtung,
    SQRT(POW(69.1 * (h.GPS_Latitude - h3.GPS_Latitude), 2) + POW(69.1 * (h3.GPS_Longitude - h.GPS_Longitude), 2)) AS distance
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltepunkt h on
    fsi.halt_punkt_id_von = h.halt_punkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.haltepunkt h3 on
    h3.halt_punkt_id = fsi.halt_punkt_id_nach
inner join vbzdat.haltestelle h4 on
    h3.halt_id = h4.halt_id
    
    where linie = "7" and betriebsdatum = "06.05.19"  and richtung = "1"
    
    group by halt_lang
;

