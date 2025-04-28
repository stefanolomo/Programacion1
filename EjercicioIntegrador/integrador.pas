
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
    caracter:   char;
Begin
    i := 1;

    While (i <= max) Do
        Begin
            read(caracter);

            // Ignorar Enter y otros caracteres que no son de interes
            If (caracter In ALFABETOMAYUS) Or (caracter In ALFABETOMINUS) Or (
               caracter In DIGITOS_CHAR) Then
                Begin
                    Vector.V[i] := caracter;
                    Vector.DimL := i;
                    // actualizar DimL
                    i := i + 1;
                End;
        End;
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

Function CheckParteA(secuencia: Vector):   boolean;

Var 
    contadorLetras, contadorNum:   integer;
    i:   integer;
    caracter:   char;
    esValido:   boolean;
    // Bandera para saber si la secuencia es válida
Begin
    esValido := True;
    // Inicializamos como válido

    contadorLetras := 0;
    contadorNum := 0;

    For i := 1 To secuencia.DimL Do
        Begin
            caracter := secuencia.V[i];


  // Si el caracter no es una letra mayuscula ni un digito, no cumple el patrón
            If (Not (caracter In ALFABETOMAYUS)) And (Not (caracter In
               DIGITOS_CHAR)) Then
                Begin
                    esValido := False;
                    // Marcamos como inválido
                End;


      // Si el caracter es una letra mayuscula, aumentamos el contador de letras
            If (caracter In ALFABETOMAYUS) Then
                contadorLetras := contadorLetras + 1


           // Y si el caracter es un número, aumentamos el contador de números
            Else If (caracter In DIGITOS_CHAR) Then
                     contadorNum := contadorNum + 1;
        End;

    // Si tiene al menos 2 letras y 2 números, es válido
    CheckParteA := esValido And (contadorLetras >= 2) And (contadorNum >= 2);
End;




// b) Módulo 2 (Parte B): Secuencia de 5 dígitos ordenados de menor a mayor que no estén en la Parte A.


// Procedimientos para extraer digitos que hay en una secuencia y volcarlos a un conjunto
Procedure ExtraerDigitosParteA(secuencia: Vector; Var conjunto:
                               ConjuntoChar);

Var 
    i:   integer;
    caracter:   char;
Begin
    conjunto := [];

    For i := 1 To 6 Do
        Begin
            caracter := secuencia.V[i];
            If (caracter In DIGITOS_CHAR) Then
                conjunto := conjunto + [caracter];
        End;
End;

Function CheckParteB(secuencia: Vector; secuenciaParteA: Vector):   boolean;

Var 
    i:   integer;
    caracter:   char;
    conjuntoParteA:   ConjuntoChar;
    EsValido:   boolean;
Begin
    // El conjunto lo pone vacio
    conjuntoParteA := [];

    // Extrae los digitos de la parte A
    ExtraerDigitosParteA(secuenciaParteA, conjuntoParteA);

    // Suponemos que la secuencia es valida por defecto y i empieza en 1
    EsValido := True;
    i := 1;


// Mientras desde i hasta la dimension logica y mientras sea valido (para cortar cuando deje de serlo)
    While (i <= secuencia.DimL) And EsValido Do
        Begin
            // Extraemos el caracter a analizar
            caracter := secuencia.V[i];

            // Si no es un digitol o esta en los de la parte A, es invalido
            If (Not (caracter In DIGITOS_CHAR)) Or (caracter In conjuntoParteA)
                Then
                EsValido := False
                            // Y si es menor al anterior tambien es inválido
            Else If (i > 1) And (caracter < secuencia.V[i-1]) Then
                     EsValido := False

                          // Si no pasa nada, esta bien y le sumamos al contador
            Else
                i := i + 1;
        End;

    // El resultado es si es valido
    CheckParteB := EsValido;
End;



// c) Módulo 3 (Parte C): Secuencia de 7 dígitos o letras que contengan el carácter 'A' seguido de 'B'. En el caso de tener dígitos, estos no deben estar en la Parte A.

Function CheckParteC(secuencia: Vector; secuenciaParteA: Vector):   boolean;

var
    conjuntoParteA:   ConjuntoChar;
    caracter, anterior: char;
    i: integer;
    Esvalido, encontreAB: boolean;
    
Begin
    // El conjunto lo pone vacio y el i en 1
    conjuntoParteA := [];
    i := 1;

    // Suponemos que es valido
    Esvalido := True;

    // Extramos los digitos de la parte A a un conjunto
    ExtraerDigitosParteA(secuenciaParteA, conjuntoParteA);

    // De 1 a la dimension logica mientras sea valido
    while (i <= secuencia.DimL) and EsValido do
    begin
        // Extraemos el caracter a procesar
        caracter := secuencia.V[i];

        // Validar caracteres permitidos: Si no es una letra mayusucla, minuscula o digito que no esta en el conjunto de digitos de A entonce es invalido
        if not ((caracter in ALFABETOMAYUS) or (caracter in ALFABETOMINUS) or ((caracter in DIGITOS_CHAR) and not (caracter in conjuntoParteA))) then Esvalido := False;

        // Detectar si aparece una A seguida de una B mientras que no sea el primer caracter leido
        if (i > 1) and (anterior = 'A') and (caracter = 'B') then
            encontreAB := True;

        anterior := caracter;
        i := i + 1;
    end;

    // Si cumple los dos patrones, pasa el check
    CheckParteC := Esvalido and encontreAB;
End;

Function CodigoValido(ArrParteA: Vector; ArrParteB: Vector;
                      ArrParteC: Vector):   boolean;
Begin
    // Devuelve True solo si todos los checks son aprobados
    CodigoValido := CheckParteA(ArrParteA) And CheckParteB(ArrParteB, ArrParteA)
                    And CheckParteC(ArrParteC, ArrParteA);
End;

// Programa Principal

Var 
    secuenciaA, secuenciaB:   Vector;
    r:   integer;
Begin
    // Lee hasta 6 caracteres para la parte A
    writeln(
     'Ingrese 6 caracteres para la secuencia A (letras mayúsculas o números):'
    );

    secuenciaA.DimF := 6;

    CargarVector(secuenciaA, 6);

    For r := 1 To secuenciaA.DimF Do
        writeln (secuenciaA.V[r]);

    If (CheckParteA(secuenciaA)) Then
        writeln('Parte A válida')
    Else
        writeln('Parte A inválida');

    // Lee hasta 5 caracteres para la parte B

    writeln(
'Ingrese 5 caracteres para la secuencia B (digitos de menor a mayor que no esten en parte A):'
    );

    secuenciaB.DimF := 5;

    CargarVector(secuenciaB, 5);

    For r := 1 To secuenciaB.DimF Do
        writeln (secuenciaB.V[r]);

    If (CheckParteB(secuenciaB, secuenciaA)) Then
        writeln('Parte B válida')
    Else
        writeln('Parte B inválida');
End.
