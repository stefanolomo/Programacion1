
Program QuinientosCaracteres;

Const 
    FINAL =   500;
    CORTADO =   'z';

Var 
    caracter:   char;
    contador:   integer;
    totalPalabras:   integer;
    enPalabra:   boolean;

Begin
    //$ Inicializa las variables...
    contador := 0;
    enPalabra := False;
    totalPalabras := 0;
    
    //? Repite hasta que se den las condiciones de cortado, esto es: que se procesen 500 caracteres o que el caracter procesado sea z...
    Repeat
        //> Lee del teclado el caracter y incremeta el contador de caracteres procesados...
        read(caracter);
        contador := contador + 1;

        //* Si el caracter que lee no es un espacio, entonces es el principio de una palabra y la variable enPalabra es verdadera...
        If (caracter <> ' ') Then enPalabra := True
        Else
        //* Si no estamos en una palabra, osea, estamos en un espacio...
        If enPalabra Then
                Begin
                    //* chequeamos si antes en el ultimo proceso habíamos leido una palabra, osea que enPalabra = True. Si esto es verdad, lo que tenemos es que pasamos de leer una palabra a leer un espacion lo que significa que terminamos de leer una palabra. Incrementamos el contador correspondiente...
                    enPalabra := False;
                    totalPalabras := totalPalabras + 1;
                End;

    Until (caracter = CORTADO) Or (contador = FINAL);

    //> Informa todos los contadores...
    writeln('la cantidad de palabras encontradas fue de: ', totalPalabras + 1);
    writeln('la cantidad de caracteres procesados fue de: ', contador);
    // writeln('Esta en palabra: ', enPalabra);
End.
