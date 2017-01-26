<!DOCTYPE html>
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
          <a href="selects.php"><div class="btn-mode">
            Selects
          </div></a>
          <a href="inserts.php"><div class="btn-mode">
            Inserts
          </div></a>
          <a href="drop.php"><div class="btn-mode">
            Drop Table
          </div></a>
          <a href="delete.php"><div class="btn-mode">
            Delete
          </div></a>
        </div>


        <div class="content">
          <form class="widok" action="selectTable.php" method="get">
            Napisz wlasny select:
            <input class="customInput" type="text" name="createInsert" value="INSERT INTO tabela (kolumny) VALUES (wartosci)"><br>
            <button class="content-btn" type="subnit">Wyswietl</button>
          </form>

        </div>
    </body>
</html>
