Program TPIntegrador;

Const 
    ALFABETOMAYUS =   ['A'..'Z'];
    ALFABETOMINUS =   ['a'..'z'];  
    DIGITOS_CHAR =   ['0'..'9'];
    DIGITOS_INT =   [0..9];

Type 
    ConjuntoChar =   set Of char;

    Vector =   Record
        V:   array[1..7] Of char;
        DimL:   integer;
        DimF:   integer;
    End;

Procedure CargarVector(Var Vector: Vector; max: integer);
Var 
    i:   integer;
Begin
    Vector.DimL := 0;  // Asegúrate de inicializar DimL
    If (max <= Vector.DimF) And (max > 0) Then
        Begin
            For i := 1 To max Do
                Begin
                    read(Vector.V[i]);
                    Vector.DimL := Vector.DimL + 1;
                End;
        End
    else writeln('>>Error en la carga del vector!<<');
End;

// 1. Validación de ID del robot: Implementar un módulo que valide el ID del robot. Para ello desarrolle un módulo cuya tarea sea descomponer un número que recibe como parámetro y retorne la suma de sus dígitos. Un ID del robot es válido si la suma de sus dígitos es mayor que la suma de los dígitos del ID del fabricante

Function IdValida(IdRobot: integer; IdFabricante: integer):   boolean;
Var 
    sumaRobot, sumaFabricante, digito:   integer;
Begin
    sumaRobot := 0;
    sumaFabricante := 0;

    // Descompone los digitos del ID del robot y los suma
    While (IdRobot <> 0) Do
        Begin
            digito := IdRobot Mod 10;
            sumaRobot := sumaRobot + digito;
            IdRobot := IdRobot Div 10;
        End;

    // Descompone los digitos del ID del fabricante y los suma
    While (IdFabricante <> 0) Do
        Begin
            digito := IdFabricante Mod 10;
            sumaFabricante := sumaFabricante + digito;
            IdFabricante := IdFabricante Div 10;
        End;

    // Si la suma de los digitos del robot es mayor a la del fabricante entonces la ID es válida
    IdValida := (sumaRobot > sumaFabricante);
End;

// 2. Validación del código de robot Implemente un módulo que valide el código del robot. Para ello, desarrolle una serie de submódulos que procesen los caracteres del código y analicen si se cumple con el siguiente patrón ABC:

// a) Módulo 1 (Parte A): Secuencia de 6 caracteres que deben ser letras mayúsculas y números, con al menos 2 de cada uno (ej. si tiene 5 mayúsculas y 1 número no se cumpliría la Parte A de la secuencia).

Function CheckParteA(secuencia: Vector): boolean;
var
    contadorLetras, contadorNum: integer;
    i: integer;
    caracter: char;
    esValido: boolean;  // Bandera para saber si la secuencia es válida
Begin
    esValido := True;  // Inicializamos como válido

    contadorLetras := 0;
    contadorNum := 0;

    for i := 1 to secuencia.DimL do
    begin
        caracter := secuencia.V[i];

        // Si el caracter no es una letra mayuscula ni un digito, no cumple el patrón
        if (not (caracter in ALFABETOMAYUS)) and (not (caracter in DIGITOS_CHAR)) then
        begin
            esValido := False;  // Marcamos como inválido
        end;

        // Si el caracter es una letra mayuscula, aumentamos el contador de letras
        if (caracter in ALFABETOMAYUS) then
            contadorLetras := contadorLetras + 1

        // Y si el caracter es un número, aumentamos el contador de números
        else if (caracter in DIGITOS_CHAR) then
            contadorNum := contadorNum + 1;
    end;

    // Si tiene al menos 2 letras y 2 números, es válido
    CheckParteA := esValido and (contadorLetras >= 2) and (contadorNum >= 2);
End;



// b) Módulo 2 (Parte B): Secuencia de 5 dígitos ordenados de menor a mayor que no estén en la Parte A.

// Procedimientos para extraer digitos que hay en una secuencia y volcarlos a un conjunto
Procedure ExtraerDigitosParteA(secuencia: Vector; Var conjunto:
                               ConjuntoChar);

var
    i: integer;
    caracter: char;
Begin
    conjunto := [];

    For i := 1 To 6 Do
        Begin
            caracter := secuencia.V[i];
            if (caracter in DIGITOS_CHAR) then conjunto := conjunto + [caracter];
        End;
End;

Function CheckParteB(secuencia: Vector; secuenciaParteA: Vector): boolean;
Var
    i: integer;
    caracter: char;
    conjuntoParteA: ConjuntoChar;
Begin
    conjuntoParteA := [];

    ExtraerDigitosParteA(secuenciaParteA, conjuntoParteA);
    
    for i := 1 to secuencia.DimL do
        begin
            caracter := secuencia.V[i];

            // Si el caracter no es un digito o está en los de la parte A, no cumple el patron
            if (not (caracter in DIGITOS_CHAR)) or (caracter in conjuntoParteA) then
                CheckParteB := False;

            if (i > 1) and (caracter < secuencia.V[i-1]) then
                CheckParteB := False;
        end;

    // Si pasó todas las comprobaciones, es válido
    CheckParteB := True;
End;

// c) Módulo 3 (Parte C): Secuencia de 7 dígitos o letras que contengan el carácter 'A' seguido de 'B'. En el caso de tener dígitos, estos no deben estar en la Parte A.

Function CheckParteC(secuencia: Vector; secuenciaParteA: Vector):   boolean;
Begin
    CheckParteC := True;
End;

Function CodigoValido(ArrParteA: Vector; ArrParteB: Vector;
                      ArrParteC: Vector): boolean;
Begin
    CodigoValido := CheckParteA(ArrParteA) And CheckParteB(ArrParteB, ArrParteA) And CheckParteC(ArrParteC, ArrParteA);
End;

// Programa Principal
var
    secuenciaA, secuenciaB: Vector;
    r: integer;
Begin
    // Lee hasta 6 caracteres para la parte A
    writeln('Ingrese 6 caracteres para la secuencia A (letras mayúsculas o números):');
    
    secuenciaA.DimF := 6;
    secuenciaA.DimL := 0;

    CargarVector(secuenciaA, 6); 

    for r := 1 to secuenciaA.DimF do writeln (secuenciaA.V[r]);

    if (CheckParteA(secuenciaA)) then
        writeln('Parte A válida')
    else
        writeln('Parte A inválida');

    // Lee hasta 5 caracteres para la parte B
    
    writeln('Ingrese 5 caracteres para la secuencia B (digitos de menor a mayor que no esten en parte A):');
    
    secuenciaB.DimL := 0;
    secuenciaB.DimF := 5;

    CargarVector(secuenciaB, 5);

    for r := 1 to secuenciaB.DimF do writeln (secuenciaB.V[r]);

    if (CheckParteB(secuenciaB, secuenciaA)) then
        writeln('Parte B válida')
    else
        writeln('Parte B inválida');
End.
