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
id_oddzialu number not null,
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
adres  VARCHAR2(100) NOT NULL,
pensja NUMBER NOT NULL,
staz_msc Number NOT NULL,
telefon VARCHAR2(11) NOT NULL,
id_oddzialu NUMBER,
CONSTRAINT  pracownik_oddzial_fk FOREIGN KEY (id_oddzialu) REFERENCES Oddzial(id_oddzialu)
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
id_wyroku NUMBER NOT NULL,
id_grupy NUMBER NOT NULL,
id_nagrod_kar NUMBER NOT NULL,
CONSTRAINT wiezniowie_wyroki_fk FOREIGN KEY (id_wyroku) REFERENCES Wyroki(id_wyroku),
CONSTRAINT wiezniowie_grupa_fk FOREIGN KEY (id_grupy) REFERENCES Grupa(id_grupy),
CONSTRAINT wiezniowie_nagrodyKary_fk FOREIGN KEY(id_nagrod_kar) REFERENCES Przywileje_kary(id_przyw_kar)
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

--trzeba dopisac
-----LISTA-----------
INSERT INTO Lista VALUES(1,'Prawo do spaceru','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(2,'Przepustka jednodniowa','Tylko za wyjatowo dobre zachowanie, tylko dla osadzonych za drobne przestepstwa');
INSERT INTO Lista VALUES(3,'Widzenie z rodzia','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(4,'Izolatka','');
INSERT INTO Lista VALUES(5,'Tygodniowa izolatka','Gdy izolatka nie odnosi skutku');
INSERT INTO Lista VALUES(6,'Prawo do spaceru','');
INSERT INTO Lista VALUES(7,'Prawo do spaceru','');
INSERT INTO Lista VALUES(8,'Prawo do spaceru','');
INSERT INTO Lista VALUES(9,'Prawo do spaceru','');
INSERT INTO Lista VALUES(10,'Prawo do spaceru','');
INSERT INTO Lista VALUES(11,'Prawo do spaceru','');
INSERT INTO Lista VALUES(12,'Prawo do spaceru','');
INSERT INTO Lista VALUES(13,'Prawo do spaceru','');
INSERT INTO Lista VALUES(14,'Prawo do spaceru','');
INSERT INTO Lista VALUES(15,'Prawo do spaceru','');


---zmienic daty ew
-----PRZZYWILEJE KARY-------
INSERT INTO Przywileje_kary values(1,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   1,1);
INSERT INTO Przywileje_kary values(2,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   1,2);
INSERT INTO Przywileje_kary values(3,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,3);
INSERT INTO Przywileje_kary values(4,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,4);
INSERT INTO Przywileje_kary values(5,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,5);
INSERT INTO Przywileje_kary values(6,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,6);
INSERT INTO Przywileje_kary values(7,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,7);
INSERT INTO Przywileje_kary values(8,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,8);
INSERT INTO Przywileje_kary values(9,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   1,9);
INSERT INTO Przywileje_kary values(10,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,9);
INSERT INTO Przywileje_kary values(11,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,10);
INSERT INTO Przywileje_kary values(12,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,11);
INSERT INTO Przywileje_kary values(13,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,12);
INSERT INTO Przywileje_kary values(14,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,13);
INSERT INTO Przywileje_kary values(15,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,14);
INSERT INTO Przywileje_kary values(16,  TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01'),   3,15);



----------WYROKI------------
INSERT INTO Wyroki VALUES(1,'Rozboje',      TO_DATE('2017/01/01', 'yyyy/mm/dd'),      TO_DATE('2019/05/01', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(2,'Kradziez',      TO_DATE('2017/01/02', 'yyyy/mm/dd'),      TO_DATE('2019/05/02', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(3,'Zabojstwo',      TO_DATE('2000/02/03', 'yyyy/mm/dd'),      TO_DATE('2020/02/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(4,'Niszczenie mienia',      TO_DATE('2017/01/04', 'yyyy/mm/dd'),      TO_DATE('2017/04/04', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(5,'Rabunek',      TO_DATE('2016/05/05', 'yyyy/mm/dd'),      TO_DATE('2017/05/05', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(6,'Wymuszenia z bronia i zaobijstwo',      TO_DATE('2010/07/03', 'yyyy/mm/dd'),      TO_DATE('2030/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(7,'Gwalt',      TO_DATE('2012/01/06', 'yyyy/mm/dd'),      TO_DATE('2027/05/06', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(8,'Pedofilia',      TO_DATE('2000/05/07', 'yyyy/mm/dd'),      TO_DATE('2030/05/07', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(9,'Kradzież',      TO_DATE('2017/05/08', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(10,'Napad na bank',      TO_DATE('2017/05/09', 'yyyy/mm/dd'),      TO_DATE('2020/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(11,'Rozboje',      TO_DATE('2017/05/13', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(12,'Posiadanie narkotyk?w',      TO_DATE('2017/01/13', 'yyyy/mm/dd'),      TO_DATE('2018/05/13', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(13,'Rabunek',      TO_DATE('2005/05/17', 'yyyy/mm/dd'),      TO_DATE('2006/08/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(14,'Rozboje',      TO_DATE('2017/05/15', 'yyyy/mm/dd'),      TO_DATE('2018/04/03', 'yyyy/mm/dd'));
INSERT INTO Wyroki VALUES(15,'Rozboje',      TO_DATE('2017/05/23', 'yyyy/mm/dd'),      TO_DATE('2018/05/03', 'yyyy/mm/dd'));


---------CELE------------
--5os
INSERT INTO Cele VALUES(1,5,5,1);
INSERT INTO Cele VALUES(2,5,4,1);
INSERT INTO Cele VALUES(3,5,0,1);
INSERT INTO Cele VALUES(4,5,0,1);
INSERT INTO Cele VALUES(5,5,0,1);
--2os
INSERT INTO Cele VALUES(6,2,2,2);
INSERT INTO Cele VALUES(7,2,1,2);
INSERT INTO Cele VALUES(8,2,0,2);
INSERT INTO Cele VALUES(9,2,0,2);
INSERT INTO Cele VALUES(10,2,0,2);
INSERT INTO Cele VALUES(11,2,0,2);
--1os
INSERT INTO Cele VALUES(12,1,1,3);
INSERT INTO Cele VALUES(13,1,1,3);
INSERT INTO Cele VALUES(14,1,1,3);
INSERT INTO Cele VALUES(15,1,0,3);
INSERT INTO Cele VALUES(16,1,0,3);
INSERT INTO Cele VALUES(17,1,0,3);
INSERT INTO Cele VALUES(18,1,0,3);




--------OBOWIAZKI----------
INSERT INTO Obowiazki VALUES(1,'Nadzor nad wiezniami',TO_DATE('2017/05/03', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(2,'Nadzor nad wiezniami',TO_DATE('2018/07/14', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(3,'Nadzor nad wiezniami',TO_DATE('2017/12/31', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(4,'Nadzor nad wiezniami',TO_DATE('2019/01/01', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(5,'Nadzor nad wiezniami',TO_DATE('2020/02/25', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(6,'Sprzatanie',TO_DATE('2017/03/31', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(7,'Sprzatanie',TO_DATE('2017/02/12', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(8,'Praca w kuchni',TO_DATE('2017/02/21', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(9,'Praca w kuchni',TO_DATE('2017/02/20', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(10,'Zarzadanie dostawami',TO_DATE('2020/12/31', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(11,'Opieka medyczna',TO_DATE('2019/12/31', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(12,'Opieka medyczna',TO_DATE('2019/12/31', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(13,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(14,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(15,'Praca w warsztacie',TO_DATE('2017/06/30', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(16,'Praca w pralni',TO_DATE('2017/04/30', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(17,'Praca w pralni',TO_DATE('2017/04/30', 'yyyy/mm/dd'));
INSERT INTO Obowiazki VALUES(18,'Praca w bibliotece',TO_DATE('2020/04/30', 'yyyy/mm/dd'));


        --2ost obowiazki i cele za duzo tu tego bedzie trzeba cos rozbic chyba
--------ODDZIAL------------
INSERT INTO Oddzial VALUES(1,'Blok wiezienny: Normalny');




--- id oddzialu takie samo
--------ZAOPATRZENIE---------
INSERT INTO Zaopatrzenie VALUES(1,'Artukuly biurowe','Papiertex sp. z.o.o','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(2,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(3,'Zywnosc','Farma ekologiczna "Kogucik"','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(4,'Ksiazki','Ksiegarnia Nietzsche','brak',1);
INSERT INTO Zaopatrzenie VALUES(5,'Narzedzia','OBI','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(6,'Narzedzia','OBI','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(7,'Narzedzia','OBI','brak',1);
INSERT INTO Zaopatrzenie VALUES(8,'Artykuly chemiczne','Supermarket Jula','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(9,'Wyposazenie medyczne','Sklep medyczny','brak',1);
INSERT INTO Zaopatrzenie VALUES(10,'Artykuly chemiczne','Supermarket Jula','brak',1);
INSERT INTO Zaopatrzenie VALUES(11,'Ubrania','Szwalnia Mariola i sp?lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(12,'Posciel','Szwalnia Mariola i sp?lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(13,'Posciel','Szwalnia Mariola i sp?lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(14,'Ubrania','Szwalnia Mariola i sp?lka','brak',1);
INSERT INTO Zaopatrzenie VALUES(15,'Artykuly higieny osobistej','Supermarket Tesco','w zapasie',1);


--id oddzialu takie samo
-----------PRACOWNICY---------
INSERT INTO Pracownicy VALUES(1,'Adam','Nowak','54020103040','Kielce Warszawska 3',6000,48,731283480,1);
INSERT INTO Pracownicy VALUES(2,'Marek','Tomaszewski','67011103042','Kielce Jagiellonska 32',2500,12,731324542,1);
INSERT INTO Pracownicy VALUES(3,'Tomek','Adamczyk','54020103043','Kielce Niska 23',4600,6,731345394,1);
INSERT INTO Pracownicy VALUES(4,'Michal','Nowak','58020103044','Kielce Slaska 31',4300,12,731283482,1);
INSERT INTO Pracownicy VALUES(5,'AMateusz','Kowal','58020103045','Ostrowiec Kielecka 1',4200,10,731456482,1);
INSERT INTO Pracownicy VALUES(6,'Adam','Nowakowski','58020103046','Busko-Zdr?j Rynek 5',3800,21,731283482,1);
INSERT INTO Pracownicy VALUES(7,'Wojtek','Kowalski','58020103047','Kielce Jagiellonska 6',4000,12,723283482,1);
INSERT INTO Pracownicy VALUES(8,'Lukasz','Nowaczek','58020103048','Bodzentyn Rynek 32',2000,36,731284562,1);
INSERT INTO Pracownicy VALUES(9,'Michal','Zapalka','58020103049','Kielce Starodomaszowska 3',21,1900,731283422,1);
INSERT INTO Pracownicy VALUES(10,'Grzegorz','Shmit','58020103012','Kielce Zabia 12',5400,30,731265482,1);
INSERT INTO Pracownicy VALUES(11,'Marcin','Cichy','58020103022','Nowa Slupia Rynek 22',5000,12,721248582,1);
INSERT INTO Pracownicy VALUES(12,'Adam','Kowalewski','58020103032','Kielce Zagnanska 1',5300,3,731285882,1);
INSERT INTO Pracownicy VALUES(13,'Aneta','Kowalewska','58020103042','Kielce Zagnanska 1',3400,10,711256982,1);
INSERT INTO Pracownicy VALUES(14,'Martyna','Warczynska','58020103052','Kielce Swietokrzyska 11',40,4000,751238482,1);
INSERT INTO Pracownicy VALUES(15,'Dominika','Jakowiak','58020103062','Mielec Rzeszowska 12',3000,12,731283482,1);

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
INSERT INTO Wiezniowie VALUES(1,'Michal','Agatowski','91123148484',13,1,1);
INSERT INTO Wiezniowie VALUES(2,'Michal','Agatowski','91123148384',4,1,2);
INSERT INTO Wiezniowie VALUES(3,'Marek','Agatowski','93123148544',14,1,3);
INSERT INTO Wiezniowie VALUES(4,'Tomek','Tomaszewski','95123146484',15,1,4);
INSERT INTO Wiezniowie VALUES(5,'Mateusz','Morawski','94123148474',1,1,5);
INSERT INTO Wiezniowie VALUES(6,'Mateusz','Wronski','96123134474',2,1,6);
INSERT INTO Wiezniowie VALUES(7,'Grzegorz','Morawski','92123144574',3,3,7);
INSERT INTO Wiezniowie VALUES(8,'Antoni','Adamski','91123133374',5,1,8);
INSERT INTO Wiezniowie VALUES(9,'Robert','Kowalski','93123328474',6,3,9);
INSERT INTO Wiezniowie VALUES(10,'Adam','Kowalski','81123328342',7,3,10);
INSERT INTO Wiezniowie VALUES(11,'Mariusz','Kowalski','83123328474',9,1,11);
INSERT INTO Wiezniowie VALUES(12,'Tomek','Kowalski','93123328474',10,2,12);
INSERT INTO Wiezniowie VALUES(13,'Tomek','Kowalski','93123328474',11,1,13);
INSERT INTO Wiezniowie VALUES(14,'Tomek','Kowalski','93123328474',12,1,14);
INSERT INTO Wiezniowie VALUES(15,'Tomek','Kowalski','93123328474',12,1,15);








                      SELECT * FROM obowiazki;
                      SELECT * FROM cele;
                      SELECT * FROM wyroki;
                      SELECT * FROM pracownicy;
                      SELECT * FROM zaopatrzenie;
                      SELECT * FROM lista WHERE opis LIKE 'Przysluguje%';
                      SELECT * FROM wiezniowie;
                      SELECT * FROM oddzial;
                      SELECT * FROM grupa;
                      SELECT * FROM przywileje_kary;
