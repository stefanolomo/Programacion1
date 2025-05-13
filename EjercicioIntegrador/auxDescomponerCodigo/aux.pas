Program TestDescomponer;

Const 
    ALFABETOMAYUS =   ['A'..'Z'];
    ALFABETOMINUS =   ['a'..'z'];
    DIGITOS_CHAR =   ['0'..'9'];
    DIGITOS_INT =   [0..9];
    MAX_FABRICANTES =   30;

Type
    // Puntero del siguiente
    PtrCompetencia = ^NodoCompetencia;

    // Nodo de cada competencia
    NodoCompetencia = record
        puntaje: integer;
        siguiente: PtrCompetencia;
    end;

    ConjuntoChar =   set Of char;
    cadena70 =   string[70];

    VectorCodigo =   Record
        V:   array[1..18] Of char;
        DimL:   integer;
        DimF:   integer;
    End;

    VectorParteA =   Record
        V:   array[1..6] Of char;
        DimL:   integer;
        DimF:   integer;
    End;

    VectorParteB =   Record
        V:   array[1..5] Of char;
        DimL:   integer;
        DimF:   integer;
    End;

    VectorParteC =   Record
        V:   array[1..7] Of char;
        DimL:   integer;
        DimF:   integer;
    End;

    TFabricante =   Record
        nombre:   string[70];
        antiguedad:   integer;
    End;

    TFabricantes =   array[1..MAX_FABRICANTES] Of TFabricante;

    VectComp = record
        V: array[1..10] Of integer;
        DimL: integer;
    end;

// 2. Validación del código de robot Implemente un módulo que valide el código del robot. Para ello, desarrolle una serie de submódulos que procesen los caracteres del código y analicen si se cumple con el siguiente patrón ABC:



// a) Módulo 1 (Parte A): Secuencia de 6 caracteres que deben ser letras mayúsculas y números, con al menos 2 de cada uno (ej. si tiene 5 mayúsculas y 1 número no se cumpliría la Parte A de la secuencia).

Function CheckParteA(secuencia: VectorParteA):   boolean;

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

    writeln('DimL:', secuencia.DimL);

    For i := 1 To secuencia.DimL Do
        Begin
            caracter := secuencia.V[i];

            writeln(caracter);

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



