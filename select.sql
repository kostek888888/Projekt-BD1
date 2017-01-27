SET serveroutput ON
--funkcja wyliczajaca wiek z peselu



CREATE OR REPLACE FUNCTION wylicz_wiek(pesel IN char)
RETURN NUMBER
IS
tmp INTEGER;
tmp_stulecia NUMBER;
rok NUMBER;
miesiac NUMBER;
dzien NUMBER;
rok_z_pesel DATE;
data_varchar2 VARCHAR2(40);

BEGIN
--rok
tmp := SubStr(pesel,1,2);

IF(SubStr(pesel,3,1)<=1) THEN
  rok := 1900+tmp;
END IF;

IF (SubStr(pesel,3,1)>=2) THEN
  rok := 2000+tmp;
END IF;

--Dbms_Output.put_line('rok' ||rok);
--miesiac

IF(SubStr(pesel,3,1)=0 OR SubStr(pesel,3,1)=2)  THEN
  miesiac := SubStr(pesel,4,1); 
  --Dbms_Output.put_line('miesiac ' || miesiac); 
ELSIF (SubStr(pesel,3,1)=1 OR SubStr(pesel,3,1)=3)  THEN
   miesiac := SubStr(pesel,4,1)+10; 
  --Dbms_Output.put_line('miesiac ' || miesiac);
END IF;

--dzien 
dzien := SubStr(pesel,5,2);
      
 --tu sie jebieee
data_varchar2:=To_Char(rok) + '/' + To_Char(miesiac) + '/' +  To_Char(dzien);
Dbms_Output.put_line('rok' ||data_varchar2);
rok_z_pesel:=TO_DATE('2017/05/03', 'yyyy/mm/dd');

        
RETURN null;
END;
/




DECLARE
pesel char(11) :='95020105' ;
wiek NUMBER(3);
BEGIN 
wiek:=wylicz_wiek(pesel);
END;
/




--więźniowie z wyrokami i opisem wyroku którzy mają mniej niż 30 lat i popełnili najwyższą zbrodnię (grupa wiezienna 3)
SELECT w.id_wieznia, w.imie, w.nazwisko, w.pesel,



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


