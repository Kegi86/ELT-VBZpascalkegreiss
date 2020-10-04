select
    h.GPS_Latitude as lat,
    h.GPS_Longitude as lng,
    SQRT(POW(69.1 * (h.GPS_Latitude - 47.364783), 2) +
    POW(69.1 * (8.5542241 - h.GPS_Longitude) * COS(h.GPS_Latitude / 57.3), 2)) AS distance
FROM vbzdat.haltepunkt h HAVING distance < 25 ORDER BY distance;