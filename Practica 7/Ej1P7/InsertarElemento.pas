program Insertar;

{ Realizar un módulo que reciba un vector V, un valor N y un número I, y que devuelva el mismo vector
donde se insertó el valor N en la posición I. }

type
    rango = 1..100;
    
    Vector = record
        V: array[rango] of longint;
        DimL: 0..100;
    end;

procedure InsertarPos(var mV: Vector; dato: longint; pos: rango; var exito: boolean);
var
    i: longint;
begin
    exito := False;
    if (mV.DimL < 100) and (pos >= 1) and (pos <= mV.DimL + 1) then
    begin
        exito := True;
        for i := mV.DimL downto pos do
            mV.V[i+1] := mV.V[i];
        mV.V[pos] := dato;
        mV.DimL := mV.DimL + 1;
    end;
end;

procedure CargarVector(var mV: Vector);
var
    dato: longint;
    posicion: integer;
    seguir: boolean;
    exito: boolean;
    seguirChar: char;
begin
    seguir := True;
    repeat
        writeln('En que posicion quiere insertar? (1 a ', mV.DimL + 1, ')');
        readln(posicion);

        if (posicion < 1) or (posicion > mV.DimL + 1) then
            writeln('Posicion invalida, intente de nuevo.')
        else
        begin
            writeln('Que valor quiere insertar?');
            readln(dato);

            InsertarPos(mV, dato, posicion, exito);

            if exito then
                writeln('Se inserto en la posicion con exito!')
            else
                writeln('No se pudo insertar en la posicion');
        end;

        writeln('Quiere seguir? s/n');
        readln(seguirChar);
        seguir := (seguirChar <> 'n');
    until (not seguir);
end;

procedure InicializarVector(var V: Vector);
var
    i: integer;
begin
    for i := 1 to 100 do
        V.V[i] := 0;
    V.DimL := 0;
end;

procedure InformarVector(V: Vector);
var
    i: longint;
begin
    writeln('Vector actual:');
    for i := 1 to V.DimL do
        writeln('Posicion ', i, ': ', V.V[i]);
end;

var
    VectorPosiciones: Vector;

begin
    InicializarVector(VectorPosiciones);
    CargarVector(VectorPosiciones);
    InformarVector(VectorPosiciones);
end.
program Insertar;

type
    rango = 1..100;
    
    Vector = record
        V: array[rango] of longint;
        DimL: 0..100;
    end;

procedure InsertarPos(var mV: Vector; dato: longint; pos: rango; var exito: boolean);
var
    i: longint;
begin
    exito := False;
    if (mV.DimL < 100) and (pos >= 1) and (pos <= mV.DimL + 1) then
    begin
        exito := True;
        for i := mV.DimL downto pos do
            mV.V[i+1] := mV.V[i];
        mV.V[pos] := dato;
        mV.DimL := mV.DimL + 1;
    end;
end;

procedure CargarVector(var mV: Vector);
var
    dato: longint;
    posicion: integer;
    seguir: boolean;
    exito: boolean;
    seguirChar: char;
begin
    seguir := True;
    repeat
        writeln('En que posicion quiere insertar? (1 a ', mV.DimL + 1, ')');
        readln(posicion);

        if (posicion < 1) or (posicion > mV.DimL + 1) then
            writeln('Posicion invalida, intente de nuevo.')
        else
        begin
            writeln('Que valor quiere insertar?');
            readln(dato);

            InsertarPos(mV, dato, posicion, exito);

            if exito then
                writeln('Se inserto en la posicion con exito!')
            else
                writeln('No se pudo insertar en la posicion');
        end;

        writeln('Quiere seguir? s/n');
        readln(seguirChar);
        seguir := (seguirChar <> 'n');
    until (not seguir);
end;

procedure InicializarVector(var V: Vector);
var
    i: integer;
begin
    for i := 1 to 100 do
        V.V[i] := 0;
    V.DimL := 0;
end;

procedure InformarVector(V: Vector);
var
    i: longint;
begin
    writeln('Vector actual:');
    for i := 1 to V.DimL do
        writeln('Posicion ', i, ': ', V.V[i]);
end;

var
    VectorPosiciones: Vector;

begin
    InicializarVector(VectorPosiciones);
    CargarVector(VectorPosiciones);
    InformarVector(VectorPosiciones);
end.
