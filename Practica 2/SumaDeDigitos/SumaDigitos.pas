Program SumaDeDigitos;

const
    FINAL = 9999;

var
    numero: integer;
    digito: integer;
    max1, max2: integer;
    sumaMax: integer;

begin
    numero := 0;
    digito := 0;
    sumaMax := 0;
    repeat
        writeln('> Ingrese la secuencia de numeros: ');
        read(numero);
        max1:= 0;
        max2:= 0;
        while (numero <> 0) and (numero <> FINAL) do begin
            digito := numero mod 10;
            writeln(digito);
            if (digito > max1) then begin
                max2 := max1;
                max1 := digito;
            end
            else if (digito > max2) then max2 := digito;
            numero := numero div 10;
            sumaMax := max1 + max2;
        end;
        writeln('> La suma de los dos digitos mas grandes es de: ', sumaMax);
    until (numero = FINAL);

end.