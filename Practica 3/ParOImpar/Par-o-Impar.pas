program Paridad;

// Implemente los siguientes módulos: A) Uno que reciba un entero y devuelva dos enteros con la cantidad de dígitos pares e impares que contiene. B) Uno que cuente la cantidad de dígitos de un número, utilizando el módulo del inciso A). C) Uno que informe el porcentaje de números impares de un entero, utilizando el módulo del inciso A).

var
    impares, pares: integer;
    numero: integer;

procedure CantidadParidad(numero: integer; var contadorPar: integer; var contadorImpar: integer);

var
    digito: integer;
    EsPar: boolean;

begin
    contadorImpar := 0;
    contadorPar := 0;
    while (numero <> 0) do
        begin
            digito := numero mod 10;

            EsPar := (digito mod 2 = 0);

            if (EsPar) then contadorPar := contadorPar + 1
            else contadorImpar := contadorImpar + 1;

            numero := numero div 10;
        end;
end;

begin

while (True) do
    begin
        pares := 0;
        impares := 0;

        writeln('Ingrse el numero para chequear cuantos digitos pares y cuantos impares hay: ');
        readln(numero);

        CantidadParidad(numero, pares, impares);

        writeln('En el numero ', numero, ' hay ', pares, ' digito/s par/es y ', impares, ' digito/s impar/es.');
        writeln();
    end;
    
end.