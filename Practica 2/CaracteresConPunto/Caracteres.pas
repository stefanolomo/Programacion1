
Program Caracteres;

Var 
    letra, ant:   char;
    contador:   integer;

Begin
    //$ Inicializa la variable del contador...
    contador := 0;

    //> Lee por teclado la secuencia de caracteres...
    writeln('Ingrese la secuencia de caracteres');
    read(letra);

    //? Mientras la primera letra que leyó no sea el punto...
    While (letra <> '.') Do
        Begin
            //$ Iguala la variable de 'Anterior' a la letra leida...
            ant := letra;
            //> Lee de vuelta la siguiente letra
            read(letra);

            //? Si la letra anterior era 'f' y la actual es 'e' suma al contador 1...
            If (ant = 'f') And (letra = 'e') Then
                contador := contador + 1;
        End;

    //> Informa la cantidad de secuencias 'fe' leidas...
    writeln('La cantidad de fe encontrados es: ', contador);
End.
