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

procedure SimularJuego (var Tablero: ArrTablero);

var
    jugador1fila, jugador1columna, jugador2fila, jugador2columna: tipofc;

begin

{ # Casos
    1. Jugadores eligieron diferentes celdas validas
        Se suma 1pt a el jugador con la celda de mayor nro
    2. Jugadores eligieron la misma celda / celdas del mismo valor / o celdas ya usadas
        No suman nada
    3. 1 Jugador eligio una celda que ya fue usada y el otro una valida
        Imprimir perdida de ronda y se suma 1 al que eligio la valida }
    
end;

begin
end.