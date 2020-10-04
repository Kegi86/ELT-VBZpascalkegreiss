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
