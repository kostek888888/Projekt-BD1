--widok dyrektora widzi pracowników I ich obowiazki
create view Dyrektor_w AS 
Select p.id_pracownika, p.imie, p.nazwisko, p.pesel, p.adres, p.staz_msc, p.telefon, o.opis_obowiazku, o.data_zakonczenia, o.id_oddzialu
from Pracownicy p
LEFT JOIN Obowiazki o ON p.id_obowiazku=o.id_obowiazku;
 
select * from Dyrektor_w;
drop view Dyrektor_w;


create view Straznik_w AS 
Select w.id_wieznia, w.imie, w.nazwisko, w.pesel, g.id_grupy AS Id_grupy_wieziennej, c.*, d.id_wyroku, d.opis_wyroku
from Wiezniowie w 
LEFT JOIN Grupa g ON w.id_grupy=g.id_grupy
LEFT JOIN Cele c ON g.id_celi=c.id_celi
LEFT JOIN Wyroki d ON w.id_wyroku=d.id_wyroku
ORDER BY id_wieznia ASC; 
select * from Straznik_w;
drop view Straznik_w;


create view Zaopatrzenie_w AS 
Select z.rodzaj_zaopatrzenia, z.nazwa_dostawcy, z.stan_biezacy, z.id_oddzialu, o.nazwa_oddzialu
from Zaopatrzenie z, Oddzial o WHERE z.stan_biezacy = 'brak' AND z.id_oddzialu = o.id_oddzialu;
 
select * from Zaopatrzenie_w;
drop view Zaopatrzenie_w;


create view Pracownik_kadr_w AS 
Select o.id_obowiazku, o.opis_obowiazku, o.data_zakonczenia, p.imie, p.nazwisko, d.nazwa_oddzialu
from Obowiazki o, Pracownicy p, Oddzial d WHERE o.id_obowiazku = p.id_obowiazku AND o.id_oddzialu=d.id_oddzialu 
UNION ALL 
SELECT o.id_obowiazku, o.opis_obowiazku, o.data_zakonczenia, w.imie, w.nazwisko, k.nazwa_oddzialu 
FROM Obowiazki o, Wiezniowie w, Oddzial k WHERE o.id_obowiazku = w.id_obowiazku AND o.id_oddzialu=k.id_oddzialu
ORDER BY id_obowiazku ASC;

 
select * from Pracownik_kadr_w;
drop view Pracownik_kadr_w;


create view Recydywa_w AS 
Select w.id_wieznia, w.imie, w.nazwisko, w.pesel, g.id_grupy AS Id_grupy_wieziennej, d.opis_wyroku, d.data_rozpoczecia, d.data_zakonczenia
from Wiezniowie w, Grupa g, Wyroki d WHERE w.id_grupy=g.id_grupy AND w.id_wyroku=d.id_wyroku AND g.id_grupy = 3;
 
select * from Recydywa_w;
drop view Recydywa_w;


create view Dostepne_cele_w AS 
SELECT COUNT(id_celi) AS Dostepne_cele FROM Cele
WHERE max_ilosc_osob!=akt_ilosc_osob;
select * from Dostepne_cele_w;
drop view Dostepne_cele_w;