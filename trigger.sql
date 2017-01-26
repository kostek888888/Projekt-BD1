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

