program auxiliarPuntaje;

type
    // Puntero a los nodos
    PtrID = ^NodoID;

    // Nodos de ID de robots y el siguiente que siempre apunta a otro nodo
    NodoID = record
        id: Integer;
        sig: PtrID;
    end;

    // Array de las 11 listas
    TArrListas = array [0..10] of PtrID;

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
    
    IdRobot: integer;
    ListasPorPuntaje: TArrListas;
    Exito: boolean;

begin
    // Inicializa las listas (vacias)
    InicializarListas(ListasPorPuntaje);
    
    repeat
        // Lee el ID del robot
        writeln('Ingrese el ID del robot: ');
        readln(IdRobot);

        // Lee el puntaje de competencias indefinidas
        leerPuntajeCompetenciasInd(ListasPorPuntaje, IdRobot, Exito);

    until (False);
    
end;

Begin
    SimularInscripcion();
End.
