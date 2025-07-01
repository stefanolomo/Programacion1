Program Ejercicio4;

const
    DIRECCIONESINTERESADAS = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

{ Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los campos: calle (de 1 a 122), número, piso y departamento. 

Se dispone de una lista con los envíos del año pasado. Se requiere procesar la lista recorriéndola una sola vez para:

a. Informar la cantidad de envíos realizados para cada calle.

b. Informar el nombre del mes con mayor cantidad de paquetes enviados.

c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.

d. Generar 10 nuevas listas con los envíos de las calles 10 a la 20. Cada lista debe estar ordenada por el número de la dirección. }

type
    callesInteresadas = 10..20;
    tipodia = 1..31;
    tipomes = 1..12;
    tipofecha = record
        dia: tipodia;
        mes: tipomes;
        year: integer;
    end;
    tipocalle = 1..122;
    tipodireccion = record
        calle: tipocalle;
        numero: integer;
        piso: integer;
        departamento: integer;
    end;
    paquete = record
        fecha: tipofecha;
        entregado: boolean;
        direccion: tipodireccion;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: paquete;
        sig: ptrnodo;
    end;

    ArrCalle = Array[tipocalle] of integer;
    ArrMes = Array[tipomes] of integer;
    ArrListas = Array[callesInteresadas] of ptrnodo;

procedure InicializarTipoArrCalle(var A: ArrCalle);

var
    i: integer;

begin
    for i := 1 to 122 do
        A[i] := 0;
end;

procedure InicializarTipoArrMes(var A: ArrMes);

var
    i: integer;

begin
    for i := 1 to 12 do
        A[i] := 0;
end;

procedure InicializarTipoArrListas(var A: ArrListas);

var
    i: integer;

begin
    for i := 10 to 20 do
        A[i] := nil;
end;

function HallarMaxEnArrMes(var A: ArrMes): tipomes;

var
    i, max1: integer;
    maxIn: tipomes;

begin
    max1 := -1;
    maxIn := 1;

    for i := 1 to 12 do begin
        if (A[i] > max1) then begin
            maxIn := i;
            max1 := A[i];
        end;
    end;
    HallarMaxEnArrMes := maxIn;
end;

function HallarMaxEnArrCalle(var A: ArrCalle): callesInteresadas;

var
    i, max1: integer;
    maxIn: callesInteresadas;

begin
    max1 := -1;
    maxIn := 10;

    for i := 1 to 122 do begin
        if (A[i] > max1) then begin
            maxIn := i;
            max1 := A[i];
        end;
    end;
    HallarMaxEnArrCalle := maxIn;
end;

procedure LiberarLista(var Lista: ptrnodo);

var
    aux: ptrnodo;

begin
    while (Lista <> nil) do begin
        aux := Lista;
        Lista := Lista^.sig;
        dispose(aux);
    end;
end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: paquete);

var
    ant, act, nodo: ptrnodo;

begin
    ant := nil;
    act := Lista;

    new(nodo);
    nodo^.datos := datos;

    while (act <> nil) and (act^.datos.direccion.numero < nodo^.datos.direccion.numero) do begin
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

procedure InformarArrCalle(A: ArrCalle);

var
    i: integer;

begin
    for i := 1 to 122 do begin
        writeln('Para la calle ', i, ' se entregaron ', A[i], ' paquetes.');
    end;
end;

procedure RecorrerLista(var Lista: ptrnodo; var ListaCalles: ArrListas);

{ Se dispone de una lista con los envíos del año pasado. Se requiere procesar la lista recorriéndola una sola vez para:

a. Informar la cantidad de envíos realizados para cada calle.

b. Informar el nombre del mes con mayor cantidad de paquetes enviados.

c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.

d. Generar 10 nuevas listas con los envíos de las calles 10 a la 20. Cada lista debe estar ordenada por el número de la dirección. }

var
    FrecuenciaCalle: ArrCalle;
    FrecuenciaMes: ArrMes;
    act, ant, aux: ptrnodo;

begin
    ant := nil;
    act := Lista;

    InicializarTipoArrCalle(FrecuenciaCalle);
    InicializarTipoArrMes(FrecuenciaMes);
    InicializarTipoArrListas(ListaCalles);

    while (act <> nil) do begin
        if (act^.datos.entregado) then begin
            FrecuenciaCalle[act^.datos.direccion.calle] := FrecuenciaCalle[act^.datos.direccion.calle] + 1;
            FrecuenciaMes[act^.datos.fecha.mes] := FrecuenciaMes[act^.datos.fecha.mes] + 1;

            if (act^.datos.direccion.calle in DIRECCIONESINTERESADAS) then
                InsertarOrdenado(ListaCalles[act^.datos.direccion.calle], act^.datos);

            ant := act;
            act := act^.sig;
        end else begin
            aux := act;
            act := act^.sig;

            if (ant = nil) then begin
                Lista := act;
            end else begin
                ant^.sig := act;
            end;

            dispose(aux);
        end;
    end;

    writeln('>> El mes en el que se entregaron mas paquetes es: ', HallarMaxEnArrMes(FrecuenciaMes));
    writeln('>> La calle que mas paquetes recibio es: ', HallarMaxEnArrCalle(FrecuenciaCalle));
    writeln('>> Para cada calle se entregaron: ');
    InformarArrCalle(FrecuenciaCalle);
end;

var
    ListaEnvios: ptrnodo;
    ArrListasCalles: ArrListas;
    i: integer; 

begin
    ListaEnvios := nil;

    // CargarListaEnvios (ListaEnvios);

    RecorrerLista(ListaEnvios, ArrListasCalles);

    LiberarLista(ListaEnvios);

    for i := 10 to 20 do
        LiberarLista(ArrListasCalles[i]);
end.