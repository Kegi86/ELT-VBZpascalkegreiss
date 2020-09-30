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

## Aufgabe 9


## Aufgabe 10

|halt_lang|GPS_Latitude|GPS_Longitude|id|haltepunkt_id|fahrweg_id|linie|datumzeit_ist_an|datumzeit_soll_an|delay|
|---------|------------|-------------|--|-------------|----------|-----|----------------|-----------------|-----|
|Zürich, Central|47.376916|8.544086|90|43696|115102|7|2019-05-12 00:56:21|2019-05-12 00:54:30|2891|
|Zürich, Butzenstrasse|47.341084|8.530374|1710|43081|115099|7|2019-05-11 11:08:40|2019-05-11 11:08:24|2879|
|Zürich, Morgental|47.343586|8.530174|1536|46188|115099|7|2019-05-11 11:09:53|2019-05-11 11:09:36|2873|
|Zürich, Post Wollishofen|47.344869|8.53339|1545|44510|115099|7|2019-05-11 11:11:30|2019-05-11 11:11:00|2871|
|Zch, Bhf.Wollishofen/Staubstr.|47.347212|8.532909|1546|46812|115099|7|2019-05-11 11:12:26|2019-05-11 11:11:54|2865|
|Zürich, Billoweg|47.351836|8.531971|1590|49569|115099|7|2019-05-11 11:13:52|2019-05-11 11:13:12|2855|
|Zürich, Brunaustrasse|47.35634|8.532196|1736|48006|115099|7|2019-05-11 11:15:01|2019-05-11 11:14:36|2842|
|Zürich, Museum Rietberg|47.360925|8.531588|1551|46541|115099|7|2019-05-11 11:16:24|2019-05-11 11:15:54|2830|
|Zürich, Stockerstrasse|47.367969|8.536195|1555|43040|115099|7|2019-05-11 11:20:55|2019-05-11 11:20:00|2817|
|Zürich, Bahnhof Enge|47.364425|8.531475|1544|42521|115099|7|2019-05-11 11:17:57|2019-05-11 11:17:18|2813|
|Zürich, Paradeplatz|47.36984|8.539093|1566|45342|115099|7|2019-05-11 09:11:47|2019-05-11 09:10:18|2809|
|Zürich, Rennweg|47.373301|8.538304|1549|46599|115099|7|2019-05-11 09:13:17|2019-05-11 09:12:00|2797|
|Zürich, Bahnhofstrasse/HB|47.376114|8.539501|1560|44298|115099|7|2019-05-11 09:14:57|2019-05-11 09:13:24|2796|
|Zürich, Tunnelstrasse|47.366461|8.533012|1599|45992|115099|7|2019-05-11 11:19:31|2019-05-11 11:18:42|2795|
|Zürich, Waldgarten|47.403567|8.557318|417|44928|115105|7|2019-05-11 11:14:24|2019-05-11 11:13:12|937|
|Zürich, Tierspital|47.40231|8.55337|433|47373|115105|7|2019-05-11 11:13:29|2019-05-11 11:12:12|713|
|Zürich, Wollishoferplatz|47.338309|8.530794|1|48081|99771|7|2019-05-06 05:59:39|2019-05-06 06:00:00|559|
|Zürich, Laubiweg|47.394862|8.536457|86|47739|115102|7|2019-05-12 00:46:12|2019-05-12 00:44:48|550|
|Zürich, Bucheggplatz|47.39822|8.533334|98|42909|115102|7|2019-05-12 00:44:48|2019-05-12 00:43:18|544|
|Zürich, Schaffhauserplatz|47.391521|8.538706|119|48183|115102|7|2019-05-12 00:47:55|2019-05-12 00:46:06|536|

## Aufgabe 12
### Script

~~~~sql
select distinct 
    h.halt_lang,
    fsi.betriebsdatum,
    fsi.fahrt_id,
    fsi.linie,
    fsi.richtung,
   date_format(fsi.datumzeit_soll_ab_von, '%H:%i') as abfahrtszeit
from
    vbzdat.fahrzeiten_soll_ist fsi
inner join vbzdat.haltestelle h on
    h.halt_id = fsi.halt_id_von
where
 linie = "7" and fsi.richtung = "1" and fsi.betriebsdatum = "06.05.19" and fsi.fahrt_id = "40143"
 
group by h.halt_lang
order by abfahrtszeit;
~~~~
### Ausgabe

|halt_lang|betriebsdatum|fahrt_id|linie|richtung|abfahrtszeit|
|---------|-------------|--------|-----|--------|------------|
|Zürich, Bahnhof Stettbach|06.05.19|40143|7|1|16:41|
|Zürich, Mattenhof|06.05.19|40143|7|1|16:42|
|Zürich, Probstei|06.05.19|40143|7|1|16:43|
|Zürich, Glattwiesen|06.05.19|40143|7|1|16:44|
|Zürich, Roswiesen|06.05.19|40143|7|1|16:45|
|Zürich, Schwamendingerplatz|06.05.19|40143|7|1|16:47|
|Zürich, Schörlistrasse|06.05.19|40143|7|1|16:48|
|Zürich, Waldgarten|06.05.19|40143|7|1|16:50|
|Zürich, Tierspital|06.05.19|40143|7|1|16:51|
|Zürich, Milchbuck|06.05.19|40143|7|1|16:53|
|Zürich, Guggachstrasse|06.05.19|40143|7|1|16:54|
|Zürich, Schaffhauserplatz|06.05.19|40143|7|1|16:56|
|Zürich, Röslistrasse|06.05.19|40143|7|1|16:57|
|Zürich, Ottikerstrasse|06.05.19|40143|7|1|16:58|
|Zürich, Sonneggstrasse|06.05.19|40143|7|1|16:59|
|Zürich, Haldenegg|06.05.19|40143|7|1|17:00|
|Zürich, Central|06.05.19|40143|7|1|17:03|
|Zürich, Bahnhofstrasse/HB|06.05.19|40143|7|1|17:06|
|Zürich, Rennweg|06.05.19|40143|7|1|17:07|
|Zürich, Paradeplatz|06.05.19|40143|7|1|17:09|
|Zürich, Stockerstrasse|06.05.19|40143|7|1|17:11|
|Zürich, Tunnelstrasse|06.05.19|40143|7|1|17:12|
|Zürich, Bahnhof Enge|06.05.19|40143|7|1|17:13|
|Zürich, Museum Rietberg|06.05.19|40143|7|1|17:14|
|Zürich, Brunaustrasse|06.05.19|40143|7|1|17:16|
|Zürich, Billoweg|06.05.19|40143|7|1|17:17|
|Zch, Bhf.Wollishofen/Staubstr.|06.05.19|40143|7|1|17:18|
|Zürich, Post Wollishofen|06.05.19|40143|7|1|17:19|
|Zürich, Morgental|06.05.19|40143|7|1|17:21|
|Zürich, Butzenstrasse|06.05.19|40143|7|1|17:22|





