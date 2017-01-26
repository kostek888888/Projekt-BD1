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
INSERT INTO Lista VALUES(9,'Wyb�r rodzaju posilku','');
INSERT INTO Lista VALUES(10,'Widzemie z adwokatem','');
INSERT INTO Lista VALUES(11,'Zakaz pracy','');
INSERT INTO Lista VALUES(12,'Przywilej pracy','Przysluguje na wejsciu');
INSERT INTO Lista VALUES(13,'Uczestniczenie w grach zespolowych','Niedostepne dla wiezni�w z powaznymi i bardzo powaznymi wykroczeniami');
INSERT INTO Lista VALUES(14,'Wczesniejsze zwolnienie','Za bardzo dobre sprawowanie');
INSERT INTO Lista VALUES(15,'Prawo do ubiegania sie o zmiane cel','Niedostepne dla wiezni�w z powaznymi i bardzo powaznymi wykroczeniami');



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
INSERT INTO Wyroki VALUES(12,'Posiadanie narkotyk�w',      TO_DATE('2017/01/13', 'yyyy/mm/dd'),      TO_DATE('2018/05/13', 'yyyy/mm/dd'));
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
INSERT INTO Oddzial VALUES(10,'Lazienka dla wiezni�w');
INSERT INTO Oddzial VALUES(11,'Lazienka dla pracownik�w');
INSERT INTO Oddzial VALUES(12,'Rachunkowosc');
INSERT INTO Oddzial VALUES(13,'Pokoje personelu');
INSERT INTO Oddzial VALUES(14,'Gabinet dyrektora');
INSERT INTO Oddzial VALUES(15,'Biuro pracownik�w');



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
INSERT INTO Zaopatrzenie VALUES(14,'Ubrania','Szwalnia Mariola i sp�lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(15,'Ubrania','Szwalnia Mariola i sp�lka','brak',2);
INSERT INTO Zaopatrzenie VALUES(16,'Ubrania','Szwalnia Mariola i sp�lka','brak',3);
INSERT INTO Zaopatrzenie VALUES(17,'Ubrania','Szwalnia Mariola i sp�lka','w zapasie',14);
INSERT INTO Zaopatrzenie VALUES(18,'Posciel','Szwalnia Mariola i sp�lka','w zapasie',1);
INSERT INTO Zaopatrzenie VALUES(19,'Posciel','Szwalnia Mariola i sp�lka','w zapasie',2);
INSERT INTO Zaopatrzenie VALUES(20,'Posciel','Szwalnia Mariola i sp�lka','w zapasie',3);
INSERT INTO Zaopatrzenie VALUES(21,'Artykuly higieny osobistej','Supermarket Tesco','w zapasie',10);
INSERT INTO Zaopatrzenie VALUES(22,'Artykuly higieny osobistej','Supermarket Tesco','w zapasie',11);


-----------PRACOWNICY---------
INSERT INTO Pracownicy VALUES(1,'Adam','Nowak','54020103040',30,'Kielce Warszawska 3',6000,48,731283480,14,25);            
INSERT INTO Pracownicy VALUES(2,'Marek','Tomaszewski','67011103042',40,'Kielce Jagiellonska 32',2500,30,731324542,1,1);
INSERT INTO Pracownicy VALUES(3,'Tomek','Adamczyk','54020103043',23,'Kielce Niska 23',4600,30,731345394,2,2);
INSERT INTO Pracownicy VALUES(4,'Michal','Nowak','58020103044',43,'Kielce Slaska 31',4300,25,731283482,2,3);
INSERT INTO Pracownicy VALUES(5,'Mateusz','Kowal','58020103045',29,'Ostrowiec Kielecka 1',4200,10,731456482,3,4);
INSERT INTO Pracownicy VALUES(6,'Adam','Nowakowski','58020103046',54,'Busko-Zdr�j Rynek 5',3800,21,731283482,3,5);
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
