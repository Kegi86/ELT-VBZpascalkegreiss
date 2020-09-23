# ELT-VBZpascalkegreiss

## Aufgabe 7

~~~~sql

SELECT
fsi.linie,
fsi.richtung,
fsi.fahrzeug,
fsi.kurs,
fsi.seq_von,
fsi.halt_id_von,
fsi.halt_id_nach,
fsi.halt_punkt_id_von,
fsi.halt_punkt_id_nach,
fsi.fahrt_id,
fsi.fahrweg_id,
fsi.fw_no,
fsi.fw_typ,
fsi.fw_kurz,
fsi.fw_lang,
fsi.betriebs_datum,
fsi.datumzeit_soll_an_von,
fsi.datumzeit_ist_an_von,
fsi.datumzeit_soll_ab_von,
fsi.datumzeit_ist_ab_von,
fsi.datum__nach,
TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds,
TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds,
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds,
TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM
fahrzeiten_soll_ist fsi
where 
fsi.linie = "7" and betriebs_datum = "2019-05-06" and fw_kurz = "6" 

LIMIT 40000;

~~~~

## Aufgabe 8 a Script

select distinct 
fsi.linie,
fsi.richtung,
fsi.fw_no,
fsi.fw_lang

FROM
fahrzeiten_soll_ist fsi

where
linie = "7"

LIMIT 40000;

## Aufgabe 8a Abfrage Ergebnis

|linie|richtung|fw_no|fw_lang|
|-----|--------|-----|-------|
|7|1|5|DEP2 - WOLL via Schleife|
|7|1|7|DEP7 - MIBU Ausfahrt BSTE|
|7|1|105|BUCH (Schleife) - LANM für Einfahrt via|
|7|2|108|SPLA- BSTE E-Bus Gleisbau MIBU|
|7|2|102|WOLL - BUCH (Schleife) Gleisbau MIBU|
|7|2|116|GAR6 - BSTE E-Bus Gleisbau MIBU|
|7|2|104|IRCH - BUCH für Ausfahrt via BQUA - STAM|
|7|2|110|MIBU- BSTE E-Bus Gleisbau MIBU|
|7|1|107|DEP7 - IRCH Ausfahrt RIGI Gleisbau MIBU|
|7|1|101|BUCH (Schleife) - WOLL Gleisbau MIBU|
|7|2|10|WOLL - DEP2|
|7|1|113|BSTE - GAR6 E-Bus|
|7|1|1|BSTE - WOLL|
|7|2|6|MIBU - BSTE für Ausfahrt|
|7|1|109|BSTE - SPLA E-Bus ( Endziel WOLL) Gleisb|
|7|2|106|LANM - DEP7 Gleisbau MIBU|
|7|1|11|BSTE - WOLL für Einfahrt|
|7|2|2|WOLL - BSTE|
|7|1|15|IRCH - DEP7|
|7|1|111|BSTE - MIBU E-Bus (Endziel MIBU) Gleisba|
|7|1|117|GAR6 - MIBU E-Bus Gleisbau MIBU|
|7|1|103|BUCH (Schleife) - WOLL für Einfahrt Glei|
|7|1|9|BSTE - IRCH für Einfahrt|

## Aufgabe 8 b

create view query_line
as select distinct 
    linie,
	richtung,
    fw_no,
    fw_lang
from
 	fahrzeiten_soll_ist
where
   linie = "7"
   


|linie|richtung|fw_no|fw_lang|
|-----|--------|-----|-------|
|7|1|5|DEP2 - WOLL via Schleife|
|7|1|7|DEP7 - MIBU Ausfahrt BSTE|
|7|1|105|BUCH (Schleife) - LANM für Einfahrt via|
|7|2|108|SPLA- BSTE E-Bus Gleisbau MIBU|
|7|2|102|WOLL - BUCH (Schleife) Gleisbau MIBU|
|7|2|116|GAR6 - BSTE E-Bus Gleisbau MIBU|
|7|2|104|IRCH - BUCH für Ausfahrt via BQUA - STAM|
|7|2|110|MIBU- BSTE E-Bus Gleisbau MIBU|
|7|1|107|DEP7 - IRCH Ausfahrt RIGI Gleisbau MIBU|
|7|1|101|BUCH (Schleife) - WOLL Gleisbau MIBU|
|7|2|10|WOLL - DEP2|
|7|1|113|BSTE - GAR6 E-Bus|
|7|1|1|BSTE - WOLL|
|7|2|6|MIBU - BSTE für Ausfahrt|
|7|1|109|BSTE - SPLA E-Bus ( Endziel WOLL) Gleisb|
|7|2|106|LANM - DEP7 Gleisbau MIBU|
|7|1|11|BSTE - WOLL für Einfahrt|
|7|2|2|WOLL - BSTE|
|7|1|15|IRCH - DEP7|
|7|1|111|BSTE - MIBU E-Bus (Endziel MIBU) Gleisba|
|7|1|117|GAR6 - MIBU E-Bus Gleisbau MIBU|
|7|1|103|BUCH (Schleife) - WOLL für Einfahrt Glei|
|7|1|9|BSTE - IRCH für Einfahrt|

##Afgabe 8 c

CREATE TABLE linie (PRIMARY KEY (fahrweg_id))
select distinct 
fahrweg_id, 
linie,
richtung,
fw_no,
fw_lang
from 
fahrzeiten_soll_ist fsi 
where
linie ="7"


|fahrweg_id|linie|richtung|fw_no|fw_lang|
|----------|-----|--------|-----|-------|
|99771|7|1|5|DEP2 - WOLL via Schleife|
|99772|7|2|6|MIBU - BSTE für Ausfahrt|
|99773|7|1|7|DEP7 - MIBU Ausfahrt BSTE|
|99774|7|1|9|BSTE - IRCH für Einfahrt|
|99775|7|2|10|WOLL - DEP2|
|99777|7|1|15|IRCH - DEP7|
|111874|7|2|2|WOLL - BSTE|
|112270|7|1|1|BSTE - WOLL|
|112272|7|1|11|BSTE - WOLL für Einfahrt|
|115098|7|1|101|BUCH (Schleife) - WOLL Gleisbau MIBU|
|115099|7|2|102|WOLL - BUCH (Schleife) Gleisbau MIBU|
|115100|7|1|103|BUCH (Schleife) - WOLL für Einfahrt Glei|
|115101|7|2|104|IRCH - BUCH für Ausfahrt via BQUA - STAM|
|115102|7|1|105|BUCH (Schleife) - LANM für Einfahrt via|
|115103|7|2|106|LANM - DEP7 Gleisbau MIBU|
|115104|7|1|107|DEP7 - IRCH Ausfahrt RIGI Gleisbau MIBU|
|115105|7|2|108|SPLA- BSTE E-Bus Gleisbau MIBU|
|115106|7|1|109|BSTE - SPLA E-Bus ( Endziel WOLL) Gleisb|
|115107|7|2|110|MIBU- BSTE E-Bus Gleisbau MIBU|
|115108|7|1|111|BSTE - MIBU E-Bus (Endziel MIBU) Gleisba|
|115110|7|1|113|BSTE - GAR6 E-Bus|
|115113|7|2|116|GAR6 - BSTE E-Bus Gleisbau MIBU|
|115114|7|1|117|GAR6 - MIBU E-Bus Gleisbau MIBU|





