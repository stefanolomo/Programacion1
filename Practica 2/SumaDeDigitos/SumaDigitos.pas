Program SumaDeDigitos;

const
    FINAL = 9999;

var
    numero: integer;
    digito: integer;
    max1, max2: integer;
    sumaMax: integer;

begin
    //$ Inicializando variables...
    numero := 0;
    digito := 0;
    sumaMax := 0;
    //? Repite hasta que el numero no sea la condicion de cortado que es 9999...
    repeat
        //> Lee el numero...
        writeln('> Ingrese la secuencia de numeros: ');
        read(numero);
        
        //$ Limpia o inicializa las variables...
        max1:= 0;
        max2:= 0;

        //? Repite mientras que el numero no sea 0 y no sea la condicion de cortado...

        while (numero <> 0) and (numero <> FINAL) do begin
            //* Obtiene el primer digito de derecha a izquierda del numero...
            digito := numero mod 10;

            //> Escribe ese digito a consola...
            writeln(digito);

            //? Si el digito es mayor que max1 actualiza el valor sin antes pasar el valor del max1 a max2...
            if (digito > max1) then begin
                max2 := max1;
                max1 := digito;
            end

            //? Si el digito es mayor que max2 actualiza max2 solamente...
            else if (digito > max2) then max2 := digito;

            //$ Divide el numero por 10 para eliminar el digito ya procesado y suma los maximos econtrados...
            numero := numero div 10;
            sumaMax := max1 + max2;
        end;
        //> Informa la suma antes de seguir con el siguiente numero...
        writeln('> La suma de los dos digitos mas grandes es de: ', sumaMax);
    until (numero = FINAL);

end.