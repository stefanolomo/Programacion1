program Surtidores;

const
    VALIDO = [1, 2, 3, 4, 5];

{ Una estación de servicio tiene 5 surtidores. Se requiere implementar un programa que
lea datos de la carga de combustible por teclado (monto cargado y número de surtidor).
La entrada de datos termina cuando se ingresa el surtidor 0. Finalizada la carga se
pide calcular e informar:
a) Monto total vendido por cada surtidor.
b) Surtidor que más vendió.
c) Promedio de venta entre todos los surtidores. }

type
    registrodatos = record
        surtidor: longint;
        monto: longint;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;
    
    ArrSurt = Array[1..5] of longint;

procedure InsertarOrdenado (var Lista: ptrnodo; datos: registrodatos);

var
    ant, act, nodo: ptrnodo;

begin
    ant := nil;
    act := Lista;

    new(nodo);
    nodo^.datos := datos;

    while (act <> nil) and (act^.datos.surtidor < nodo^.datos.surtidor) do begin
        ant := act;
        act := act^.sig;
    end;

    if (ant = nil) then begin
       nodo^.sig := Lista;
       Lista := nodo; 
    end else begin
        ant^.sig := nodo;
        nodo^.sig := act;
    end;
end;

procedure LiberarLista (var Lista: ptrnodo);

var
    aux: ptrnodo;

begin
    while (Lista <> nil) do begin
        aux := Lista;
        Lista := Lista^.sig;
        dispose(aux);
    end;
end;

procedure LeerDatos(var datos: registrodatos);

begin
    writeln('>> Ingresar el surtidor: ');
    readln(datos.surtidor);
    if (datos.surtidor <> 0) and (datos.surtidor in VALIDO) then begin
        writeln('Ingresar el monto cargado: ');
        readln(datos.monto);
    end;
end;

procedure CargarLista (var Lista: ptrnodo);

var
    datos: registrodatos;

begin
    repeat
        LeerDatos(datos);

        if (datos.surtidor <> 0) and (datos.surtidor in VALIDO) then
            InsertarOrdenado(Lista, datos)
        else if not (datos.surtidor in VALIDO) and (datos.surtidor <> 0) then
            writeln(' [!] Ingresar un surtidor valido');
    until (datos.surtidor = 0);
end;

procedure InformarLista (Lista: ptrnodo);

var
    i: longint;
    datos: registrodatos;

begin
    i := 0;
    writeln('--------------------');
    while (Lista <> nil) do begin
        i := i + 1;
        writeln('>> Nodo ', i);
        datos := Lista^.datos;

        writeln('Surtidor: ', datos.surtidor);
        writeln('Monto: ', datos.monto);

        Lista := Lista^.sig;
    end;
    writeln('En la lista habia/n ', i, ' elemento/s');
    writeln('--------------------');
end;

procedure InicializarArrSurt(var A: ArrSurt);

var
    i: longint;

begin
    for i := 1 to 5 do
        A[i] := 0;
end;

procedure InformarArrSurt(A: ArrSurt);

var
    i: longint;

begin
    for i := 1 to 5 do begin
        writeln('Para el surtidor ', i);
        writeln(A[i]);
    end;
end;

function CalcularPromedio(Ventas, Recaudacion: ArrSurt): real;

var
    i, totVentas, totRecaudacion: longint;

begin
    totRecaudacion := 0;
    totVentas := 0;

    for i := 1 to 5 do begin
        totVentas := totVentas + Ventas[i];
        totRecaudacion := totRecaudacion + Recaudacion[i];
    end;
    CalcularPromedio := (totRecaudacion / totVentas);
end;

procedure RecorrerLista(Lista: ptrnodo);

var
    Ventas, Recaudacion, Promedio: ArrSurt;

begin
    InicializarArrSurt(Ventas);
    InicializarArrSurt(Recaudacion);
    InicializarArrSurt(Promedio);

    while (Lista <> nil) do begin
        Ventas[Lista^.datos.surtidor] := Ventas[Lista^.datos.surtidor] + 1;
        Recaudacion[Lista^.datos.surtidor] := Recaudacion[Lista^.datos.surtidor] + Lista^.datos.monto;

        Lista := Lista^.sig;
    end;

    writeln('Las ventas individuales de cada surtidor son: ');
    InformarArrSurt(Ventas);

    writeln('La recaudacion individual de cada surtidor es: ');
    InformarArrSurt(Recaudacion);

    writeln('El promedio de los surtidores es de ', CalcularPromedio(Ventas, Recaudacion):0:2);
end;

var
    ListaSurtidores: ptrnodo;

begin
    ListaSurtidores := nil;

    CargarLista(ListaSurtidores);

    RecorrerLista(ListaSurtidores);

    InformarLista(ListaSurtidores);
end.