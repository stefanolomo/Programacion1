program ejercicio6;

// 6. Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro. ticket, monto) correspondientes a sus 6 cajas. Escribir un programa que procese dicha lista y permita:
// - A. Genere una nueva lista con los tickets con montos menores a $1000.
// - B. Calcular e informar el monto promedio recaudado por caja.
// - C. Calcular que cajas que recaudaron más de $12000 con menos de 100 tickets. Luego vuelva a recorrer la lista para generar una nueva con los tickets pertenecientes a las cajas que cumplan dicha condición. Recuerde usar un conjunto para mejorar la eficiencia

const
    MONTOMENOR = 1000;
    MONTOMAYOR = 12000;
    ENTRADASMAYOR = 100;

type
    tipocaja = 1..6;

    registrodatos = record
        caja: tipocaja;
        numero: integer;
        monto: real;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

    arrCajas = array [tipocaja] of real;
    conjCajas = set of tipocaja;

procedure InformarLista (Lista: ptrnodo);

var
    i: integer;

begin
    i := 0;

    while (Lista <> nil) do begin
        i := i + 1;

        writeln('Nodo ', i);

        writeln('Caja: ', Lista^.datos.caja);
        writeln('Numero de ticket: ', Lista^.datos.numero);
        writeln('Monto: ', Lista^.datos.monto:0:2);

        Lista := Lista^.sig;
    end;
    
    writeln('En la lista habia/n ', i, ' elemento/s.');
end;

procedure Leerdatos(var datos: registrodatos);

begin
    writeln('Ingresar el nro de caja: ');
    readln(datos.caja);
    writeln('Ingresar el nro de ticket: ');
    readln(datos.numero);
    writeln('Ingresar el monto: ');
    readln(datos.monto);
end;

function EsMenorAMinimo(monto: real): boolean;

begin
    EsMenorAMinimo := (monto < MONTOMENOR);
end;

function EsMayorAMax(monto: real; entradas: real):boolean;

begin
    EsMayorAMax := (monto > MONTOMAYOR) and (entradas < ENTRADASMAYOR);
end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: registrodatos);

var
    ant, act, nodo: ptrnodo;

begin
    act := Lista;
    ant := nil;

    new(nodo);
    nodo^.datos := datos;

    while (act <> nil) and (act^.datos.numero <= nodo^.datos.numero) do begin
        ant := act;
        act := act^.sig;
    end;

    if (ant = nil) then begin
        nodo^.sig := Lista;
        Lista := nodo;
    end
    else begin
        ant^.sig := nodo;
        nodo^.sig := act;
    end;
end;

procedure CalcularPromedio (CantEntVendidas, Recaudacion: arrCajas; var MontoPromedio: arrCajas);

var
    i: integer;

begin
    for i := 1 to 6 do begin
        if (CantEntVendidas[i] <> 0) then
            MontoPromedio[i] := Recaudacion[i] / CantEntVendidas[i]
        else
            MontoPromedio[i] := 0;
    end;
end;

procedure InformarArrayCajas (arrCajas: arrCajas);

var
    i: integer;

begin
    for i := 1 to 6 do begin
        writeln('En la caja ', i, ': ');
        writeln(arrCajas[i]:0:2);
    end;
end;

procedure AgregarCajas (CantEntVendidas, Recaudacion: arrCajas; var conjCajas: conjCajas);

var
    i: integer;

begin
    for i := 1 to 6 do begin
        if EsMayorAMax(Recaudacion[i], CantEntVendidas[i]) then begin
            conjCajas := conjCajas + [i];
            writeln(i);
        end;
    end;
end;

procedure InicializarArrCajas(var Arreglo: arrCajas);

var
    i: integer;

begin
    for i := 1 to 6 do begin
        Arreglo[i] := 0;
    end;
end;

procedure Recorrer1 (Lista: ptrnodo; var ListaA: ptrnodo; var ConjuntoDeCajas: conjCajas);

var
    MontoPromedio, Recaudacion, CantEntVendidas: arrCajas;

begin
    InicializarArrCajas(MontoPromedio);
    InicializarArrCajas(Recaudacion);
    InicializarArrCajas(CantEntVendidas);

    while (Lista <> nil) do begin
        if EsMenorAMinimo(Lista^.datos.monto) then
            InsertarOrdenado(ListaA, Lista^.datos);
        
        CantEntVendidas[Lista^.datos.caja] := CantEntVendidas[Lista^.datos.caja] + 1;
        Recaudacion[Lista^.datos.caja] := Recaudacion[Lista^.datos.caja] + Lista^.datos.monto;

        Lista := Lista^.sig;
    end;

    CalcularPromedio(CantEntVendidas, Recaudacion, MontoPromedio);
    writeln('El monto promedio por caja fue: ');
    InformarArrayCajas(MontoPromedio);

    writeln('La recaudacion de cada caja fue: ');
    InformarArrayCajas(Recaudacion);

    writeln('La cantidad de entradas vendidas de cada caja fue: ');
    InformarArrayCajas(CantEntVendidas);

    AgregarCajas(CantEntVendidas, Recaudacion, ConjuntoDeCajas);
end;

procedure Recorrer2 (Lista: ptrnodo; var ListaC: ptrnodo; var ConjuntoDeCajas: conjCajas);

begin
    while (Lista <> nil) do begin
        if Lista^.datos.caja in ConjuntoDeCajas then
            InsertarOrdenado(ListaC, Lista^.datos);

        Lista := Lista^.sig;
    end;
end;

procedure CargarLista(var Lista: ptrnodo);

var
    datos: registrodatos;

begin
    repeat    
        Leerdatos(datos);

        if (datos.numero <> 0) then
            InsertarOrdenado(Lista, datos);
    until (datos.numero = 0);
end;

var
    ListaTickets, ListaA, ListaC: ptrnodo;
    ConjuntoDeCajas: conjCajas;

begin
    ConjuntoDeCajas := [];

    CargarLista(ListaTickets);

    writeln('En la lista de tickets hay: ');
    InformarLista(ListaTickets);

    Recorrer1(ListaTickets, ListaA, ConjuntoDeCajas);

    Recorrer2(ListaTickets, ListaC, ConjuntoDeCajas);

    writeln('En la lista del punto A (Todos los tickets con un monto menor a 1000) hay: ');
    InformarLista(ListaA);

    writeln('En la lista del punto C (Todos los tickets de las cajas que recaudaron mas de 12mil pesos vendiendo menos de 100 tickets): ');
    InformarLista(ListaC);
end.