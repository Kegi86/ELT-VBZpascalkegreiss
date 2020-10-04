# ELT-VBZpascalkegreiss
## Aufgabe 6
![ERD](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Bilder_pascal_kegreiss/Aufgabe_06_ERD.PNG)
## Aufgabe 7
[Script Aufgabe 7](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_07_timedif.sql)
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
fsi.linie = "7" and betriebs_datum = "2019-05-06" and fw_kurz = "6" and fahrt_id = "40108" 
order by seq_von 
LIMIT 40000;

~~~~

### Ausgabe 
|linie|richtung|fahrzeug|kurs|seq_von|halt_id_von|halt_id_nach|halt_punkt_id_von|halt_punkt_id_nach|fahrt_id|fahrweg_id|fw_no|fw_typ|fw_kurz|fw_lang|betriebs_datum|datumzeit_soll_an_von|datumzeit_ist_an_von|datumzeit_soll_ab_von|datumzeit_ist_ab_von|datum__nach|timediff_an|timediff_an_seconds|timediff_ab|timediff_ab_seconds|halt_soll_time_seconds|halt_ist_time_seconds|
|-----|--------|--------|----|-------|-----------|------------|-----------------|------------------|--------|----------|-----|------|-------|-------|--------------|---------------------|--------------------|---------------------|--------------------|-----------|-----------|-------------------|-----------|-------------------|----------------------|---------------------|
|7|2|2116|11|1|1504|2406|48305|42524|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:34:30|2019-05-06 06:34:05|2019-05-06 06:34:30|2019-05-06 06:34:05|2019-05-06|00:00:25|-25|00:00:25|-25|0|0|
|7|2|2116|11|2|2406|2375|42524|47381|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:36:06|2019-05-06 06:36:25|2019-05-06 06:36:18|2019-05-06 06:36:42|2019-05-06|00:00:19|19|00:00:24|24|12|17|
|7|2|2116|11|3|2375|2046|47381|47047|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:37:06|2019-05-06 06:37:31|2019-05-06 06:37:18|2019-05-06 06:37:34|2019-05-06|00:00:25|25|00:00:16|16|12|3|
|7|2|2116|11|4|2046|1501|47047|46972|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:38:12|2019-05-06 06:38:38|2019-05-06 06:38:24|2019-05-06 06:38:48|2019-05-06|00:00:26|26|00:00:24|24|12|10|
|7|2|2116|11|5|1501|2510|46972|44434|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:39:36|2019-05-06 06:40:05|2019-05-06 06:39:54|2019-05-06 06:40:19|2019-05-06|00:00:29|29|00:00:25|25|18|14|
|7|2|2116|11|6|2510|2052|44434|44404|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:41:06|2019-05-06 06:41:31|2019-05-06 06:41:18|2019-05-06 06:41:40|2019-05-06|00:00:25|25|00:00:22|22|12|9|
|7|2|2116|11|7|2052|2489|44404|45000|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:42:00|2019-05-06 06:42:29|2019-05-06 06:42:12|2019-05-06 06:42:32|2019-05-06|00:00:29|29|00:00:20|20|12|3|
|7|2|2116|11|8|2489|2356|45000|43478|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:42:54|2019-05-06 06:43:20|2019-05-06 06:43:06|2019-05-06 06:43:33|2019-05-06|00:00:26|26|00:00:27|27|12|13|
|7|2|2116|11|9|2356|2316|43478|43731|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:43:54|2019-05-06 06:44:22|2019-05-06 06:44:06|2019-05-06 06:44:31|2019-05-06|00:00:28|28|00:00:25|25|12|9|
|7|2|2116|11|10|2316|2316|43731|45817|40108|99772|6|1|6|MIBU - BSTE für Ausfahrt|2019-05-06|2019-05-06 06:45:12|2019-05-06 06:45:46|2019-05-06 06:45:30|2019-05-06 06:45:58|2019-05-06|00:00:34|34|00:00:28|28|18|12|


## Aufgabe 8a 

[Script Aufgabe 8a](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_08_a.sql)
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
### Abfrageergebnis

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

