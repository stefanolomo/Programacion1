program gas;

// Una empresa de gas tiene que revisar los montos facturados a sus clientes durante el mes Octubre. De cada factura se conoce: el código de cliente, categoría de consumo (1 a 10), metros cúbicos (m3) consumidos, monto total de la factura y cada monto facturado durante los 12 meses del año anterior.

// Se dispone de una lista con la información anterior y de una estructura que se accede por categoría de consumo al nombre de esta. Procesar la lista de facturas recorriéndola una sola vez para:

// A. Separar la lista por las 3 condiciones, ordenándolas por código de cliente:
// [Sin revisión]: facturas cuyo monto es menor que el promedio del año anterior.
// [Revisión]: facturas cuyo monto es mayor que el promedio del año anterior y tiene más de 1000 m3 consumidos.
// [Refacturación]: facturas cuyo monto es mayor que el promedio del año anterior y tiene menos de 1000 m3 consumidos.

// B. Calcular e informar el nombre y los m3 consumidos para todas las categorías de consumo

type
    tipocat = 1..10;
    arrMontos = Array[1..12] of integer;

    factura = record
        codigo, m3, monto: integer;
        categoria: tipocat;
        montos: arrMontos
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: factura;
        sig: ptrnodo;
    end;

    arrCat = Array[1..10] of integer;

procedure InicializarArrCat(var V: arrCat);

var
    i: integer;

begin
    for i := 1 to 10 do begin
        V[i] := 0;
    end;
end;

procedure InformarArrCat(V: arrCat);

var
    i: integer;

begin
    for i := 1 to 10 do begin
        writeln('Para la categoria ', i, ' se consumieron ', V[i], 'm3 de gas.')
    end;
end;

procedure InicializarArrMontos(var V: arrMontos);

var
    i: integer;

begin
    for i := 1 to 12 do begin
        V[i] := 0;
    end;
end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: factura);

var
    ant, act, nodo: ptrnodo;

begin
    new(nodo);
    nodo^.datos := datos;

    ant := nil;
    act := Lista;

    while (act <> nil) and (act^.datos.codigo <= nodo^.datos.codigo) do begin
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

function CalcularPromedioArrMontos(V: arrMontos): integer;

var
    i, sum: integer;

begin
    sum := 0;

    for i := 1 to 12 do begin
        sum := sum + V[i];
    end;

    if (sum <> 0) then
        CalcularPromedioArrMontos := sum div 12
    else
        CalcularPromedioArrMontos := 0;
end;

procedure RecorrerLista(Lista: ptrnodo; var Lista1, Lista2, Lista3: ptrnodo);

var
    ArregloConsumoCategoria: arrCat;
    act: ptrnodo;
    promedio: integer;

begin
    InicializarArrCat(ArregloConsumoCategoria);

    Lista1 := nil;
    Lista2 := nil;
    Lista3 := nil;

    act := Lista;

    while (act <> nil) do begin
        ArregloConsumoCategoria[act^.datos.categoria] := ArregloConsumoCategoria[act^.datos.categoria] + act^.datos.m3;

        promedio := CalcularPromedioArrMontos(act^.datos.montos);

        if (act^.datos.monto <= promedio) then
            InsertarOrdenado(Lista1, act^.datos)
        else if (act^.datos.monto > promedio) then begin
            if (act^.datos.m3 > 1000) then
                InsertarOrdenado(Lista2, act^.datos)
            else if (act^.datos.m3 <= 1000) then
                InsertarOrdenado(Lista3, act^.datos)
        end;

        act := act^.sig;
    end;

    InformarArrCat(ArregloConsumoCategoria);
end;

begin
    
end.