program Ejercicio4;

// Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita almacenarlos y escribir un programa que implemente:

// a) Un módulo que reciba una lista de aviones y un avión y lo agregue a la lista. Se sabe que la lista está ordenada por marca en forma descendente y se pide agregar el avión a la lista de forma que se mantenga el orden.

// b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no.

type
    tipocadena = string[40];

    registrodatos = record
        marca: tipocadena;
        modelo: tipocadena;
        cantAsientos: integer;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: registrodatos);

var
    ant, act, nodo: ptrnodo;

begin
    ant := nil;
    act := Lista;

    new(nodo);
    nodo^.datos := datos;

    while (act <> nil) and (act^.datos.marca > nodo^.datos.marca) do begin
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

function SonIguales(datos1, datos2: registrodatos): boolean;

begin
    SonIguales := (datos1.marca = datos2.marca) and (datos1.modelo = datos2.modelo) and (datos1.cantAsientos = datos2.cantAsientos);
end;

procedure EliminarAvion(var Lista: ptrnodo; datos: registrodatos; var exito: boolean);

var
    ant, act: ptrnodo;

begin
    ant := nil;
    act := Lista;

    while (act <> nil) and (not SonIguales(act^.datos, datos)) do begin
        ant := act;
        act := act^.sig;
    end;

    if (act = nil) then begin
        exito := False;
    end else begin
        if (ant = nil) then begin
            Lista := act^.sig;
        end else begin
            ant^.sig := act^.sig;
        end;

        dispose(act);
        exito := True;
    end;
end;

procedure Leerdatos(var datos: registrodatos);

begin
    writeln('Ingresar el modelo de avion: ');
    readln(datos.modelo);
    if (datos.modelo <> 'ZZZ') then begin
        writeln('Ingresar la marca del avion: ');
        readln(datos.marca);
        writeln('Ingresar la cantidad de asientos del avion: ');
        readln(datos.cantAsientos);
    end;
end;

procedure CargarLista(var Lista: ptrnodo);

var
    datos: registrodatos;

begin
    repeat    
        Leerdatos(datos);

        if (datos.modelo <> 'ZZZ') then
            InsertarOrdenado(Lista, datos);
    until (datos.modelo = 'ZZZ');
end;

procedure LiberarLista(var Lista: ptrnodo);

var
    act: ptrnodo;

begin
    act := Lista;
    while (Lista <> nil) do begin
        act := Lista;
        Lista := Lista^.sig;
        dispose(act);
    end;
end;

procedure InformarLista (Lista: ptrnodo);

var
    i: integer;
    datos: registrodatos;

begin
    i := 0;

    while (Lista <> nil) do begin
        i := i + 1;
        datos := Lista^.datos;

        writeln('Nodo ', i);

        writeln('Modelo de avion: ');
        writeln(datos.modelo);
        writeln('Marca del avion: ');
        writeln(datos.marca);
        writeln('Cantidad de asientos del avion: ');
        writeln(datos.cantAsientos);

        Lista := Lista^.sig;
    end;
    
    writeln('En la lista habia/n ', i, ' elemento/s.');
end;

procedure EliminarLista(var Lista: ptrnodo; var exito: boolean);

var
    datos: registrodatos;

begin
    repeat
        Leerdatos(datos);
        if (datos.modelo <> 'ZZZ') then
            EliminarAvion(Lista, datos, exito);
            if (exito) then
                writeln('Se eliminó con exito')
            else
                writeln('No se entrontro el avion a eliminar');
    until (datos.modelo = 'ZZZ');
end;

var
    ListaAviones: ptrnodo;
    exito: boolean;

begin
    CargarLista(ListaAviones);

    InformarLista(ListaAviones);

    writeln('----------');

    EliminarLista(ListaAviones, exito);

    writeln('----------');

    LiberarLista(ListaAviones);
end.