Program Caracteres;

var
    letra: char;
    contador: integer;

begin
    contador := 0;
    writeln('Ingrese la secuencia de caracteres');
    repeat
        read(letra);
        contador := contador + 1;
    until (letra = '.');
    writeln('La cantidad de caracteres leidos es de: ', contador - 1);

end.