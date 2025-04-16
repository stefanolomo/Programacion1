Program promedioPersonas;

Procedure Promedio(cantidadPersonas: integer);

Var 
    i:   integer;
    edad, suma:   integer;
    promedio:   real;

Begin
    suma := 0;
    For i:= 1 To cantidadPersonas Do
        Begin
            edad := 0;

            writeln('Ingrese la edad de la persona ', i, ': ');
            read(edad);

            suma := suma + edad;
        End;

    promedio := suma / cantidadPersonas;

    writeln('el promedio de las edades es de ', promedio:2:2, ' años.')

End;

var
    max: integer;

Begin
    While (True) Do
        Begin
            writeln('Cuantas edades quiere promediar?: ');
            readln(max);
            Promedio(max);
        End;

End.