// Procedimientos para extraer digitos que hay la secuenciaA y volcarlos a un conjunto
Procedure ExtraerDigitosParteA(secuencia: VectorParteA; Var conjunto:
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

Function CheckParteB(secuencia: VectorParteB; secuenciaParteA: VectorParteA):
                                                                         boolean
;

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

            // Si no es un digito o esta en los de la parte A, es invalido
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

Function CheckParteC(secuencia: VectorParteC; secuenciaParteA: VectorParteA):
                                                                         boolean
;

Var 
    conjuntoParteA:   ConjuntoChar;
    caracter, anterior:   char;
    i:   integer;
    Esvalido, encontreAB:   boolean;

Begin
    // El conjunto lo pone vacio y el i en 1
    conjuntoParteA := [];
    i := 1;
    anterior := 'A';

    // Suponemos que es valido
    Esvalido := True;

    // Extramos los digitos de la parte A a un conjunto
    ExtraerDigitosParteA(secuenciaParteA, conjuntoParteA);

    // De 1 a la dimension logica mientras sea valido
    While (i <= secuencia.DimL) And EsValido Do
        Begin
            // Extraemos el caracter a procesar
            caracter := secuencia.V[i];


            // Validar caracteres permitidos: Si no es una letra mayusucla, minuscula o digito que no esta en el conjunto de digitos de A entonce es invalido
            If Not ((caracter In ALFABETOMAYUS) Or (caracter In ALFABETOMINUS)
               Or ((caracter In DIGITOS_CHAR) And Not (caracter In
               conjuntoParteA))) Then Esvalido := False;


            // Detectar si aparece una A seguida de una B mientras que no sea el primer caracter leido
            If (i > 1) And (anterior = 'A') And (caracter = 'B') Then
                encontreAB := True;

            // Si el caracter procesado era una letra, seteamos el anterior para la proxima pasada
            if (caracter In ALFABETOMAYUS) Or (caracter In ALFABETOMINUS) then anterior := caracter;

            // Incrementamos el contador
            i := i + 1;
        End;

    // Si cumple los dos patrones, pasa el check
    CheckParteC := Esvalido And encontreAB;
End;

procedure LeerCodigoRobot(var codigoRobot: VectorCodigo);
var
    i: integer;
    c: char;
begin
    writeln('Ingresar Codigo de Robot: ');
    for i := 1 to 18 do
        begin
            // Leer caracter
            read(c);
            codigoRobot.V[i] := c;
        end;

    codigoRobot.DimL := i;
    codigoRobot.DimF := 18;

end;

Procedure DescomponerVectorCodigo(
    codigo: VectorCodigo;
    Var A: VectorParteA;
    Var B: VectorParteB;
    Var C: VectorParteC
    );

Var
    i: integer;

Begin
    // Parte A: Primeros 6 caracteres
    For i := 1 to 6 do
        begin
            A.V[i] := codigo.V[i];
        end;
    A.DimL := 6;
    A.DimF := 6;

    writeln('En el desccod, DimL PA', A.DimL);

    // Parte B: Siguientes 5 caracteres
    For i := 1 to 5 do
        begin
            B.V[i] := codigo.V[i+6];
        end;
    B.DimL := 5;
    B.DimF := 5;

    // Parte C: Ultimos 7 caracteres
    For i := 1 to 7 do
        begin
            C.V[i] := codigo.V[i+11];
        end;
    C.DimL := 7;
    C.DimF := 7;
End;

Function CodigoValido(CodigoRobot: VectorCodigo):   boolean;

var
    secuenciaA: VectorParteA;
    secuenciaB: VectorParteB;
    secuenciaC: VectorParteC;

Begin
    // Descomponemos el codigo del robot en cada parte
    DescomponerVectorCodigo(CodigoRobot, secuenciaA, secuenciaB, secuenciaC);

    writeln('DimL PA: ', secuenciaA.DimL, 'DimF PA: ', secuenciaA.DimF);
    writeln('DimL PB: ', secuenciaB.DimL, 'DimF PB: ', secuenciaB.DimF);
    writeln('DimL PC: ', secuenciaC.DimL, 'DimF PC: ', secuenciaC.DimF);

    writeln('CheckParteA: ', CheckParteA(secuenciaA));
    writeln('CheckParteB: ', CheckParteB(secuenciaB, secuenciaA));
    writeln('CheckParteC: ', CheckParteC(secuenciaC, secuenciaA));

    // Pasamos cada parte a cada check y ese sera el valor de la funcion
    CodigoValido := CheckParteA(secuenciaA) and CheckParteB(secuenciaB, secuenciaA) and CheckParteC(secuenciaC, secuenciaA);
End;

procedure SimularInscripcion();

var
    codigoRobot: VectorCodigo;
    Exito: boolean;

begin
    // Lee la informacion de los robots hasta que se lea el robot 'DEEPLEARN'
    repeat
        // Lee el codigo del robot
        LeerCodigoRobot(codigoRobot);

        Exito := CodigoValido(codigoRobot);
    until (True);
    
end;

Begin
    SimularInscripcion();
End.

// Codigos del robot validos:
// EE23AA456780ABAB90 / EE23AA 45678 0ABAB90
// HH11EE2345688ABFC8 / HH11EE 23456 88ABFC8
// ParteA: 6 caracteres con 2 mayus y dos digitos
// ParteB: 5 digitos en orden creciente que no estan en A
// ParteC: 7 caracteres que tengan A seguido de B si tiene digitos no deben estar en A

// ID del fabricante y robot validas:
// Robot -> 12345 Fabricante -> 5432
// Robot -> 99112 Fabricante -> 6231
// La suma de los digitos de la ID del robot deben ser mayores a la suma de los del fabricante

// Fabricantes existentes y con antiguedad >= 3:
// SynthTech
// RoboGenius