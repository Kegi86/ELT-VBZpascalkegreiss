select
    linie,
    richtung,
    betriebsdatum,
    fahrt_id,
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltepunkt h on
    fsi.halt_punkt_id_von = h.halt_punkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id

inner join vbzdat.haltepunkt h3 on
    fsi.halt_punkt_id_nach = h3.halt_punkt_id
    
    inner join vbzdat.haltepunkt h4 on
    h3.halt_id = h4.halt_id
    
    where linie ="7";