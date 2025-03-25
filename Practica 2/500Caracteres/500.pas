
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
    contador := 0;
    enPalabra := False;
    totalPalabras := 0;
    
    Repeat
        read(caracter);
        contador := contador + 1;

        If (caracter <> ' ') Then enPalabra := True
        Else If enPalabra Then
                Begin
                    enPalabra := False;
                    totalPalabras := totalPalabras + 1;
                End;

    Until (caracter = CORTADO) Or (contador = FINAL);

    writeln('la cantidad de palabras encontradas fue de: ', totalPalabras + 1);
    writeln('la cantidad de caracteres procesados fue de: ', contador);
    writeln('Esta en palabra: ', enPalabra);
End.
