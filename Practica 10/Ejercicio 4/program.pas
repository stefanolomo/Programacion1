Program Ejercicio4;

{ Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los campos: calle (de 1 a 122), número, piso y departamento. 

Se dispone de una lista con los envíos del año pasado. Se requiere procesar la lista recorriéndola una sola vez para:

a. Informar la cantidad de envíos realizados para cada calle.

b. Informar el nombre del mes con mayor cantidad de paquetes enviados.

c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.

d. Generar 10 nuevas listas con los envíos de las calles 10 a la 20. Cada lista debe estar ordenada por el número de la dirección. }

type
    callesInteresadas = 10..20;
    tipodia = 1..31;
    mes = 1..12;
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
        Fecha: tipofecha;
        Entregado: boolean;
        Direccion: tipodireccion;
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

    for i := 10 to 20 do begin
        if (A[i] > max1) then begin
            maxIn := i;
            max1 := A[i];
        end;
    end;
    HallarMaxEnArrCalle := maxIn;
end;

procedure LiberarLista(var Lista: ptrnodo);

begin
end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: paquete);

begin
end;

procedure RecorrerLista(var Lista: ptrnodo);

begin
    
end;

begin
end.