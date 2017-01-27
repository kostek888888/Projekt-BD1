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
        </div>


        <div class="content">
          <form class="widok" action="selectTable.php" method="get">
            Widoki:
            <button class="content-btn" name="tabela" type="submit" value="10">
              Widok dyrektora
            </button>
            <button class="content-btn" name="tabela" type="submit" value="11">
              Widok straznika
            </button>
            <button class="content-btn" name="tabela" type="submit" value="12">
              Widok zaopatrzeniowca
            </button>
            <button class="content-btn" name="tabela" type="submit" value="13">
              Widok pracownika kadr
            </button>
            <button class="content-btn" name="tabela" type="submit" value="14">
              Widok recydywistów
            </button>
            <button class="content-btn" name="tabela" type="submit" value="15">
              Widok dostępnych cel
            </button>
          </form>

        </div>
    </body>
</html>
