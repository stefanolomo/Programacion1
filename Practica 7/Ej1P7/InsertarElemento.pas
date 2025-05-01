program Insertar;

type
    rango: 1..100;
    dato: integer;
    
    Vector = record
        V: array[rango] of dato;
        DimL: 0..100;
    end;

procedure InsertarPos(var mV: Vector; dato: dato; pos: rango; var exito: boolean);

var
    i: integer;

begin
    exito := False;

    // (mV.DimL < 100) : Hay por lo menos un espacio para insertar datos
    // (pos >= 1) : La posicion es mayor o igual a la primera posicion
    // (pos <= mV.DimL + 1) : La posición es menor o igual a la posicion del ultimo elemento mas uno, esto no permite insertar en lugares que no esten precedidos de un elemento
    if (mV.DimL < 100) and (pos >= 1) and (pos <= mV.DimL + 1) then
        begin
            // Se puede insertar el elemento dado en la posicion pedida
            exito := True;
            
            // Desde la posicion mas alta bajando hasta la posición de insertado
            for i := mV.DimL downto pos do
                begin
                    // Corremos los datos del vector hacia la derecha por un lugar
                    mV.V[i+1] := mV.V[i];
                end;

            // Ya hay un espacio en la posicion ' pos ' entonces insertamos el dato
            mV.V[pos] := dato;

            // Aumentamos en 1 la dimL
            mV.DimL := mV.DimL + 1;
        end;
end;

begin
    
end.