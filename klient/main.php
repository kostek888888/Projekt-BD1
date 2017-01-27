<?php

$zapytania = array(
  0 => "SELECT * FROM Lista",
  1 => "SELECT * FROM Przywileje_kary",
  2 => "SELECT * FROM Wyroki",
  3 => "SELECT * FROM Oddzial",
  4 => "SELECT * FROM Cele",
  5 => "SELECT * FROM Obowiazki",
  6 => "SELECT * FROM Zaopatrzenie",
  7 => "SELECT * FROM Pracownicy",
  8 => "SELECT * FROM Grupa",
  9 => "SELECT * FROM Wiezniowie",
  10 => "SELECT * FROM Dyrektor_w",
  11 => "SELECT * FROM Straznik_w",
  12 => "SELECT * FROM Zaopatrzenie_w",
  13 => "SELECT * FROM Pracownik_kadr_w",
  14 => "SELECT * FROM Recydywa_w",
  15 => "SELECT * FROM Dostepne_cele_w",
);

$queryColumns = array(
  0 => "ID_LISTY,NAZWA,OPIS",
  1 => "ID_PRZYW_KAR,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,ID_LISTY,ID_WIEZNIA",
  2 => "ID_WYROKU,OPIS_WYROKU,OPIS_WYROKU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA",
  3 => "ID_ODDZIALU,NAZWA_ODDZIALU",
  4 => "ID_CELI,MAX_ILOSC_OSOB,AKT_ILOSC_OSOB,ID_ODDZIALU",
  5 => "ID_OBOWIAZKU,OPIS_OBOWIAZKU,DATA_ZAKONCZENIA,ID_ODDZIALU",
  6 => "ID_ZAOPATRZENIA,RODZAJ_ZAOPATRZENIA,NAZWA_DOSTAWCY,STAN_BIEZACY,ID_ODDZIALU",
  7 => "ID_PRACOWNIKA,IMIE,NAZWISKO,PESEL,WIEK,ADRES,PENSJA,STAZ_MSC,TELEFON,ID_ODDZIALU,ID_OBOWIAZKU",
  8 => "ID_GRUPY,NAZWA_GRUPY,OPIS_GRUPY,ID_CELI",
  9 => "ID_WIEZNIA,IMIE,NAZWISKO,PESEL,WIEK,ID_WYROKU,ID_GRUPY,ID_NAGROD_KAR,ID_OBOWIAZKU",
  10 => "ID_PRACOWNIKA,IMIE,NAZWISKO,PESEL,ADRES,STAZ_MSC,TELEFON",
  11 => "ID_WIEZNIA,IMIE,NAZWISKO,PESEL,ID_GRUPY_WIEZIENNEJ,ID_CELI,MAX_ILOSC_OSOB,AKT_ILOSC_OSOB,ID_ODDZIALU,ID_WYROKU,OPIS_WYROKU,OPIS_WYROKU",
  12 => "RODZAJ_ZAOPATRZENIA,NAZWA_DOSTAWCY,STAN_BIEZACY,ID_ODDZIALU,NAZWA_ODDZIALU",
  13 => "ID_OBOWIAZKU,OPIS_OBOWIAZKU,DATA_ZAKONCZENIA,IMIE,NAZWISKO,NAZWA_ODDZIALU",
  14 => "ID_WIEZNIA,IMIE,NAZWISKO,PESEL,ID_GRUPY_WIEZIENNEJ,OPIS_WYROKU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA",
  15 => "DOSTEPNE_CELE",
);





class dataBase{
    public $connection,$queryResult,$qquery, $rowCount;
    private $dbhost, $dbuser, $dbpassword, $dbname;

    //Constructor, defining default values when making a new object.
    public function __construct($dbhost,$dbuser, $dbpassword, $dbname) {
        $this->dbhost = $dbhost;
        $this->dbuser = $dbuser;
        $this->dbpassword = $dbpassword;
        $this->dbname = $dbname;
    }

    //Open connect to database
    public function connect(){
      $this->connection = new PDO('oci:dbname='.$this->dbhost.'/'.$this->dbname, $this->dbuser, $this->dbpassword);

    }

    // Function sending a query to database.
    public function dbQuery($query){
      $this->connection->query($query);
      echo "Zapytanie \"".$query."\" zostalo wyslane do bazy danych.";

      }
    // Function prints results of query, in parameter put all columns splitted by comma you want to print. (e.g "column1,column2,column3)

  public function printQueryResult($content, $qquery){
    $queryResult = $this->connection->query($qquery);
    $result = $this->connection->query($qquery)->fetchAll();
    $rowCount = $this->connection->query($qquery)->fetchColumn();
    if($rowCount==0)
      echo "Brak rekordow do wypisania.";
      else {
        foreach ($result as $row) {
          echo '<br />';

            $contentSplited = explode( ",",$content);
            $wordCount = sizeof($contentSplited);
            for($j = 0; $j < $wordCount; $j++ ){
              if($j === 0)
                echo "<p>";
              if($j === $wordCount)
                echo "</p>";
              echo $contentSplited[$j].": ".$row[$contentSplited[$j]]." ";
            }

        }
      }

  }
};




?>