## Aufgabe 8b
[Script Aufgabe 8b](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_08_b.sql)
~~~~sql
drop view if exists query_line;
create view query_line
as select distinct 
    linie,
    richtung,
    fw_no,
    fw_lang
from
 	fahrzeiten_soll_ist
where
	inie = "7"
   ;
~~~~ 

### Abfrageergebnis 8b
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

## Aufgabe 8c
[Script Aufgabe 8c](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_08_c.sql)
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

### Abfrageergebnis 8c
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
#### Es müssen in der Tabelle **fahrzeiten_soll_ist** die Spalten *datumzeit_soll_an_nach*,*datumzeit_ist_an_nach*,*datumzeit_soll_ab_nach*,*datumzeit_ist_ab_nach*
#### mit dem Datentyp datetaime hinzugefügt werden.   

[Script Neue Spalten hinzufügen](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_09_splatenhinzuf%C3%BCgen.sql)
~~~~sql
alter table fahrzeiten_soll_ist add datumzeit_soll_an_nach datetime null;
alter table fahrzeiten_soll_ist add datumzeit_ist_an_nach datetime null;
alter table fahrzeiten_soll_ist add datumzeit_soll_ab_nach datetime null;
alter table fahrzeiten_soll_ist add datumzeit_ist_ab_nach datetime null;
~~~~

[Script _nach Zeiten einlesen](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_09_nach_zeiten%20einlesen.sql)

~~~~sql
update fahrzeiten_soll_ist set datumzeit_soll_an_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval soll_an_nach second);
update fahrzeiten_soll_ist set datumzeit_soll_ab_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval soll_ab_nach second);
update fahrzeiten_soll_ist set datumzeit_ist_ab_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval ist_ab_nach second);
update fahrzeiten_soll_ist set datumzeit_ist_an_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval ist_an_nach1 second);
~~~~

[Script Tabelle erstellen](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_09_createTable.sql)
~~~~sql
drop table if exists ankunftszeiten;
create table ankunftszeiten
select  
	halt_punkt_id_nach as haltepunkt_id,
	fahrweg_id,
	fahrt_id,
	datumzeit_ist_an_nach as datumzeit_ist_an,
	datumzeit_soll_an_nach as datumzeit_soll_an,
	datumzeit_soll_ab_nach as datumzeit_soll_ab,
	timestampdiff (second, datumzeit_soll_an_nach, datumzeit_ist_an_nach) as delay
from 
	fahrzeiten_soll_ist fsi 
where 
	linie ="7"
	
union 

select
	halt_punkt_id_von as haltepunkt_id,
	fahrweg_id,
	fahrt_id,
	datumzeit_ist_an_von as datumzeit_ist_an,
	datumzeit_soll_an_von as datumzeit_soll_an,
	datumzeit_soll_ab_von as datumzeit_soll_ab,
	timestampdiff (second, datumzeit_soll_an_von, datumzeit_ist_an_von) as delay
from 
	fahrzeiten_soll_ist fsi 
where 
	seq_von ="1" and
	linie ="7";
alter table ankunftszeiten add id int primary key auto_increment first;
~~~~

[Script Aufgabe 9 Fahrweg](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_09_fahrweg.sql)
~~~~sql
select
    fsi.linie,
    fsi.richtung,
    fsi.betriebsdatum,
    fsi.fahrzeug,
    fsi.kurs,
    fsi.seq_von,
    fsi.halt_kurz_von1,
    fsi.seq_nach,
    fsi.halt_kurz_nach1,
    fsi.datum_nach,
    fsi.fahrt_id,
    fsi.fw_lang
from
    vbzdat.fahrzeiten_soll_ist fsi
where linie ="7" and fahrt_id = "73442" 
order by seq_von ;
~~~~

###Abfrageergebnis

