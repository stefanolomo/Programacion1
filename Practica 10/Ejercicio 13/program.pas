program Ejercicio13;

{ 13. Una plataforma de streaming desea implementar un sistema para gestionar su catálogo de series vistas por los usuarios. Cada vez que un usuario finaliza una serie, se registra la siguiente información: nombre de la serie, nombre del usuario y calificación del usuario a la serie (1..5). Se lee información de los usuarios que finalizaron series hasta que llega el nombre de usuario “ZZZ”. Se pide:

a. Crear una lista doblemente enlazada con los registros de series vistas ordenada por el nombre de la serie.

b. Recorrer la lista una sola vez para:
    i. Calcular la calificación que mayor cantidad de series recibe por parte de los usuarios.
    ii. Generar e imprimir una lista simple con el promedio de calificaciones para cada nombre de serie. }

type
    tipocal = 1..5;
    tipocadena = string[40];
    registroserie = record
        nombre: tipocadena;
        usuario: tipocadena;
        calificacion: tipocal;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registroserie;
        ant: ptrnodo;
        sig: ptrnodo;
    end;

    ArrCal = Array[tipocal] of integer;

    registroProm = record
        nombre: tipocadena;
        promedio: real;
    end;

    ptrprom = ^nodoProm;
    nodoProm = record
        datos: registroProm;
        sig: ptrprom;
    end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: registroserie);

var
    ant, act, nodo: ptrnodo;

begin
    ant := nil;
    act := Lista;

    new(nodo);
    nodo^.datos := datos;
    nodo^.ant := nil;
    nodo^.sig := nil;

    while (act <> nil) and (act^.datos.nombre < nodo^.datos.nombre) do begin
        ant := act;
        act := act^.sig;
    end;

    if (ant = nil) then begin
        nodo^.sig := Lista;

        if (Lista <> nil) then
            Lista^.ant := nodo;

        Lista := nodo;
    end else begin
        nodo^.sig := act;
        nodo^.ant := ant;
        ant^.sig := nodo;

        if act <> nil then
            act^.ant := nodo;
    end;
end;

procedure LeerDatos(var Serie: registroserie);

begin
    writeln('Ingrese el nombre del usuario: ');
    readln(Serie.usuario);
    if (Serie.usuario <> 'ZZZ') then begin
        writeln('Ingrese el nombre de la serie: ');
        readln(Serie.nombre);
        writeln('Ingrese la calificacion (1 a 5): ');
        readln(Serie.calificacion);
    end;
end;

procedure CargarLista(var Lista: ptrnodo);

var
    Serie: registroserie;

begin
    repeat
        LeerDatos(Serie);

        if Serie.usuario <> 'ZZZ' then
            InsertarOrdenado(Lista, Serie);
    until (Serie.usuario = 'ZZZ');
end;

procedure InicializarArrCal(var A: ArrCal);

var
    i: integer;

begin
    for i := 1 to 5 do
        A[i] := 0;
end;

procedure InsertarAlFinal(var L: ptrprom; reg: registroProm);

var
    nuevo, act: ptrprom;

begin
    new(nuevo);
    nuevo^.datos := reg;
    nuevo^.sig := nil;

    if L = nil then
        L := nuevo
    else begin
        act := L;
        while act^.sig <> nil do
            act := act^.sig;
        act^.sig := nuevo;
    end;
end;


function CalificacionMasComun(cal: ArrCal): tipocal;

var
    i: tipocal;
    maxCant, maxCal: integer;

begin
    maxCant := -1;
    maxCal := 1;
    for i := 1 to 5 do
        if cal[i] > maxCant then
        begin
            maxCant := cal[i];
            maxCal := i;
        end;
    CalificacionMasComun := maxCal;
end;

procedure ProcesarLista(Lista: ptrnodo; var LProm: ptrprom);

var
    act: ptrnodo;
    serieAct: tipocadena;
    suma, cant: integer;
    cal: ArrCal;
    prom: real;
    regProm: registroProm;

begin
    LProm := nil;
    InicializarArrCal(cal);

    act := Lista;
    while (act <> nil) do
    begin
        serieAct := act^.datos.nombre;
        suma := 0;
        cant := 0;

        while (act <> nil) and (act^.datos.nombre = serieAct) do
        begin
            suma := suma + act^.datos.calificacion;
            cant := cant + 1;
            cal[act^.datos.calificacion] := cal[act^.datos.calificacion] + 1;
            act := act^.sig;
        end;

        prom := suma / cant;

        regProm.nombre := serieAct;
        regProm.promedio := prom;
        InsertarAlFinal(LProm, regProm);
    end;

    writeln('La calificación más común fue: ', CalificacionMasComun(cal));
end;


procedure MostrarPromedios(LProm: ptrprom);

begin
    while LProm <> nil do
    begin
        writeln('Serie: ', LProm^.datos.nombre, ' - Promedio: ', LProm^.datos.promedio:0:2);
        LProm := LProm^.sig;
    end;
end;

var
    Lista: ptrnodo;
    LProm: ptrprom;

begin
    Lista := nil;

    CargarLista(Lista);

    ProcesarLista(Lista, LProm);
    
    MostrarPromedios(LProm);
end.
