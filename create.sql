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
