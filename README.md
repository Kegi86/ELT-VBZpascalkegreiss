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

![Alt-Text](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/AlleHS_7_mitBeschriftung.PNG "Ausgabe")


## Aufgabe 10

|halt_lang|GPS_Latitude|GPS_Longitude|id|haltepunkt_id|fahrweg_id|linie|datumzeit_ist_an|datumzeit_soll_an|delay|
|---------|------------|-------------|--|-------------|----------|-----|----------------|-----------------|-----|
|Zürich, Garage 6 Hardau|47.382204|8.506967|7093|46016|115110|7|2019-05-11 20:21:25|2019-05-11 20:24:00|-155|
|Zürich, Universität Irchel|47.396093|8.545106|57762|47875|99774|7|2019-05-11 00:52:59|2019-05-11 00:53:24|-25|
|Zürich, Stampfenbachplatz|47.380301|8.542819|4315|43011|115101|7|2019-05-11 05:14:49|2019-05-11 05:15:12|-23|
|Zürich, Wollishoferplatz|47.338309|8.530794|1|48081|99771|7|2019-05-06 05:59:39|2019-05-06 06:00:00|-21|
|Zürich, Depot 7 Irchel|47.395078|8.543973|58024|47554|99773|7|2019-05-06 05:13:39|2019-05-06 05:14:00|-21|
|Zürich, Laubiweg|47.394862|8.536457|4382|47739|115098|7|2019-05-11 15:32:04|2019-05-11 15:32:24|-20|
|Zürich, Bahnhofquai/HB|47.378063|8.541673|4297|47566|115101|7|2019-05-11 05:12:46|2019-05-11 05:13:06|-20|
|Zürich, ETH/Universitätsspital|47.377207|8.547469|4289|48592|115101|7|2019-05-11 05:07:47|2019-05-11 05:08:06|-19|
|Zürich, Depot 2 Wollishofen|47.337389|8.531066|58007|43299|99771|7|2019-05-06 05:57:46|2019-05-06 05:58:00|-14|
|Zürich, Schörlistrasse|47.406367|8.564466|8554|47047|99772|7|2019-05-07 05:19:58|2019-05-07 05:20:12|-14|
|Zürich, Haldenbach|47.380116|8.548072|4293|42985|115101|7|2019-05-11 05:06:23|2019-05-11 05:06:36|-13|
|Zürich, Tierspital|47.401645|8.551422|8514|42524|99772|7|2019-05-07 05:17:54|2019-05-07 05:18:06|-12|
|Zürich, Kronenstrasse|47.388287|8.539236|4305|49422|115101|7|2019-05-11 05:17:36|2019-05-11 05:17:48|-12|
|Zürich, Beckenhof|47.384221|8.540238|4296|49441|115101|7|2019-05-11 05:16:24|2019-05-11 05:16:36|-12|
|Zürich, Roswiesen|47.402886|8.57735|8492|44434|99772|7|2019-05-07 05:22:55|2019-05-07 05:23:06|-11|
|Zürich, Waldgarten|47.403776|8.557164|8535|47381|99772|7|2019-05-07 05:18:55|2019-05-07 05:19:06|-11|
|Zürich, Schwamendingerplatz|47.404475|8.572137|8467|46972|99772|7|2019-05-07 05:21:26|2019-05-07 05:21:36|-10|
|Zürich, Milchbuck|47.398163|8.542155|58555|48305|99772|7|2019-05-07 05:16:20|2019-05-07 05:16:30|-10|
|Zürich, Glattwiesen|47.4015|8.581917|8531|44404|99772|7|2019-05-07 05:23:54|2019-05-07 05:24:00|-6|
|Zürich, Post Wollishofen|47.344869|8.53339|20606|44510|111874|7|2019-05-10 13:40:56|2019-05-10 13:41:00|-4|

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
###Ausgabe

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





