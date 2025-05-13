program auxiliarPuntaje;

type
    // // Puntero del siguiente
    // PtrCompetencia = ^NodoCompetencia;

    // // Nodo de cada competencia
    // NodoCompetencia = record
    //     puntaje: integer;
    //     siguiente: PtrCompetencia;
    // end;

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

    // Buscamos la posición de la lista L donde act(L)^.id es mayor o igual a IdRobot
    while (act <> nil) and (act^.id >= IdRobot) do
        begin
            // Vamos corriendo actual y anterior
            ant := act;
            act := act^.sig;
        end;

    // Cuando salimos del while: ant debe ser la posición despues de la que debemos insertar nuestro nodo

    // Si ant es nil, significa que la lista estaba vacia
    if ant = nil then ant := nodo

    // De otra manera, habia elementos en la lista y tenemos que agregar al nodo en el siguiente de ant
    else
        ant^.sig := nodo;

    // Conectamos el siguiente de nuestro nodo al resto de la lista, que se encuentra en act
    nodo^.sig := act;

end;

procedure leerPuntajeCompetenciasInd(var ListaCompetencias: PtrCompetencia; IdRobot: integer; var Exito: boolean);

var
    nuevoNodo, Ultimo: PtrCompetencia;
    puntaje, i: integer;
    continuar: char;

begin
    // Iniciamos la lista vacia y el ultimo tambien
    ListaCompetencias := nil;
    Ultimo := nil;
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
        
        // Creamos un nuevo nodo de competencia
        new(nuevoNodo);

        // Almacenamos el puntaje leido y ponemos al siguiente en nil porque siempre agregamos al final de la lista
        nuevoNodo^.puntaje := puntaje;
        nuevoNodo^.siguiente := nil;

        // Si la lista esta vacia
        if (ListaCompetencias = nil) then ListaCompetencias := nuevoNodo
        // Si tiene otro nodo, no esta vacia, lo tenemos que agregar al final
        else
            // Accedemos al ultimo, y cambiamos su atributo siguiente a el nuevo nodo
            Ultimo^.siguiente := nuevoNodo;

        // Actualizamos la posicion del ultimo ya que ahora es el nuevo nodo
        Ultimo := nuevoNodo;

        // Preguntamos al usuario si quiere continuar
        writeln('Quiere seguir ingresando competencias? Si no es asi, ingrese "n" ');
        readln(continuar);

        i := i + 1;
    until (continuar = 'n');
    
end;

procedure SimularInscripcion();

var
    
    IdRobot: integer;
    // CompetenciasPtr: PtrCompetencia;

begin
    repeat
        // Lee el ID del robot
        writeln('Ingrese el ID del robot: ');
        readln(IDRobot);

        // Lee el puntaje de competencias indefinidas
        // leerPuntajeCompetenciasInd(CompetenciasPtr, , Exito);

    until (False);
    
end;

Begin
    SimularInscripcion();
End.