|linie|richtung|betriebsdatum|fahrzeug|kurs|seq_von|halt_kurz_von1|seq_nach|halt_kurz_nach1|datum_nach|fahrt_id|fw_lang|
|-----|--------|-------------|--------|----|-------|--------------|--------|---------------|----------|--------|-------|
|7|1|10.05.19|3053|3|1|BSTE|2|MATT|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|2|MATT|3|PROB|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|3|PROB|4|GLAT|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|4|GLAT|5|ROSW|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|5|ROSW|6|SCHW|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|6|SCHW|7|SCHO|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|7|SCHO|8|WALD|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|8|WALD|9|TIER|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|9|TIER|10|MIBU|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|10|MIBU|11|GUGG|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|11|GUGG|12|SPLA|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|12|SPLA|13|ROES|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|13|ROES|14|OTTI|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|14|OTTI|15|SONN|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|15|SONN|16|HEGG|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|16|HEGG|17|CENT|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|17|CENT|18|BSTR|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|18|BSTR|19|RENN|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|19|RENN|20|PARA|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|20|PARA|21|STOC|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|21|STOC|22|TUNN|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|22|TUNN|23|ENGE|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|23|ENGE|24|MUSR|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|24|MUSR|25|BRUN|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|25|BRUN|26|BILO|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|26|BILO|27|BWST|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|27|BWST|28|PWOL|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|28|PWOL|29|MORG|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|29|MORG|30|BUTZ|10.05.19|73442|BSTE - WOLL|
|7|1|10.05.19|3053|3|30|BUTZ|31|WOLL|10.05.19|73442|BSTE - WOLL|

## Aufgabe 10

[Script Abfrage Delays](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_10_abfrage_delays.sql)
~~~~sql
select 
    h2.halt_lang,
   	h.GPS_Latitude,
    h.GPS_Longitude,
    a.id,
    a.haltepunkt_id,
    a.fahrweg_id,
    l.linie,
    a.datumzeit_ist_an,
    a.datumzeit_soll_an,
    max(a.delay) as delay
from
    vbzdat.ankunftszeiten a
inner join vbzdat.haltepunkt h on 
	h.halt_punkt_id  = a.haltepunkt_id 
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
group by h2.halt_lang 
order by delay desc
limit 20;
~~~~
### Abfrageergebnis
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



[Script Aufgabe 10 für CSV](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_10_Script_CSV.sql)
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

#### Diese Abfrage Exportiert als CSV spalte Color mit diversen farben ergänzt und alle Trennzeichen zu "," konvertiert. Danach auf https://maps.co/gis/ importiert.

### Screenshot von Karte (gewisse Namen gelöscht damit Stecknadel ersichtlich)
![20HS mit grösstem delay](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Bilder_pascal_kegreiss/Aufgabe_10.PNG)

## Aufgabe 11

[Script Aufgabe 11](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_11_visualisierung_linie.sql)
~~~~sql
select distinct
    h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
    h2.halt_lang as name,
    null as color,
    null as note
from
    vbzdat.haltepunkt h
inner join vbzdat.ankunftszeiten a on
    h.halt_punkt_id = a.haltepunkt_id
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
group by h2.halt_lang;
~~~~
### Screenshot Karte mit Namen
![Alle_HS_L7_mit beschriftung](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Bilder_pascal_kegreiss/Aufgabe_11_AlleHS_7_mitBeschriftung.PNG)

### Screenshot Karte ohne Namen
![Alle_HS_L7_ohne beschriftung](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Bilder_pascal_kegreiss/Aufgabe_11_AlleHS_7_ohneBesch.PNG)
[CSV Datei](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Aufgabe_11_csv_export.csv)

## Aufgabe 12
[Script Aufgabe 12](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_12_fahrplan_pivot.sql)

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

## Aufgabe 13
[Script Aufgabe 13](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_13_standort_distance.sql)
~~~~sql
select
    h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
    h2.halt_lang as name,
  null as color,
    SQRT(POW((h.GPS_Latitude - 47.37574), 2) +
    POW((8.54718 - h.GPS_Longitude) * COS(h.GPS_Latitude), 2)) AS note
FROM vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.ankunftszeiten a on
    h.halt_punkt_id = a.haltepunkt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
   
where h.GPS_Latitude is not null and h.GPS_Longitude is not null and linie = "7"
group by h2.halt_lang
order by note
limit 4;
~~~~

### Abfrageergebnis 

|lat|lng|name|color|note|
|---|---|----|-----|----|
|47.377794|8.548236|Zürich, ETH/Universitätsspital||0.0022942741289195662|
|47.376916|8.544086|Zürich, Central||0.0032180592767303354|
|47.378838|8.545304|Zürich, Haldenegg||0.0035907017464634743|
|47.380358|8.548197|Zürich, Haldenbach||0.00472161627634625|


