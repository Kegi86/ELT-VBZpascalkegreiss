update fahrzeiten_soll_ist set datumzeit_soll_an_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval soll_an_nach second);
update fahrzeiten_soll_ist set datumzeit_soll_ab_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval soll_ab_nach second);
update fahrzeiten_soll_ist set datumzeit_ist_ab_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval ist_ab_nach second);
update fahrzeiten_soll_ist set datumzeit_ist_an_nach = date_add(str_to_date(datum__nach,'%Y-%m-%d'), interval ist_an_nach1 second);