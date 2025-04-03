program Paridad;

// Implemente los siguientes módulos: A) Uno que reciba un entero y devuelva dos enteros con la cantidad de dígitos pares e impares que contiene. B) Uno que cuente la cantidad de dígitos de un número, utilizando el módulo del inciso A). C) Uno que informe el porcentaje de números impares de un entero, utilizando el módulo del inciso A).

var
    impares, pares, digitos: integer;
    numero: integer;

procedure CantidadParidad(numero: integer; var contadorPar: integer; var contadorImpar: integer; var cantidadDigitos: integer);

var
    digito: integer;
    EsPar: boolean;

begin
    contadorImpar := 0;
    contadorPar := 0;
    cantidadDigitos := 0;

    while (numero <> 0) do
        begin
            digito := numero mod 10;
            cantidadDigitos := cantidadDigitos + 1;

            EsPar := (digito mod 2 = 0);

            if (EsPar) then contadorPar := contadorPar + 1
            else contadorImpar := contadorImpar + 1;

            numero := numero div 10;
        end;
end;

begin

numero := 0;
pares := 0;
impares := 0;
digitos := 0;

while (True) do
    begin
        writeln('Ingrse el numero para chequear cuantos digitos pares y cuantos impares hay: ');
        readln(numero);

        CantidadParidad(numero, pares, impares, digitos);

        writeln('En el numero ', numero, ' hay ', digitos, ' digito/s de los cuales, ', pares, ' son par/es y ', impares, ' digito/s son impar/es.');
        writeln();
    end;
    
end.