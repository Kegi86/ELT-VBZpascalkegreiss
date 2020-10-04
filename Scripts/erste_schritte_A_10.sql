select * from ankunftszeiten a 
join linie using (fahrweg_id)
where linie.linie = "7"
