DROP TABLE Wiezniowie CASCADE CONSTRAINTS;
DROP TABLE Grupa CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Zaopatrzenie CASCADE CONSTRAINTS;
DROP TABLE Obowiazki CASCADE CONSTRAINTS;
DROP TABLE Cele CASCADE CONSTRAINTS;
DROP TABLE Oddzial CASCADE CONSTRAINTS;
DROP TABLE Wyroki CASCADE CONSTRAINTS;
DROP TABLE Przywileje_kary CASCADE CONSTRAINTS;
DROP TABLE Lista CASCADE CONSTRAINTS;
DROP TABLE Archiwum_wiezniow CASCADE CONSTRAINTS;




CREATE TABLE Archiwum_wiezniow(
imie VARCHAR2(50),
nazwisko VARCHAR2(100),
pesel CHAR(11),
data_wyjscia DATE
);

CREATE TABLE Lista (
id_listy NUMBER CONSTRAINT lista_pk PRIMARY KEY,
nazwa VARCHAR2(50) NOT NULL,
opis VARCHAR2(200)
);


CREATE TABLE Przywileje_kary (
id_przyw_kar NUMBER CONSTRAINT przywileje_kary_pk PRIMARY KEY,
data_rozpoczecia DATE NOT NULL,
data_zakonczenia DATE NOT NULL,
id_listy NUMBER NOT NULL,
id_wieznia NUMBER NOT NULL,
CONSTRAINT przywKar_lista_fk FOREIGN KEY (id_listy) REFERENCES Lista(id_listy)
);

CREATE TABLE Wyroki (
id_wyroku NUMBER constraint wyrok_pk PRIMARY KEY,
opis_wyroku VARCHAR(300) NOT NULL,
data_rozpoczecia DATE NOT NULL,
data_zakonczenia DATE NOT NULL
);

CREATE TABLE Oddzial (
id_oddzialu NUMBER CONSTRAINT oddzial_pk PRIMARY KEY,
nazwa_oddzialu VARCHAR2(80) NOT NULL
);

CREATE TABLE Cele (
id_celi NUMBER CONSTRAINT cele_pk PRIMARY KEY,
max_ilosc_osob NUMBER NOT NULL,
akt_ilosc_osob NUMBER NOT NULL,
id_oddzialu NUMBER,
CONSTRAINT cele_oddzial_fk FOREIGN KEY (id_oddzialu) REFERENCES Oddzial(id_oddzialu)
);

CREATE TABLE Obowiazki(
id_obowiazku NUMBER CONSTRAINT id_obowiazku_pk PRIMARY KEY,
opis_obowiazku VARCHAR2(120) NOT NULL,
data_zakonczenia DATE NOT NULL,
id_oddzialu NUMBER NOT NULL,
CONSTRAINT obowiazki_odzial_fk FOREIGN KEY (id_oddzialu) REFERENCES Oddzial(id_oddzialu)
);


CREATE TABLE Zaopatrzenie(
id_zaopatrzenia NUMBER CONSTRAINT id_zaopatrzenia_pk PRIMARY KEY,
rodzaj_zaopatrzenia VARCHAR2(70) NOT NULL,
nazwa_dostawcy VARCHAR2(120) NOT NULL,
stan_biezacy VARCHAR2(50) NOT NULL,
id_oddzialu NUMBER NOT NULL,
CONSTRAINT  zaopatrzenie_oddzial_fk FOREIGN KEY (id_oddzialu) REFERENCES Oddzial(id_oddzialu)
);


CREATE TABLE Pracownicy (
id_pracownika NUMBER CONSTRAINT pracownik_pk PRIMARY KEY,
imie VARCHAR2(50) NOT NULL,
nazwisko VARCHAR2(100) NOT NULL,
pesel CHAR(11) NOT NULL CONSTRAINT pracownik_uni UNIQUE,
wiek number not null,
adres  VARCHAR2(100) NOT NULL,
pensja NUMBER NOT NULL,
staz_msc Number NOT NULL,
telefon VARCHAR2(11),
id_oddzialu NUMBER,
id_obowiazku NUMBER NOT NULL,
CONSTRAINT  pracownik_oddzial_fk FOREIGN KEY (id_oddzialu) REFERENCES Oddzial(id_oddzialu),
CONSTRAINT  pracownik_obowiazek_fk FOREIGN KEY (id_obowiazku) REFERENCES Obowiazki(id_obowiazku)
);

