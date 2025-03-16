Program PartidosBuenosAires;

const
CANT_PART = 2;

var
x,y,z: integer;
HabCiud, CantCiud, TotalHab: integer;
minHab, maxHab, promedio: real;

begin
    {Inicializar variables en 0}
    HabCiud := 0;
    CantCiud := 0;
    TotalHab := 0;
    x := 0;
    y := 0;
    z :=0;
    minHab := MaxInt;
    maxHab := Low(integer);
    promedio := 0;

    for x := 1 to CANT_PART do
        {Para cada partido...}
        begin
            write('>> Ingrese el numero de ciudades en el partido ', x, ': ');
            readln(CantCiud);
            writeln('');
            {Preguntamos el numero de ciudades y las guardamos en una variable...}
            HabCiud := 0;
            TotalHab :=0;
            promedio := 0;
            {Limpiamos la variable TotalHab y promedio para volver a reutilizarla}
            for y := 1 to CantCiud do
                {Para cada ciudad...}
                begin
                    {Preguntamos cuantos habitantes hay en la ciudad y lo sumamos al total de habitantes}
                    write('>> - [?]: Cuantos habitantes hay en la ciudad ', y, '?: ');
                    readln(HabCiud);
                    writeln('');
                    TotalHab := TotalHab + HabCiud;
                    z := z + TotalHab
                    // writeln('En la ciudad ', y, ' del partido ', x, ' hay ', TotalHab, ' habitantes en el total');
                end;
                {Calculamos el promedio del partido actual y lo informamos}
                promedio := (TotalHab / CantCiud);
                writeln('>> - [->] En el partido ', x, ' hay en promedio ', promedio:2:2, ' habitantes.');
                writeln('');

                if (promedio > maxHab) then maxHab := promedio
                else if (promedio < minHab) then minHab := promedio;
        end;

    // {Ahora calculamos el promedio tomando en cuenta todos los partidos y lo informamos}
    writeln('--------------- * ---------------');
    writeln('');
    writeln('>> - [->] Si tomamos todos los partidos en cuenta, en promedio hay ', (TotalHab/CANT_PART):2:2, ' habitantes por partido.');
    writeln('');
    writeln('>> - [->] La menor cantidad de habitantes encontrada fue de ', minHab:2:2, ' . Y la mayor fue de ', maxHab:2:2, '.');
    writeln('');
    writeln('--------------- * ---------------');

end.