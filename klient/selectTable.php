<!DOCTYPE html>
<?php
include_once "main.php";

$dataBase = new dataBase("localhost", "SYSTEM", "123456","XE");
$dataBase->connect();

$idZapytania = $_GET['tabela'];
$nazwyKolumn = $_GET['tabela'];

//var_dump($idZapytania);

 ?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>



        <div class="menu">
          <form action="selectTable.php" method="get">
          <button class="menu-btn" name="tabela" type="submit" value="0">
            Lista
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="1">
            Przywileje i kary
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="2">
            Wyroki
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="3">
            Oddziały
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="4">
            Cele
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="5">
            Obowiązki
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="6">
            Zaopatrzenie
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="7">
            Pracownicy
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="8">
            Grupa
          </button>
          <button class="menu-btn" name="tabela" type="submit" value="9">
            Więźniowie
          </button>
          </form>
        </div>
        <div class="mode">
          <a href="index.php"><div class="btn-mode">
            Print table
          </div></a>
          <a href="views.php"><div class="btn-mode">
            Views
          </div></a>
        </div>


        <div class="content">
          <table>
          <?php
            $dataBase->printQueryResult($queryColumns[$idZapytania], $zapytania[$idZapytania]);
           ?>
         </table>
        </div>
    </body>
</html>