CREATE TABLE Grupa (
id_grupy NUMBER CONSTRAINT grupa_wiezienna_pk PRIMARY KEY,
nazwa_grupy VARCHAR2(50) NOT NULL,
opis_grupy VARCHAR2(250) NOT NULL,
id_celi NUMBER NOT NULL,
CONSTRAINT grupa_cele_fk FOREIGN KEY (id_celi) REFERENCES Cele(id_celi)
);

CREATE TABLE Wiezniowie (
id_wieznia NUMBER CONSTRAINT wiezien_pk PRIMARY KEY,
imie VARCHAR2(50) NOT NULL,
nazwisko VARCHAR2(100) NOT NULL,
pesel CHAR(11) NOT NULL,
wiek number not null,
id_wyroku NUMBER NOT NULL,
id_grupy NUMBER NOT NULL,
id_nagrod_kar NUMBER NOT NULL,
id_obowiazku NUMBER,
CONSTRAINT wieznien_wyroki_fk FOREIGN KEY (id_wyroku) REFERENCES Wyroki(id_wyroku),
CONSTRAINT wieznien_grupa_fk FOREIGN KEY (id_grupy) REFERENCES Grupa(id_grupy),
CONSTRAINT wieznien_nagrodyKary_fk FOREIGN KEY(id_nagrod_kar) REFERENCES Przywileje_kary(id_przyw_kar),
CONSTRAINT wiezien_obowiazek_fk FOREIGN KEY (id_obowiazku) REFERENCES Obowiazki(id_obowiazku)
);

-----------------------------------DELETE--------------------------------------------
DELETE FROM Wiezniowie;
DELETE FROM Grupa;
DELETE FROM Pracownicy;
DELETE FROM Zaopatrzenie;
DELETE FROM Oddzial;
DELETE FROM Obowiazki;
DELETE FROM Cele;
DELETE FROM Wyroki;
DELETE FROM Przywileje_kary;
DELETE FROM Lista;


----------------------------------INSERT---------------------------------------------

