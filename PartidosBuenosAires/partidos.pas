Program PartidosBuenosAires;

const
CANT_PART = 135;

var
x,y: integer;
HabCiud, CantCiud, TotalHab: integer;

begin
    {Inicializar variables en 0}
    HabCiud := 0;
    CantCiud := 0;
    TotalHab := 0;
    x := 0;
    y:= 0;

    for x := 1 to CANT_PART do
        {Para cada partido...}
        begin
            writeln('Ingrese el numero de ciudades en el partido ', x, ': ');
            readln(CantCiud);
            {Preguntamos el numero de ciudades y las guardamos en una variable...}
            for y := 1 to CantCiud do
                {Para cada ciudad...}
                begin
                    {Preguntamos cuantos habitantes hay en la ciudad y lo sumamos al total de habitantes}
                    writeln('Cuantos habitantes hay en la ciudad ', y, '?: ');
                    readln(HabCiud);
                    TotalHab := TotalHab + HabCiud;
                end;
        end;
    {Ahora calculamos la media y lo informamos}
    writeln('En promedio hay ', (TotalHab/CANT_PART):2:2, ' habitantes por partido.')

end.