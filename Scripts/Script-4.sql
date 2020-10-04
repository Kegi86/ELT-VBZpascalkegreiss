select 

	halt_id,
	GPS_Latitude,
	GPS_Longitude,
	halt_lang
	from 
	haltepunkt h,
	haltestelle h2 
	left join haltepunkt h3 on h.halt_id = h2.halt_id; 


