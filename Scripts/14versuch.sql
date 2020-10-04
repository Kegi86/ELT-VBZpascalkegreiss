SELECT fsi.halt_id_von,
fsi.halt_id_nach,
fsi.halt_punkt_von,
fsi.halt_punkt_nach,
h2.halt_lang,
von_halt_lang,
h.GPS_Latitude,
von_lat,
h.GPS_Longitude,
von_lng,
(SELECT h4.halt_lang
FROM haltestelle h4
WHERE h4.halt_id = fsi.halt_id_nach
GROUP BY h4.halt_id)
nach_halt_lang,
@nach_lat := ()