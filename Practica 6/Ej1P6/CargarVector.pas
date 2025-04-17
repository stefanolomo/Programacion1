program ManejoVectores;

const
    // Dimension fisica del vector
    DimF = 150;

type
    // cadena20 = String[20];
    Vector = record
        V: Array[1..DimF] of integer;
        DimL: integer;
    end;


// Procedimento para cargar un vector con 150 inputs del usuario
procedure Cargar150(var mV: Vector);

var
    i: integer;

begin
    for i := 1 to DimF do
        read(mV.V[i]);
end;


// Procedimiento para sacar el promedio de los valores de un vector y el % de nros positivos y negativos que lo componen. (Se tiene en cuenta al 0 como un numero positivo)
procedure PromedioPosNeg(var mV: Vector; var porPos: real; var porNeg: real; var promedio: real);

var
    valor, i: integer;
    contPos, contNeg: integer;
    suma: integer;

begin
    suma := 0;
    contPos := 0;
    contNeg := 0;
    for i := 1 to mV.DimL do
        begin
            valor := mV.V[i];

            if (valor >= 0) then contPos := contPos + 1
            else contNeg := contNeg + 1;

            suma := suma + valor;
        end;
    
    porPos := (contPos / mV.DimL) * 100;
    porNeg := (contNeg / mV.DimL) * 100;
    promedio := (suma / mV.DimL) * 100;
end;

begin
    
end.