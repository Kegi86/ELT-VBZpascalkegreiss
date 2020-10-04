select
    fsi.linie,
    h2.halt_lang as von_haltestelle,
    h4.halt_lang as nach_haltestelle,
   	SQRT(POW((h.GPS_Latitude - h3.GPS_Latitude), 2) + POW((h3.GPS_Longitude - h.GPS_Longitude)* COS(h.GPS_Latitude), 2)) AS distance
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
group by h2.halt_lang
order by distance asc
;