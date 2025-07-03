Program Ejercicio5;

{ Se desea modelar un nuevo juego que consiste en un tablero de 15 filas por 15 columnas y que se juega de a 2 jugadores. Cada casillero del tablero contiene un número del 0 al 10 y un valor que indica si la celda fue utilizada a lo largo de la partida. }

type
    tipocasillero = 0..10;
    tipofc = 1..15;
    casillero = record
        numero: tipocasillero;
        utilizado: boolean;
    end;

    ptrnodo = ^nodo;
    registronodo = record
        fila: tipofc;
        columna: tipofc;
        numero: tipocasillero;
    end;
    nodo = record
        datos: registronodo;
        sig: ptrnodo;
    end;

    ArrTablero = Array[tipofc, tipofc] of casillero;
    
    tipocaso = 1..3;

{ La partida consiste de 10 rondas donde en cada una de las rondas los 2 jugadores eligen una celda del tablero. Las celdas elegidas en cada ronda se analizan y obtiene un punto el jugador que eligió la celda que contiene el mayor número. En caso de que ambos jugadores hayan, en una ronda, elegido una celda que contiene el mismo número ninguno suma puntos. 

# Casos
    1. Jugadores eligieron diferentes celdas validas
        Se suma 1pt a el jugador con la celda de mayor nro
    2. Jugadores eligieron la misma celda / celdas del mismo valor / o celdas ya usadas
        No suman nada
    3. 1 Jugador eligio una celda que ya fue usada y el otro una valida
        Imprimir perdida de ronda y se suma 1 al que eligio la valida

En caso de que algún jugador seleccione una celda que ya haya sido utilizada a lo largo de la partida, dicho jugador pierde la ronda y se le suma un punto a su oponente. En caso de que en una ronda ambos jugadores seleccionen celdas que ya hayan sido utilizadas a lo largo de la partida, ninguno suma puntos. Se pide:

a. Implemente un módulo que inicialice el tablero de juego. El módulo recibe el tablero y una lista con los valores que va a tener cada celda del tablero. Cada elemento de la lista almacena: fila, columna y número para la celda (0 a 10). Además, cada celda se debe marcar como no utilizada. En caso de que el valor para una celda no venga en la lista, dicha celda se inicializara con el valor 0 (cero).

b. Implemente un módulo que reciba el tablero y simule el juego. Los valores que cada jugador va eligiendo son leídos de teclado. Al finalizar el juego, informar los puntos obtenidos por cada jugador y cuál es el ganador }

procedure InicializarArrTableroCero(var T: ArrTablero);

var
    i, j: integer;

begin
    for i := 1 to 15 do begin
        for j := 1 to 15 do begin
            T[i, j].numero := 0;
            T[i, j].utilizado := False;
        end;
    end;
end;

procedure InicializarTableroConLista(listaval: ptrnodo; var Tablero: ArrTablero);

begin
    InicializarArrTableroCero(Tablero);

    while (listaval <> nil) do begin
        Tablero[listaval^.datos.fila, listaval^.datos.columna].numero := listaval^.datos.numero;

        listaval := listaval^.sig;
    end;
end;

procedure LeerJugadas(var i1, j1, i2, j2: tipofc);

begin
    writeln('>> Jugador 1 <<');
    writeln('Elija la fila: ');
    readln(i1);
    writeln('Elija la columna: ');
    readln(j1);

    writeln('>> Jugador 2 <<');
    writeln('Elija la fila: ');
    readln(i2);
    writeln('Elija la columna: ');
    readln(j2);
end;

function DeterminarCaso(Tablero: ArrTablero; i1, j1, i2, j2: tipofc): tipocaso;

var
    num1, num2: tipocasillero;
    jugada1valida, jugada2valida: boolean;
    caso: tipocaso;

begin
    num1 := Tablero[i1, j1].numero;
    num2 := Tablero[i2, j2].numero;

    jugada1valida := not Tablero[i1, j1].utilizado;
    jugada2valida := not Tablero[i2, j2].utilizado;

    if (not jugada1valida) and jugada2valida then
        caso := 2
    else if (not jugada2valida) and jugada1valida then
        caso := 1
    else if (not jugada1valida) and (not jugada2valida) then
        caso := 3
    else if (i1 = i2) and (j1 = j2) then
        caso := 3
    else if num1 = num2 then
        caso := 3
    else if num1 > num2 then
        caso := 1
    else
        caso := 2;

    { Casos de la funcion:
    1: Gano el jugador 1;
    2: Gano el jugador 2;
    3: No se suma a ninguno }
    DeterminarCaso := caso;
end;

procedure ReportarPuntaje(p1, p2: integer);

begin
    writeln('[REPORTE PUNTAJE] >> Jugador 1: ', p1);
    writeln('[REPORTE PUNTAJE] >> Jugador 2: ', p2);
end;

procedure SimularJuego (var Tablero: ArrTablero);

var
    jugador1fila, jugador1columna, jugador2fila, jugador2columna: tipofc;

{ # Casos
    - Jugadores eligieron diferentes celdas validas
        Se suma 1pt a el jugador con la celda de mayor nro
    - Jugadores eligieron la misma celda / celdas del mismo valor / o celdas ya usadas
        No suman nada
    - 1 Jugador eligio una celda que ya fue usada y el otro una valida
        Imprimir perdida de ronda y se suma 1 al que eligio la valida }

begin
    puntaje1 := 0;
    puntaje2 := 0;

    repeat
        LeerJugadas(jugador1fila, jugador1columna, jugador2fila, jugador2columna);

        caso := DeterminarCaso(Tablero, jugador1fila, jugador1columna, jugador2fila, jugador2columna);

        Tablero[jugador1fila, jugador1columna].utilizado := True;
        Tablero[jugador2fila, jugador2columna].utilizado := True;

        if caso = 1 then begin
            puntaje1 := puntaje1 + 1;
            writeln('[JUEGO] >> El jugador 1 gano la ronda!');
        end else if caso = 2 then begin
            puntaje2 := puntaje2 + 1;
            writeln('[JUEGO] >> El jugador 2 gano la ronda!');
        end else if caso = 3 then
            writeln('[JUEGO] >> La ronda es un empate!');

        writeln('---------------o---------------');
        writeln('Quiere segir jugando? s/n');
        readln(seguir);
    until (seguir = 'n');

    writeln('*************** FIN DE JUEGO ***************');

    ReportarPuntaje(puntaje1, puntaje2);
    if (puntaje1 > puntaje2) then
        writeln('[FIN DE JUEGO] >> El ganador del juego es el jugador 1')
    else if (puntaje2 > puntaje1) then
        writeln('[FIN DE JUEGO] >> El ganador del juego es el jugador 2')
    else
        writeln('[FIN DE JUEGO] >> Los jugadores llegaron a un empate');
end;

begin
end.