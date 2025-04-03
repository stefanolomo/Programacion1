program Paridad;

// Implemente los siguientes módulos: A) Uno que reciba un entero y devuelva dos enteros con la cantidad de dígitos pares e impares que contiene. B) Uno que cuente la cantidad de dígitos de un número, utilizando el módulo del inciso A). C) Uno que informe el porcentaje de números impares de un entero, utilizando el módulo del inciso A).

var
    // Las variables GLOBALES son...
    impares, pares, digitos: integer;
    // Impares, Pares y digitos para llevar cuenta de cada elemento...

    numero: integer;
    // El numero que va a ingresar el usuario...

    porcentajeDePares, porcentajeDeImpares: real;
    // Los porcentajes de cada tipo...

// El procedimiento necesita 3 parametros: siendo 'numero' el numero a procesar, 'contadorPar' la variable en la que se va a guardar la cantidad de digitos pares, 'contadorImpar' los impares y 'cantidadDigitos' la cantidad de digitos...

procedure CantidadParidad(numero: integer; var contadorPar: integer; var contadorImpar: integer; var cantidadDigitos: integer; var porcentajePar: real; var porcentajeImpar: real);
// El numero es un paramtro normal mientras que los contadores son por referencia. De esta manera se devuelve el valor en el mismo espacio de memoria en el que se uso en la invocación...

var
    // Las variables LOCALES al procedimiento son el digito que se procesa actualmente y si el numero es par o no...
    digito: integer;
    EsPar: boolean;

begin
    // Inicializamos todas las variables de contadores en cero. Esto tambien vacia el valor afuera del procedimiento...
    contadorImpar := 0;
    contadorPar := 0;
    cantidadDigitos := 0;
    porcentajePar := 0;
    porcentajeImpar := 0;

    // Mientras el numero a procesar no sea cero...
    while (numero <> 0) do
        begin
            // Extraemos el digito a procesar y le sumamos 1 al contador de digitos...
            digito := numero mod 10;
            cantidadDigitos := cantidadDigitos + 1;

            // Si es par, EsPar es True...
            EsPar := (digito mod 2 = 0);

            // Si es par, entonces el contador de pares aumenta en 1...
            if (EsPar) then contadorPar := contadorPar + 1

            // De otra manera, es impar, entonces el contador de impares aumenta en 1...
            else contadorImpar := contadorImpar + 1;
            
            // Dividimos al numero entre 10 para procesar el siguiente digito...
            numero := numero div 10;
        end;
    
    // Una vez que terminamos de procesar todos los digitos del numero, calculamos los porcentajes usando los valores de las variables...
    porcentajePar := (contadorPar / cantidadDigitos) * 100;
    porcentajeImpar := (contadorImpar / cantidadDigitos) * 100;
end;

begin

    // Inicializamos las variables...

    numero := 0;
    pares := 0;
    impares := 0;
    digitos := 0;
    porcentajeDePares := 0;
    porcentajeDeImpares := 0;

    // Repite indefinidamente
    while (True) do
        begin
            writeln('Ingrse el numero para chequear cuantos digitos pares y cuantos impares hay: ');
            readln(numero);

            CantidadParidad(numero, pares, impares, digitos, porcentajeDePares, porcentajeDeImpares);

            writeln('En el numero ', numero, ' hay ', digitos, ' digito/s de los cuales, ', pares, ' son par/es y ', impares, ' digito/s son impar/es.');
            writeln('El dígito esta compuesto en un ', porcentajeDePares:1:1, '% de numeros pares, y en un ', porcentajeDeImpares:1:1, '% de numeros impares');
        end;
    
end.