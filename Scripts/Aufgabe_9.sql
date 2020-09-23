create table ankunftszeiten(
id int not null auto_increment,
haltepunkt_id int,
fahrweg_id int,
fahrt_id int,
datumszeit_ist_an date,
datumszeit_soll_an date,
datumszeit_soll_ab date,
delay int,
primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE vbzdat.ankunftszeiten ADD CONSTRAINT ankunftszeiten_FK FOREIGN KEY (haltepunkt_id) REFERENCES vbzdat.haltepunkt(halt_punkt_id);
ALTER TABLE vbzdat.ankunftszeiten ADD CONSTRAINT ankunftszeiten_FK_1 FOREIGN KEY (fahrweg_id) REFERENCES vbzdat.linie(fahrweg_id);

