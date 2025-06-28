program ejercicio1;

{ Un banco dispone de una lista en donde almacena la información de aquellos clientes que vienen a
pagar impuestos. De cada cliente conoce: DNI, Nombre, Apellido: tipocadena;, código de impuesto a pagar (1 a 9)
y el monto a pagar. Se pide:
a. Realizar la atención de los clientes hasta que se recaude al menos 100.000 pesos o hasta que
se terminen los clientes.
b. Al finalizar la atención informar el código de impuesto que más veces se pagó por los clientes
que fueron atendidos.
c. Al finalizar la atención informar, en caso de que hayan quedado, la cantidad de clientes sin
atender. }

type
    tipoimpuesto = 1..9;
    tipocadena = string[40];

    registrodatos = record
        DNI: integer;
        Nombre: tipocadena;
        Apellido: tipocadena;
        Impuesto: tipoimpuesto;
        Monto: integer;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

    ArrImp = Array[tipoimpuesto] of integer;

procedure InicializarArrImp(var A: ArrImp);

var
    i: integer;

begin
    for i := 1 to 9 do
        A[i] := 0;
end;

function HallarMaxEnArrImp(A: ArrImp): integer;

var
    max1, maxin, i: integer;

begin
    max1 := -1;

    for i := 1 to 9 do begin
        if (A[i] > max1) then begin
            maxin := i;
            max1 := A[i];
        end;
    end;

    HallarMaxEnArrImp := maxin;
end;

procedure RecorrerLista (Lista: ptrnodo);

var
    totRecaudado, clientesAtendidos, clientesRestantes: integer;
    frecImp: ArrImp;

begin
    clientesAtendidos := 0;
    totRecaudado := 0;
    clientesRestantes := 0;
    InicializarArrImp(frecImp);

    while (Lista <> nil) and (totRecaudado < 100000) do begin
        totRecaudado := totRecaudado + Lista^.datos.monto;
        frecImp[Lista^.datos.impuesto] := frecImp[Lista^.datos.impuesto] + 1;
        clientesAtendidos := clientesAtendidos + 1;

        Lista := Lista^.sig;
    end;

    while (Lista <> nil) do begin
        clientesRestantes := clientesRestantes + 1;
        Lista := Lista^.sig;
    end;

    writeln('Se atendieron ', clientesAtendidos, ' de ', clientesAtendidos + clientesRestantes);
    writeln('Quedan ', clientesRestantes, ' por atender');

    writeln('El impuesto mas pagado es ', HallarMaxEnArrImp(frecImp));
end;

begin
end.