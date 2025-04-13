
Program SietePalabras;

Var 
    caracter:   char;
    contador7:   integer;

Procedure tiene7Letras(Var caracter:char; Var contador7: integer);

Var 
    longitud:   integer;

Begin
    // Inicializamos la longitud de la palabra
    longitud := 0;

    // Mientras el caracter que nos pasaron no sea un espacio ni el de cortado, aumentamos la longitud y leemos el siguiente
    While (caracter <> ' ') And (caracter <> '*') Do
        Begin
            longitud := longitud + 1;
            read(caracter);
        End;

    // Cuando alguna de las condiciones anteriores se cumple, el While se corta, entonces debemos ver si la longitud de la palabra que se proceso fue de 7 caracteres o no
    If (longitud = 7) Then contador7 := contador7 + 1;

End;

Begin

    contador7 := 0;
    read(caracter);

    // Saltar espacios iniciales
    While (caracter = ' ') Do
        read(caracter);

    While (caracter <> '*') Do
        Begin


            // Invocamos al procedimiento para que procese toda la secuencia de caracteres
            tiene7Letras(caracter, contador7);

            // Saltamos los espacios que puede haber al final de la secuencia
            While (caracter = ' ') Do
                read(caracter);
        End;
    
    writeln('Se leyeron ', contador7, ' palabra/s con 7 letras.')
End.
