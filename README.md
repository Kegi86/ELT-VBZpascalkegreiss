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

~~~~sql
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
~~~~
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

~~~~sql
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
~~~~ 


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

## Aufgabe 8 c
~~~~sql
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
~~~~

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


## Aufgabe 10
### Script
~~~~sql
select
    h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
    h2.halt_lang as name,
    null as color,
    max(a.delay) as note
from
    vbzdat.haltepunkt h
inner join vbzdat.ankunftszeiten a on
    h.halt_punkt_id = a.haltepunkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id

   group by h2.halt_lang
   
   order by note desc
  
 
   limit 20;

~~~~

### Ausgabe

|lat|lng|name|color|note|
|---|---|----|-----|----|
|47.376916|8.544086|Zürich, Central||2891|
|47.341084|8.530374|Zürich, Butzenstrasse||2879|
|47.343586|8.530174|Zürich, Morgental||2873|
|47.344869|8.53339|Zürich, Post Wollishofen||2871|
|47.347212|8.532909|Zch, Bhf.Wollishofen/Staubstr.||2865|
|47.351836|8.531971|Zürich, Billoweg||2855|
|47.35634|8.532196|Zürich, Brunaustrasse||2842|
|47.360925|8.531588|Zürich, Museum Rietberg||2830|
|47.367969|8.536195|Zürich, Stockerstrasse||2817|
|47.364425|8.531475|Zürich, Bahnhof Enge||2813|
|47.36984|8.539093|Zürich, Paradeplatz||2809|
|47.373301|8.538304|Zürich, Rennweg||2797|
|47.376114|8.539501|Zürich, Bahnhofstrasse/HB||2796|
|47.366461|8.533012|Zürich, Tunnelstrasse||2795|
|47.403567|8.557318|Zürich, Waldgarten||937|
|47.40231|8.55337|Zürich, Tierspital||713|
|47.338309|8.530794|Zürich, Wollishoferplatz||559|
|47.394862|8.536457|Zürich, Laubiweg||550|
|47.39822|8.533334|Zürich, Bucheggplatz||544|
|47.391521|8.538706|Zürich, Schaffhauserplatz||536|

## Aufgabe 11
~~~~sql
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
   
~~~~

![Haltestellen ohne Beschriftung](C:\Users\King Dingeling\git\ELT-VBZpascalkegreiss\Bilder_pascal_kegreiss)

## Aufgabe 12
### Script

~~~~sql
select s1.halt_lang,
	min(case when s1.fahrt_id = 39362 then s1.abfahrtszeit end) fahrt_id39362,
	min(case when s1.fahrt_id = 39364 then s1.abfahrtszeit end) fahrt_id39364,
	min(case when s1.fahrt_id = 39366 then s1.abfahrtszeit end) fahrt_id39366
from 
(select  
    h.halt_lang,
    fsi.fahrt_id,
 	date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltestelle h on
    h.halt_id = fsi.halt_id_von
    and fsi.linie = "7" and fsi.richtung = "1" and fsi.betriebsdatum = "06.05.19" and fsi.fahrt_id in (39362,39364,39366)    where date_format(fsi.datumzeit_soll_ab_von, '%H:%i') is not null
    
) s1

group by s1.halt_lang
order by s1.abfahrtszeit
;
~~~~
### Ausgabe

|halt_lang|fahrt_id39362|fahrt_id39364|fahrt_id39366|
|---------|-------------|-------------|-------------|
|Zürich, Bahnhof Stettbach|07:19|08:57|10:34|
|Zürich, Mattenhof|07:20|08:58|10:35|
|Zürich, Probstei|07:21|08:59|10:36|
|Zürich, Glattwiesen|07:22|09:00|10:37|
|Zürich, Roswiesen|07:24|09:01|10:38|
|Zürich, Schwamendingerplatz|07:25|09:02|10:40|
|Zürich, Schörlistrasse|07:27|09:04|10:41|
|Zürich, Waldgarten|07:28|09:05|10:43|
|Zürich, Tierspital|07:29|09:06|10:44|
|Zürich, Milchbuck|07:31|09:08|10:46|
|Zürich, Guggachstrasse|07:33|09:09|10:47|
|Zürich, Schaffhauserplatz|07:34|09:11|10:48|
|Zürich, Röslistrasse|07:35|09:12|10:50|
|Zürich, Ottikerstrasse|07:37|09:14|10:51|
|Zürich, Sonneggstrasse|07:38|09:15|10:52|
|Zürich, Haldenegg|07:39|09:16|10:53|
|Zürich, Central|07:40|09:17|10:55|
|Zürich, Bahnhofstrasse/HB|07:43|09:20|10:58|
|Zürich, Rennweg|07:45|09:22|10:59|
|Zürich, Paradeplatz|07:47|09:24|11:01|
|Zürich, Stockerstrasse|07:48|09:25|11:03|
|Zürich, Tunnelstrasse|07:49|09:26|11:04|
|Zürich, Bahnhof Enge|07:51|09:28|11:05|
|Zürich, Museum Rietberg|07:52|09:29|11:06|
|Zürich, Brunaustrasse|07:53|09:30|11:07|
|Zürich, Billoweg|07:54|09:31|11:09|
|Zch, Bhf.Wollishofen/Staubstr.|07:55|09:32|11:10|
|Zürich, Post Wollishofen|07:56|09:33|11:11|
|Zürich, Morgental|07:58|09:35|11:12|
|Zürich, Butzenstrasse|07:59|09:36|11:13|