-----LISTA-----------
INSERT INTO Lista VALUES(1,'Prawo do spaceru','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(2,'Przepustka jednodniowa','Tylko za wyjatowo dobre zachowanie, tylko dla osadzonych za drobne przestepstwa');
INSERT INTO Lista VALUES(3,'Widzenie z rodzina','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(4,'Izolatka','');
INSERT INTO Lista VALUES(5,'Tygodniowa izolatka','Gdy izolatka nie odnosi skutku');
INSERT INTO Lista VALUES(6,'Dodatkowa ksiazka z biblioteki','Dla zaczytanych za dobre sprawowanie');
INSERT INTO Lista VALUES(7,'Ogladanie telewizji','');
INSERT INTO Lista VALUES(8,'Telefon do rodziny','');
INSERT INTO Lista VALUES(9,'Wybór rodzaju posilku','');
INSERT INTO Lista VALUES(10,'Widzemie z adwokatem','');
INSERT INTO Lista VALUES(11,'Zakaz pracy','');
INSERT INTO Lista VALUES(12,'Przywilej pracy','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(13,'Uczestniczenie w grach zespolowych','Niedostepne dla wiezni?w z powaznymi i bardzo powaznymi wykroczeniami');
INSERT INTO Lista VALUES(14,'Wczesniejsze zwolnienie','Za bardzo dobre sprawowanie');
INSERT INTO Lista VALUES(15,'Prawo do ubiegania sie o zmiane cel','Niedostepne dla wiezni?w z powaznymi i bardzo powaznymi wykroczeniami');



---zmienic daty ew
-----PRZZYWILEJE KARY-------
INSERT INTO Przywileje_kary values(1,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   1,1);
INSERT INTO Przywileje_kary values(2,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   1,2);
INSERT INTO Przywileje_kary values(3,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,3);
INSERT INTO Przywileje_kary values(4,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,4);
INSERT INTO Przywileje_kary values(5,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,5);
INSERT INTO Przywileje_kary values(6,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,6);
INSERT INTO Przywileje_kary values(7,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,7);
INSERT INTO Przywileje_kary values(8,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,8);
INSERT INTO Przywileje_kary values(9,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   1,9);
INSERT INTO Przywileje_kary values(10,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,9);
INSERT INTO Przywileje_kary values(11,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,10);
INSERT INTO Przywileje_kary values(12,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,11);
INSERT INTO Przywileje_kary values(13,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,12);
INSERT INTO Przywileje_kary values(14,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,13);
INSERT INTO Przywileje_kary values(15,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,14);
INSERT INTO Przywileje_kary values(16,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'),   3,15);



----------WYROKI------------
INSERT INTO Wyroki VALUES(1,'Rozboje',      TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(2,'Kradziez',      TO_DATE('2017/01/02', 'yyyy/mm/dd'),      TO_DATE('2019/05/02', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(3,'Zabojstwo',      TO_DATE('2000/02/03', 'yyyy/mm/dd'),      TO_DATE('2020/02/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(4,'Niszczenie mienia',      TO_DATE('2017/01/04', 'yyyy/mm/dd'),      TO_DATE('2017/04/04', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(5,'Rabunek',      TO_DATE('2016/05/05', 'yyyy/mm/dd'),      TO_DATE('2017/05/05', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(6,'Wymuszenia z bronia i zaobijstwo',      TO_DATE('2010/07/03', 'yyyy/mm/dd'),      TO_DATE('2030/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(7,'Gwalt',      TO_DATE('2012/01/06', 'yyyy/mm/dd'),      TO_DATE('2027/05/06', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(8,'Pedofilia',      TO_DATE('2000/05/07', 'yyyy/mm/dd'),      TO_DATE('2030/05/07', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(9,'Kradzierz',      TO_DATE('2017/05/08', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(10,'Napad na bank',      TO_DATE('2017/05/09', 'yyyy/mm/dd'),      TO_DATE('2020/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(11,'Rozboje',      TO_DATE('2017/05/13', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(12,'Posiadanie narkotyk?w',      TO_DATE('2017/01/13', 'yyyy/mm/dd'),      TO_DATE('2018/05/13', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(13,'Rabunek',      TO_DATE('2005/05/17', 'yyyy/mm/dd'),      TO_DATE('2006/08/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(14,'Rozboje',      TO_DATE('2017/05/15', 'yyyy/mm/dd'),      TO_DATE('2018/04/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(15,'Rozboje',      TO_DATE('2017/05/23', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));



--------ODDZIAL------------
INSERT INTO Oddzial VALUES(1,'Blok wiezienny: Normalny');
INSERT INTO Oddzial VALUES(2,'Blok wiezienny: Zaostrzony rygor');
INSERT INTO Oddzial VALUES(3,'Blok wiezienny: Izolatki');
INSERT INTO Oddzial VALUES(4,'Kuchnia');
INSERT INTO Oddzial VALUES(5,'Magazyn zaopatrzenia');
INSERT INTO Oddzial VALUES(6,'Oddzial medyczny');
INSERT INTO Oddzial VALUES(7,'Warsztat pracy');
INSERT INTO Oddzial VALUES(8,'Pralnia');
INSERT INTO Oddzial VALUES(9,'Biblioteka');
INSERT INTO Oddzial VALUES(10,'Lazienka dla wiezni?w');
INSERT INTO Oddzial VALUES(11,'Lazienka dla pracownik?w');
INSERT INTO Oddzial VALUES(12,'Rachunkowosc');
INSERT INTO Oddzial VALUES(13,'Pokoje personelu');
INSERT INTO Oddzial VALUES(14,'Gabinet dyrektora');
INSERT INTO Oddzial VALUES(15,'Biuro pracownik?w');



---------CELE------------
--5os
INSERT INTO Cele VALUES(1,5,5,1);
INSERT INTO Cele VALUES(2,5,5,1);
INSERT INTO Cele VALUES(3,5,5,1);
INSERT INTO Cele VALUES(4,5,5,1);
INSERT INTO Cele VALUES(5,5,0,1);
--2os
INSERT INTO Cele VALUES(6,2,2,2);
INSERT INTO Cele VALUES(7,2,2,2);
INSERT INTO Cele VALUES(8,2,2,2);
INSERT INTO Cele VALUES(9,2,2,2);
INSERT INTO Cele VALUES(10,2,2,2);
INSERT INTO Cele VALUES(11,2,0,2);
--1os
INSERT INTO Cele VALUES(12,1,1,3);
INSERT INTO Cele VALUES(13,1,1,3);
INSERT INTO Cele VALUES(14,1,1,3);
INSERT INTO Cele VALUES(15,1,1,3);
INSERT INTO Cele VALUES(16,1,1,3);
INSERT INTO Cele VALUES(17,1,1,3);
INSERT INTO Cele VALUES(18,1,0,3);



--------OBOWIAZKI----------
INSERT INTO Obowiazki VALUES(1,'Nadzor nad wiezniami',TO_DATE('2017/05/03', 'yyyy/mm/dd'),  1);
INSERT INTO Obowiazki VALUES(2,'Nadzor nad wiezniami',TO_DATE('2018/07/14', 'yyyy/mm/dd'),  1);
INSERT INTO Obowiazki VALUES(3,'Nadzor nad wiezniami',TO_DATE('2017/12/31', 'yyyy/mm/dd'),  2);
INSERT INTO Obowiazki VALUES(4,'Nadzor nad wiezniami',TO_DATE('2019/01/01', 'yyyy/mm/dd'),  3);
INSERT INTO Obowiazki VALUES(5,'Nadzor nad wiezniami',TO_DATE('2020/02/25', 'yyyy/mm/dd'),  3);
INSERT INTO Obowiazki VALUES(6,'Sprzatanie',TO_DATE('2017/03/31', 'yyyy/mm/dd'),  1);
INSERT INTO Obowiazki VALUES(7,'Sprzatanie',TO_DATE('2017/02/12', 'yyyy/mm/dd'),  2);
INSERT INTO Obowiazki VALUES(8,'Praca w kuchni',TO_DATE('2017/02/21', 'yyyy/mm/dd'),  4);
INSERT INTO Obowiazki VALUES(9,'Praca w kuchni',TO_DATE('2017/02/20', 'yyyy/mm/dd'),  4);
INSERT INTO Obowiazki VALUES(10,'Zarzadanie dostawami',TO_DATE('2020/12/31', 'yyyy/mm/dd'),  5);
INSERT INTO Obowiazki VALUES(11,'Opieka medyczna',TO_DATE('2019/12/31', 'yyyy/mm/dd'),  6);
INSERT INTO Obowiazki VALUES(12,'Opieka medyczna',TO_DATE('2019/12/31', 'yyyy/mm/dd'),  6);
INSERT INTO Obowiazki VALUES(13,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'),  7);
INSERT INTO Obowiazki VALUES(14,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'),  7);
INSERT INTO Obowiazki VALUES(15,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'),  7);
INSERT INTO Obowiazki VALUES(16,'Praca w pralni',TO_DATE('2017/04/30', 'yyyy/mm/dd'),  8);
INSERT INTO Obowiazki VALUES(17,'Praca w pralni',TO_DATE('2017/04/30', 'yyyy/mm/dd'),  8);
INSERT INTO Obowiazki VALUES(18,'Praca w bibliotece',TO_DATE('2020/04/30', 'yyyy/mm/dd'),  9);
INSERT INTO Obowiazki VALUES(19,'Nadzor nad wiezniami',TO_DATE('2020/02/25', 'yyyy/mm/dd'),  3);
INSERT INTO Obowiazki VALUES(22,'Praca biurowa',TO_DATE('2017/02/12', 'yyyy/mm/dd'),   15);
INSERT INTO Obowiazki VALUES(23,'Praca biurowa',TO_DATE('2017/02/12', 'yyyy/mm/dd'),   15);
INSERT INTO Obowiazki VALUES(24,'Prowadzenie ksiegowosci',TO_DATE('2017/02/12', 'yyyy/mm/dd'),   12);
INSERT INTO Obowiazki VALUES(25,'Obowiazki dyrektorskiei',TO_DATE('2017/02/12', 'yyyy/mm/dd'),   14);




--------ZAOPATRZENIE---------
INSERT INTO Zaopatrzenie VALUES(1,'Artukuly biurowe','Papiertex sp. z.o.o','w zapasie',6);
INSERT INTO Zaopatrzenie VALUES(2,'Artukuly biurowe','Papiertex sp. z.o.o','w zapasie',12);
INSERT INTO Zaopatrzenie VALUES(3,'Artukuly biurowe','Papiertex sp. z.o.o','w zapasie',14);
INSERT INTO Zaopatrzenie VALUES(4,'Artukuly biurowe','Papiertex sp. z.o.o','w zapasie',15);
INSERT INTO Zaopatrzenie VALUES(5,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(6,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',2);
INSERT INTO Zaopatrzenie VALUES(7,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',3);
INSERT INTO Zaopatrzenie VALUES(8,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',13);
INSERT INTO Zaopatrzenie VALUES(9,'Ksiazki','Ksiegarnia Nietzsche','brak',9);
INSERT INTO Zaopatrzenie VALUES(10,'Narzedzia','OBI','w zapasie',5);
INSERT INTO Zaopatrzenie VALUES(11,'Artykuly chemiczne','Supermarket Jula','w zapasie',8);
INSERT INTO Zaopatrzenie VALUES(12,'Wyposazenie medyczne','Sklep medyczny','brak',6);
INSERT INTO Zaopatrzenie VALUES(13,'Artykuly chemiczne','Supermarket Jula','w zapasie',8);
INSERT INTO Zaopatrzenie VALUES(14,'Ubrania','Szwalnia Mariola i sp?lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(15,'Ubrania','Szwalnia Mariola i sp?lka','brak',2);
INSERT INTO Zaopatrzenie VALUES(16,'Ubrania','Szwalnia Mariola i sp?lka','brak',3);
INSERT INTO Zaopatrzenie VALUES(17,'Ubrania','Szwalnia Mariola i sp?lka','w zapasie',14);
INSERT INTO Zaopatrzenie VALUES(18,'Posciel','Szwalnia Mariola i sp?lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(19,'Posciel','Szwalnia Mariola i sp?lka','w zapasie',2);
INSERT INTO Zaopatrzenie VALUES(20,'Posciel','Szwalnia Mariola i sp?lka','w zapasie',3);
INSERT INTO Zaopatrzenie VALUES(21,'Artykuly higieny osobistej','Supermarket Tesco','w zapasie',10);
INSERT INTO Zaopatrzenie VALUES(22,'Artykuly higieny osobistej','Supermarket Tesco','w zapasie',11);


-----------PRACOWNICY---------
INSERT INTO Pracownicy VALUES(1,'Adam','Nowak','54020103040',30,'Kielce Warszawska 3',6000,48,731283480,14,25);
INSERT INTO Pracownicy VALUES(2,'Marek','Tomaszewski','67011103042',40,'Kielce Jagiellonska 32',2500,30,731324542,1,1);
INSERT INTO Pracownicy VALUES(3,'Tomek','Adamczyk','54020103043',23,'Kielce Niska 23',4600,30,731345394,2,2);
INSERT INTO Pracownicy VALUES(4,'Michal','Nowak','58020103044',43,'Kielce Slaska 31',4300,25,731283482,2,3);
INSERT INTO Pracownicy VALUES(5,'Mateusz','Kowal','58020103045',29,'Ostrowiec Kielecka 1',4200,10,731456482,3,4);
INSERT INTO Pracownicy VALUES(6,'Adam','Nowakowski','58020103046',54,'Busko-Zdr?j Rynek 5',3800,21,731283482,3,5);
INSERT INTO Pracownicy VALUES(7,'Wojtek','Kowalski','58020103047',34,'Kielce Jagiellonska 6',4000,12,723283482,5,10);
INSERT INTO Pracownicy VALUES(8,'Lukasz','Nowaczek','58020103048',64,'Bodzentyn Rynek 32',2000,36,731284562,6,11);
INSERT INTO Pracownicy VALUES(9,'Michal','Zapalka','58020103049',23,'Kielce Starodomaszowska 3',1900,21,731283422,6,12);
INSERT INTO Pracownicy VALUES(10,'Grzegorz','Shmit','58020103012',54,'Kielce Zabia 12',5400,30,731265482,7,12);
INSERT INTO Pracownicy VALUES(11,'Marcin','Cichy','58020103022',25,'Nowa Slupia Rynek 22',5000,12,721248582,1,19);
INSERT INTO Pracownicy VALUES(12,'Adam','Kowalewski','58020103032',43,'Kielce Zagnanska 1',5300,3,731285882,9,18);
INSERT INTO Pracownicy VALUES(13,'Aneta','Kowalewska','58020103042',37,'Kielce Zagnanska 1',3400,10,711256982,12,24);
INSERT INTO Pracownicy VALUES(14,'Martyna','Warczynska','58020103052',34,'Kielce Swietokrzyska 11',4000,40,751238482,15,22);
INSERT INTO Pracownicy VALUES(15,'Dominika','Jakowiak','58020103062',36,'Mielec Rzeszowska 12',3000,12,'',15,23);

----------GRUPA-------------
 INSERT INTO Grupa VALUES(1,'Podstawowa','Osadzeni za drobne przestepstwa. Moga przebywac w celach wieloosobowych',1);
 INSERT INTO Grupa VALUES(2,'Podstawowa','Osadzeni za drobne przestepstwa. Moga przebywac w celach wieloosobowych',2);
 INSERT INTO Grupa VALUES(3,'Podstawowa','Osadzeni za drobne przestepstwa. Moga przebywac w celach wieloosobowych',3);
 INSERT INTO Grupa VALUES(4,'Podstawowa','Osadzeni za drobne przestepstwa. Moga przebywac w celach wieloosobowych',4);
 INSERT INTO Grupa VALUES(5,'Podstawowa','Osadzeni za drobne przestepstwa. Moga przebywac w celach wieloosobowych',5);

 INSERT INTO Grupa VALUES(6,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',6);
 INSERT INTO Grupa VALUES(7,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',7);
 INSERT INTO Grupa VALUES(8,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',8);
 INSERT INTO Grupa VALUES(9,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',9);
 INSERT INTO Grupa VALUES(10,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',10);
 INSERT INTO Grupa VALUES(11,'O zaostrzonym rygorze','Osadzeni za powazniejsze przestepstwa. Moga przebywac w celach max 2 osobowych',11);

 INSERT INTO Grupa VALUES(12,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',12);
 INSERT INTO Grupa VALUES(13,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',13);
 INSERT INTO Grupa VALUES(14,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',14);
 INSERT INTO Grupa VALUES(15,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',15);
 INSERT INTO Grupa VALUES(16,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',16);
 INSERT INTO Grupa VALUES(17,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',17);
 INSERT INTO Grupa VALUES(18,'Izolatka','Osadzeni za najpowazniejsze przestepstwa',18);

 --3 ost id wyroku, id grupy, id listy
-----------WIEZNIOWIE------------
INSERT INTO Wiezniowie VALUES(1,'Michal','Agatowski','91123148484',24,13,1,1,6);
INSERT INTO Wiezniowie VALUES(2,'Michal','Agatowski','91123148384',34,4,1,2,7);
INSERT INTO Wiezniowie VALUES(3,'Marek','Agatowski','93123148544',23,14,1,3,8);
INSERT INTO Wiezniowie VALUES(4,'Tomek','Tomaszewski','95123146484',53,15,1,4,9);
INSERT INTO Wiezniowie VALUES(5,'Mateusz','Morawski','94123148474',46,1,1,5,13);
INSERT INTO Wiezniowie VALUES(6,'Mateusz','Wronski','96123134474',65,2,1,6,14);
INSERT INTO Wiezniowie VALUES(7,'Grzegorz','Morawski','92123144574',23,3,3,7,NULL);
INSERT INTO Wiezniowie VALUES(8,'Antoni','Adamski','91123133374',61,5,1,8,15);
INSERT INTO Wiezniowie VALUES(9,'Robert','Kowalski','93123328474',18,6,3,9,16);
INSERT INTO Wiezniowie VALUES(10,'Adam','Kowalski','81123328342',56,7,3,10,NULL);
INSERT INTO Wiezniowie VALUES(11,'Mariusz','Kowalski','83123328474',34,9,1,11,17);
INSERT INTO Wiezniowie VALUES(12,'Tomek','Kowalski','93121238474',43,10,2,12,NULL);
INSERT INTO Wiezniowie VALUES(13,'Tomek','Kowalski','93122328574',56,11,1,13,NULL);
INSERT INTO Wiezniowie VALUES(14,'Tomek','Kowalski','93122323474',12,8,1,14,NULL);
INSERT INTO Wiezniowie VALUES(15,'Tomek','Kowalski','93122328474',43,12,1,15,NULL);

--wypelnia tabele archiwum wiezniow gdy jakiegos usuniemy z bazy
--odpali sie przy usunieciu wieznia warto to dac na sama gore
CREATE OR REPLACE TRIGGER dodaj_do_archiwum                                  ---dodaj wyzwalacz
BEFORE DELETE ON Wiezniowie                                                  ---uruchamia sie w chwili usuwania z tabeli wiezniowie ale przed sama operacja
FOR EACH ROW                                                                 ---uruchamia sie dla kazdej usunietej kolumny z osobna
BEGIN
    INSERT INTO Archiwum_wiezniow(imie, nazwisko, pesel, data_wyjscia)       ---wprowadz do tabeli archiwum_wiezniow
    VALUES (:OLD.imie, :OLD.nazwisko, :OLD.pesel, SYSDATE);                  ---stare wartosci z usunietego imie, nazwisko, pesel, aktualna date i czas
END;
/

--usuwanie
DELETE FROM wiezniowie WHERE id_wieznia=1;
--wyswietl archiwum
select * FROM archiwum_wiezniow;


--widok dyrektora widzi pracowników I ich obowiazki
drop view Dyrektor_w;

create VIEW Dyrektor_w AS
Select p.id_pracownika, p.imie, p.nazwisko, p.pesel, p.adres, p.staz_msc, p.telefon, o.opis_obowiazku, o.data_zakonczenia, o.id_oddzialu
from Pracownicy p
LEFT JOIN Obowiazki o ON p.id_obowiazku=o.id_obowiazku;

select * from Dyrektor_w;


drop view Straznik_w;

create view Straznik_w AS
Select w.id_wieznia, w.imie, w.nazwisko, w.pesel, g.id_grupy AS Id_grupy_wieziennej, c.*, d.id_wyroku, d.opis_wyroku
from Wiezniowie w
LEFT JOIN Grupa g ON w.id_grupy=g.id_grupy
LEFT JOIN Cele c ON g.id_celi=c.id_celi
LEFT JOIN Wyroki d ON w.id_wyroku=d.id_wyroku
ORDER BY id_wieznia ASC;
select * from Straznik_w;

drop view Zaopatrzenie_w;


create view Zaopatrzenie_w AS
Select z.rodzaj_zaopatrzenia, z.nazwa_dostawcy, z.stan_biezacy, z.id_oddzialu, o.nazwa_oddzialu
from Zaopatrzenie z, Oddzial o WHERE z.stan_biezacy = 'brak' AND z.id_oddzialu = o.id_oddzialu;

select * from Zaopatrzenie_w;

drop view Pracownik_kadr_w;
create view Pracownik_kadr_w AS
Select o.id_obowiazku, o.opis_obowiazku, o.data_zakonczenia, p.imie, p.nazwisko, d.nazwa_oddzialu
from Obowiazki o, Pracownicy p, Oddzial d WHERE o.id_obowiazku = p.id_obowiazku AND o.id_oddzialu=d.id_oddzialu
UNION ALL
SELECT o.id_obowiazku, o.opis_obowiazku, o.data_zakonczenia, w.imie, w.nazwisko, k.nazwa_oddzialu
FROM Obowiazki o, Wiezniowie w, Oddzial k WHERE o.id_obowiazku = w.id_obowiazku AND o.id_oddzialu=k.id_oddzialu
ORDER BY id_obowiazku ASC;


select * from Pracownik_kadr_w;


drop view Recydywa_w;
create view Recydywa_w AS
Select w.id_wieznia, w.imie, w.nazwisko, w.pesel, g.id_grupy AS Id_grupy_wieziennej, d.opis_wyroku, d.data_rozpoczecia, d.data_zakonczenia
from Wiezniowie w, Grupa g, Wyroki d WHERE w.id_grupy=g.id_grupy AND w.id_wyroku=d.id_wyroku AND g.id_grupy = 3;

select * from Recydywa_w;

drop view Dostepne_cele_w;

create view Dostepne_cele_w AS
SELECT COUNT(id_celi) AS Dostepne_cele FROM Cele
WHERE max_ilosc_osob!=akt_ilosc_osob;
select * from Dostepne_cele_w;


--kursor zwieksza pracownikom o obowiazku Nadzor nad wiezniami o stazu >=24ms 500 do pensji
CREATE OR REPLACE PROCEDURE podwyzka_straznikow
IS
CURSOR cur_podwyzka IS
SELECT p.id_pracownika, p.pensja, p.staz_msc, o.opis_obowiazku FROM pracownicy p
left JOIN obowiazki o ON p.id_obowiazku = o.id_obowiazku
WHERE p.staz_msc>24 AND o.opis_obowiazku LIKE 'Nadzor%';


BEGIN
FOR i IN cur_podwyzka
LOOP
UPDATE Pracownicy p SET pensja = pensja+500
WHERE p.id_pracownika=i.id_pracownika;
END LOOP;

END;
/

BEGIN
podwyzka_straznikow;
END;
/




--kursor sprawdza czy pracownik podal numer jesli nie zwraca wyjatek i wyswietla dane tego pracownika
CREATE OR REPLACE PROCEDURE tel_err
IS
CURSOR cur_tel_err IS
SELECT id_pracownika, imie, nazwisko, telefon FROM pracownicy WHERE telefon IS NULL;

tel_null_exc EXCEPTION;
v_imie VARCHAR(50);
v_nazwisko VARCHAR(100);
v_id NUMBER;

BEGIN
FOR i IN cur_tel_err
LOOP

IF(i.telefon IS null) THEN
v_imie := i.imie;
v_nazwisko := i.nazwisko;
v_id := i.id_pracownika;
RAISE tel_null_exc;
END IF;

END LOOP;

EXCEPTION
WHEN tel_null_exc THEN
Dbms_Output.put_line('Pracownik: ' || v_imie || ' ' || v_nazwisko || ' o id=' || v_id || ' nie poda³\a numeru kontaktowego');

END;
/

BEGIN
tel_err;
END;
/





--kursor sprawdza zapelnienie cel, w kazdej z grup jesli wszystkie sa pelne w danej grupie to dodaje nowa cele
--cele z grupy 1 sprawdza w petli po koleji czy cela nie jest pelna jesli jest pelna ustawia 1 jesli znajdzie pusta cele to ustawia 0
--kursor jest z parametrem dzieki temu wystarczy wpisac w parametr id_grupy celi i juz wyszuka nie trzeba osobnego kursora
--dziala tylko przy zapelnionych celach w jednej dwoch lub trzech grupach cel.
CREATE OR REPLACE PROCEDURE czy_pelne
IS
CURSOR cur_czy_pelne(id_oddzialu_arg NUMBER) IS
SELECT max_ilosc_osob AS maxim, akt_ilosc_osob AS akt, id_oddzialu AS id FROM cele WHERE id_oddzialu=id_oddzialu_arg;

czy_wolne NUMBER;
v_id_oddzialu NUMBER;
ilosc_cel NUMBER:=0;

BEGIN
--grupa cel 1
FOR i in cur_czy_pelne(1)
LOOP
  v_id_oddzialu := i.id;

  IF(i.maxim=i.akt) THEN
     czy_wolne:=1;
  ELSE
      czy_wolne:=0;
  END IF;
END LOOP;

IF(czy_wolne=1) THEN
  SELECT Count(id_celi)+1 INTO ilosc_cel FROM Cele;
  Dbms_Output.put_line('Wszystkie cele na oddziale ' || v_id_oddzialu || ' sa pelne. Dodaje jedna cele');
  INSERT INTO Cele(id_celi, max_ilosc_osob, akt_ilosc_osob, id_oddzialu) VALUES(ilosc_cel,5,0,v_id_oddzialu);
ELSE
  Dbms_Output.put_line('Na oddziale ' || v_id_oddzialu || ' sa jeszcze wolne miejsca w celach' );
END IF;

--grupa cel 2
FOR i in cur_czy_pelne(2) --tylko argument sie zmienia i ilosc max osob w celi, w insercie
LOOP
  v_id_oddzialu := i.id;

  IF(i.maxim=i.akt) THEN
     czy_wolne:=1;
  ELSE
      czy_wolne:=0;
  END IF;
END LOOP;

IF(czy_wolne=1) THEN
  SELECT Count(id_celi)+1 INTO ilosc_cel FROM Cele;
  Dbms_Output.put_line('Wszystkie cele na oddziale ' || v_id_oddzialu || ' sa pelne. Dodaje jedna cele');
  INSERT INTO Cele(id_celi, max_ilosc_osob, akt_ilosc_osob, id_oddzialu) VALUES(ilosc_cel,2,0,v_id_oddzialu);
ELSE
  Dbms_Output.put_line('Na oddziale ' || v_id_oddzialu || ' sa jeszcze wolne miejsca w celach' );
END IF;


--grupa cel 3

FOR i in cur_czy_pelne(3)  --tylko argument sie zmienia i ilosc max osob w celi, w insercie
LOOP
  v_id_oddzialu := i.id;

  IF(i.maxim=i.akt) THEN
     czy_wolne:=1;
  ELSE
      czy_wolne:=0;
  END IF;
END LOOP;

IF(czy_wolne=1) THEN
  SELECT Count(id_celi)+1 INTO ilosc_cel FROM Cele;
  Dbms_Output.put_line('Wszystkie cele na oddziale ' || v_id_oddzialu || ' sa pelne. Dodaje jedna cele');
  INSERT INTO Cele(id_celi, max_ilosc_osob, akt_ilosc_osob, id_oddzialu) VALUES(ilosc_cel,1,0,v_id_oddzialu);
ELSE
  Dbms_Output.put_line('Na oddziale ' || v_id_oddzialu || ' sa jeszcze wolne miejsca w celach' );
END IF;


END;
/

BEGIN
czy_pelne;
END;
/



--kursor wszystkim wiezniom ktorzy nie maja obowiazkow i nie sa w izolatce przydzielaja obowiazek pracy w warsztacie
CREATE OR REPLACE PROCEDURE do_pracy
IS
CURSOR cur_do_pracy is
SELECT w.id_wieznia, w.id_grupy, w.id_obowiazku FROM Wiezniowie w WHERE w.id_obowiazku IS NULL AND id_grupy<3;

BEGIN
FOR i IN cur_do_pracy
LOOP
UPDATE Wiezniowie w SET id_obowiazku = 13 WHERE w.id_wieznia=i.id_wieznia;
END LOOP;
END;
/

BEGIN
do_pracy;
END;
/






