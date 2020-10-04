select
    h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
    h2.halt_lang as name,
  null as color,
    SQRT(POW(69.1 * (h.GPS_Latitude - 47.364700), 2) +
    POW(69.1 * (8.5542100 - h.GPS_Longitude) * COS(h.GPS_Latitude / 57.3), 2)) AS note
FROM vbzdat.haltepunkt h
inner join vbzdat.haltestelle h2 on
    h.halt_id = h2.halt_id
inner join vbzdat.ankunftszeiten a on
    h.halt_punkt_id = a.haltepunkt_id
inner join vbzdat.linie l on
    a.fahrweg_id = l.fahrweg_id
   
where h.GPS_Latitude is not null and h.GPS_Longitude is not null 
group by h2.halt_lang
order by note
limit 4;


