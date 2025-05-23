Program TPIntegrador;

Const 
    ALFABETOMAYUS =   ['A'..'Z'];
    ALFABETOMINUS =   ['a'..'z'];
    DIGITOS_CHAR =   ['0'..'9'];
    DIGITOS_INT =   [0..9];
    MAX_FABRICANTES =   30;

Type
    // Puntero a los nodos
    PtrID = ^NodoID;

    // Nodos de ID de robots y el siguiente que siempre apunta a otro nodo
    NodoID = record
        id: Integer;
        sig: PtrID;
    end;

    // Array de las 11 listas
    TArrListas = array [0..10] of PtrID;

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

Const 
    FABRICANTES:   TFabricantes =   (
                                    (nombre: 'AI Creators'; antiguedad: 9),
                                    (nombre: 'AI Dynamics'; antiguedad: 12),
                                    (nombre: 'AI Innovators'; antiguedad: 4),
                                    (nombre: 'AI Pioneers'; antiguedad: 9),
                                    (nombre: 'AutoGenius'; antiguedad: 11),
                                    (nombre: 'AutoMech'; antiguedad: 14),
                                    (nombre: 'CyberAndroids'; antiguedad: 7),
                                    (nombre: 'CyberWorks'; antiguedad: 10),
                                    (nombre: 'EvoBots'; antiguedad: 7),
                                    (nombre: 'EvoMech'; antiguedad: 8),
                                    (nombre: 'FutureBots'; antiguedad: 10),
                                    (nombre: 'FutureMinds'; antiguedad: 5),
                                    (nombre: 'MechSolutions'; antiguedad: 12),
                                    (nombre: 'NanoBots Co.'; antiguedad: 6),
                                    (nombre: 'NanoMinds'; antiguedad: 7),
                                    (nombre: 'NeuraBotics'; antiguedad: 8),
                                    (nombre: 'NextGen Androids'; antiguedad: 6),
                                    (nombre: 'NextGen Robotics'; antiguedad: 3),
                                    (nombre: 'Quantum Robotics'; antiguedad: 5),
                                    (nombre: 'QuantumAndroids'; antiguedad: 4),
                                    (nombre: 'RoboGenius'; antiguedad: 13),
                                    (nombre: 'RoboInnovators'; antiguedad: 3),
                                    (nombre: 'RoboMasters'; antiguedad: 6),
                                    (nombre: 'RoboTech Inc.'; antiguedad: 15),
                                    (nombre: 'SmartAndroids'; antiguedad: 8),
                                    (nombre: 'SmartBots'; antiguedad: 5),
                                    (nombre: 'SynthMind'; antiguedad: 9),
                                    (nombre: 'SynthTech'; antiguedad: 8),
                                    (nombre: 'TechHumanoid'; antiguedad: 11),
                                    (nombre: 'TechPioneers'; antiguedad: 10)
                                    );

Procedure CargarVectorCodigo(Var Vector: VectorCodigo);

Var 
    i:   integer;
    caracter:   char;
Begin
    i := 1;

    While (i <= Vector.DimF) Do
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
        A.V[i] := codigo.V[i];
    A.DimL := 6;
    A.DimF := 6;

    // Parte B: Siguientes 5 caracteres
    For i := 1 to 5 do
        B.V[i] := codigo.V[i+6];
    B.DimL := 5;
    B.DimF := 5;

    // Parte C: Ultimos 7 caracteres
    For i := 1 to 7 do
        C.V[i] := codigo.V[i+11];
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

    // Pasamos cada parte a cada check y ese sera el valor de la funcion
    CodigoValido := CheckParteA(secuenciaA) and CheckParteB(secuenciaB, secuenciaA) and CheckParteC(secuenciaC, secuenciaA);
End;

function VerificarFabricante(FABRICANTES: TFabricantes; NombreFabricante: cadena70; AntiguedadMin: integer):Boolean;

var
    m, d, i: integer;
    Encontrado, CumpleAntiguedad: Boolean;

begin
    // Asumimos que ambas condiciones son falsas
    Encontrado := False;
    CumpleAntiguedad := False;

    // La parte derecha va a ser el final, o el maximo
    d := MAX_FABRICANTES;
    // La parte izquierda va a ser el primero o 1
    i := 1;

    // Mientras la izquierda sea igual o menor a la derecha, lo que siempre se debería cumplir
    while (i <= d) and (not Encontrado) do
        begin
            // El medio es la mitad de la izquierda a la derecha
            m := (i + d) div 2;

            // Si el del medio es el que buscamos
            if (FABRICANTES[m].nombre = NombreFabricante) then
                begin
                    // Verificamos si cumple la antiguedad
                    CumpleAntiguedad := FABRICANTES[m].antiguedad >= AntiguedadMin;
                    // Decimos que lo encontramos
                    Encontrado := True;
                end
            // O esta a la derecha, osea que es mayor al del medio
            else if (NombreFabricante > FABRICANTES[m].nombre) then
                begin
                    // La izquierda es el medio y la derecha sigue siendo el final
                    i := m + 1;

                end
            // O esta a la izquierda, osea que es menor al del medio
            else if (NombreFabricante < FABRICANTES[m].nombre) then
                begin
                    // La derecha es el medio y la izquierda no cambia
                    d := m - 1;
                end;
        end;

    VerificarFabricante := Encontrado and CumpleAntiguedad;
end;

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

procedure leerPuntajeCompetencias10(var arregloCompetencias: VectComp);

var
    i, puntaje: integer;

