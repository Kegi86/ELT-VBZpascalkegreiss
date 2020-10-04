ALTER TABLE vbzdat.haltepunkt MODIFY COLUMN halt_punkt_id int NOT NULL;
ALTER TABLE vbzdat.haltepunkt ADD CONSTRAINT haltepunkt_pk PRIMARY KEY (halt_punkt_id);


ALTER TABLE vbzdat.haltestelle MODIFY COLUMN halt_id int NOT NULL;
ALTER TABLE vbzdat.haltestelle ADD CONSTRAINT haltestelle_pk PRIMARY KEY (halt_id);
