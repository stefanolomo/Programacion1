
Program Caracteres;

Var 
    letra:   char;
    contador:   integer;

Begin
    contador := 0;
    writeln('Ingrese la secuencia de caracteres');

    Repeat
        read(letra);
        if (letra = 'E') then contador = contador + 1;
    Until (letra = '.');
    writeln('La cantidad de caracteres leidos es de: ', contador - 1);

End.
