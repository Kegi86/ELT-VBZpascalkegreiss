DROP TABLE IF EXISTS aufgabe_14_nach;

CREATE TABLE aufgabe_14_nach
select 
    fsi.betriebsdatum,
    fsi.fahrt_id,
    fsi.linie,
    fsi.richtung,
    fsi.halt_id_nach,
    h2.halt_lang,
    date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit,
    h.GPS_Latitude,
    h.GPS_Longitude
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltepunkt h on
    fsi.halt_punkt_id_von = h.halt_punkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id

    
where
 linie = "7" and fsi.richtung = "1"  and fsi.betriebsdatum = "06.05.19" and fsi.fahrt_id = "40143"
 
group by h2.halt_lang
order by abfahrtszeit;

alter table aufgabe_14_nach add id int primary key auto_increment;
