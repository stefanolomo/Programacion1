program Ej2P7;

const
    SUP = 10;
    INF = 1;

{ *Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A del cual se suprimen las componentes que se encuentran entre las posiciones I y J (inclusive las componentes de dichas posiciones) }

type
    rango = INF..SUP;
    Vector = Array[rango] of integer;

procedure EliminarRango(var V: Vector; lsup: rango; linf: rango);

var
    i: integer;

begin
    for i := lsup downto linf do begin
        V[i] := V[i+1];
    end;
end;

begin
end.