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
Dbms_Output.put_line('Pracownik: ' || v_imie || ' ' || v_nazwisko || ' o id=' || v_id || ' nie podał\a numeru kontaktowego');

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