begin
    writeln('Ingresar la cantidad de competencias en las que participo el robot: ');
    // La cantidad de competencias es la diml del arreglo de competencias
    readln(arregloCompetencias.DimL);

    // Si la cantidad ingresada es invalida, se pregunta de nuevo hasta que se ingrese una que este bien
    while (arregloCompetencias.DimL < 0) or (arregloCompetencias.DimL > 10) Do
        begin
            writeln('Cantidad de competencias invalida, solo se puede ingresar hasta 10 competencias: ');
            readln(arregloCompetencias.DimL);
        end;

    for i := 1 to arregloCompetencias.DimL do
        begin
            writeln('Ingrese el puntaje obtenido en la competencia ', i, ':');
            readln(puntaje);

            // Si el puntaje es invalido, se vuelve a preguntar
            while (puntaje < 0) or (puntaje > 10) Do
                begin
                    writeln('El puntaje ingresado es invalido. Ingrese un nuevo puntaje entre 0 y 10');
                    readln(puntaje);
                end;
            
            // Guardamos el puntaje en el arreglo en la posicion de la competencia que le corresponde
            arregloCompetencias.V[i] := puntaje;
        end;
end;

procedure InicializarListas(var L: TArrListas);
var
    p: integer;

begin
    for p := 0 to 10 Do
        L[p] := nil;
end;

procedure InsertarEnListaIdOrdenado(var L: PtrID; IdRobot: integer);

var
    ant, act, nodo: PtrID;

begin
    // Crea un nuevo nodo en memoria
    new(nodo);

    // Le asigna la ID y el siguiente es nil porque es el ultimo
    nodo^.id := IdRobot;
    nodo^.sig := nil;

    ant := nil;
    act := L;

    // Buscamos la posición de la lista L donde act(L)^.id es menor a IdRobot
    while (act <> nil) and (act^.id < IdRobot) do
        begin
            // Vamos corriendo actual y anterior
            ant := act;
            act := act^.sig;
        end;

    // Cuando salimos del while: ant debe ser la posición despues de la que debemos insertar nuestro nodo

    // Si ant es nil, significa que la lista estaba vacia
    if ant = nil then L := nodo

    // De otra manera, habia elementos en la lista y tenemos que agregar al nodo en el siguiente de ant
    else
        ant^.sig := nodo;

    // Conectamos el siguiente de nuestro nodo al resto de la lista, que se encuentra en act
    nodo^.sig := act;

end;

procedure leerPuntajeCompetenciasInd(var ArrListas: TArrListas; IdRobot: integer; var Exito: boolean);

var
    puntaje, i: integer;
    continuar: char;

begin
    // Iniciamos el contador en 1
    i := 1;

    // Asumimos que los puntajes no se pudieron leer
    Exito := False;

    repeat
        writeln('Ingrese el puntaje obtenido en la competencia ', i);
            readln(puntaje);

        // Si el puntaje es invalido, se vuelve a preguntar
        while (puntaje < 0) or (puntaje > 10) Do
            begin
                writeln('El puntaje ingresado es invalido. Ingrese un nuevo puntaje entre 0 y 10');
                readln(puntaje);
            end;
        
        InsertarEnListaIdOrdenado(ArrListas[puntaje], IdRobot);

        // Preguntamos al usuario si quiere continuar
        writeln('Quiere seguir ingresando competencias? Si no es asi, ingrese "n" ');
        readln(continuar);

        i := i + 1;
    until (continuar = 'n');

    Exito := True;
    
end;

procedure SimularInscripcion();

var
    codigoRobot: VectorCodigo;
    IdRobot, IdFabricante: integer;
    nombreRobot, NombreFabricante: cadena70;
    arregloCompetencias: VectComp;
    ListasPorPuntaje: TArrListas;
    Exito: boolean;
    lecturacomp: char;

begin
    // Inicializa las listas de puntajes
    InicializarListas(ListasPorPuntaje);

    // Lee la informacion de los robots hasta que se lea el robot 'DEEPLEARN'
    repeat
        // Lee el codigo del robot
        LeerCodigoRobot(codigoRobot);

        // Lee el ID del robot
        writeln('Ingrese el ID del robot: ');
        readln(IdRobot);

        // Lee el nombre del robot
        writeln('Ingrese el nombre del robot: ');
        readln(nombreRobot);

        // Lee el nombre del fabricante
        writeln('Ingrese el nombre del fabricante: ');
        readln(NombreFabricante);

        // Lee el ID del fabricante
        writeln('Ingrese la ID del fabricante: ');
        readln(IdFabricante);

        // Se pregunta si participo en mas de 10 competencias lo que va a determinar el modo a usar de leer
        writeln('Las competencias en las que el robot particio son mas de 10? (s/n)');
        readln(lecturacomp);

        if lecturacomp = 's' then leerPuntajeCompetenciasInd(ListasPorPuntaje, IdRobot, Exito)
        else
            leerPuntajeCompetencias10(arregloCompetencias);

        // La inscripción es exitosa si el codigo es válido, la ID del robot y del fabricante son validas; y si el fabricante existe y cumple con la antiguedad de 3 años
        Exito := CodigoValido(codigoRobot) and IdValida(IdRobot, IdFabricante) and VerificarFabricante(FABRICANTES, NombreFabricante, 3);
        
        if Exito then writeln('Se inscribio al robot ', nombreRobot, ' con exito')
        else writeln('Hubo un error en la inscripcion del robot ', nombreRobot);

    until (nombreRobot = 'DEEPLEARN');
    
end;

Begin
    SimularInscripcion();
End.

// Codigos del robot validos:
// EE23AA456780ABAB90 / EE23EE 45678 0ABAB90
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