#### Dies als CSV exportiert und die Farbcodes eingestezt in der Spalte "color" alle ; ersetzt durch , und in https://maps.co/gis/ importiert

### Screenshot Map - Mein Standort

![Mein_Standort](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Bilder_pascal_kegreiss/Aufgabe_13_distance.PNG)

## Aufgabe 14

[Script Aufgabe 14](https://github.com/Kegi86/ELT-VBZpascalkegreiss/blob/master/Scripts/Aufgabe_14_linie_distance.sql)
~~~~sql
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
~~~~

## Abfrageergebnis 
|linie|von_haltestelle|nach_haltestelle|distance|
|-----|---------------|----------------|--------|
|7|Zürich, Depot 2 Wollishofen|Zürich, Wollishoferplatz|0.000957633853264|
|7|Zürich, Universität Irchel|Zürich, Depot 7 Irchel|0.0014903441451430788|
|7|Zch, Bhf.Wollishofen/Staubstr.|Zürich, Post Wollishofen|0.002252070530273783|
|7|Zürich, Milchbuck|Zürich, Guggachstrasse|0.002364137340949413|
|7|Zürich, Butzenstrasse|Zürich, Wollishoferplatz|0.002478035314777722|
|7|Zürich, Tunnelstrasse|Zürich, Bahnhof Enge|0.0024983260708551216|
|7|Zürich, Morgental|Zürich, Butzenstrasse|0.0025494690119547696|
|7|Zürich, Stockerstrasse|Zürich, Tunnelstrasse|0.0025954032491588373|
|7|Zürich, Sonneggstrasse|Zürich, Haldenegg|0.0027274203397414927|
|7|Zürich, Post Wollishofen|Zürich, Morgental|0.0029240237214831336|
|7|Zürich, Ottikerstrasse|Zürich, Sonneggstrasse|0.0031343392315264086|
|7|Zürich, Rennweg|Zürich, Paradeplatz|0.003236467956123264|
|7|Zürich, Haldenegg|Zürich, Central|0.0032463633074815727|
|7|Zürich, Bahnhofstrasse/HB|Zürich, Rennweg|0.0032531568026314623|
|7|Zürich, Röslistrasse|Zürich, Ottikerstrasse|0.003261938397533873|
|7|Zürich, Schaffhauserplatz|Zürich, Röslistrasse|0.0034873693088779438|
|7|Zürich, Bahnhof Enge|Zürich, Museum Rietberg|0.0035219724081222447|
|7|Zürich, Depot 7 Irchel|Zürich, Milchbuck|0.003547559822155532|
|7|Zürich, Central|Zürich, Bahnhofstrasse/HB|0.004080791251615068|
|7|Zürich, Paradeplatz|Zürich, Stockerstrasse|0.004188115351739438|
|7|Zürich, Guggachstrasse|Zürich, Schaffhauserplatz|0.004242774805900372|
|7|Zürich, Brunaustrasse|Zürich, Billoweg|0.004494930356499946|
|7|Zürich, Probstei|Zürich, Glattwiesen|0.004511997288707786|
|7|Zürich, Museum Rietberg|Zürich, Brunaustrasse|0.004638086665295955|
|7|Zürich, Billoweg|Zch, Bhf.Wollishofen/Staubstr.|0.004664905553256798|
|7|Zürich, Mattenhof|Zürich, Probstei|0.004765009255366157|
|7|Zürich, Waldgarten|Zürich, Tierspital|0.004906140624967453|
|7|Zürich, Glattwiesen|Zürich, Roswiesen|0.004910492390312646|
|7|Zürich, Bahnhof Stettbach|Zürich, Mattenhof|0.0051015434886906115|
|7|Zürich, Roswiesen|Zürich, Schwamendingerplatz|0.005317270437992545|
|7|Zürich, Schwamendingerplatz|Zürich, Schörlistrasse|0.007225322949115773|
|7|Zürich, Schörlistrasse|Zürich, Waldgarten|0.007344059514367677|
|7|Zürich, Tierspital|Zürich, Milchbuck|0.01100497445354692|









