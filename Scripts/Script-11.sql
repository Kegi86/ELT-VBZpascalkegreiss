select
    fsi.halt_id_von as von_id,
    h2.GPS_Latitude as von_lat,
    h2.GPS_Longitude as von_lng,
    h.halt_lang as von_lang,
    fsi.halt_id_nach as nach_id,
    h3.GPS_Latitude as nach_let,
    h3.GPS_Longitude as nach_lng,
    h4.halt_lang as nach_lanh
from
    vbzdat.fahrzeiten_soll_ist fsi
join vbzdat.haltestelle h on
    h2.halt_id = h.halt_id
inner join vbzdat.fahrzeiten_soll_ist fsi on
    h2.halt_punkt_id = fsi.halt_punkt_id_von
join vbzdat.haltepunkt h2
inner join vbzdat.haltepunkt h3 on
    fsi.halt_punkt_id_nach = h3.halt_punkt_id
inner join vbzdat.haltestelle h
inner join vbzdat.haltestelle h4 on
    h3.halt_id = h4.halt_id;
