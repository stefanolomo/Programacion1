program LosDosNumerosMasChicos;

function TwoSmallestOf(numero:integer):string;
var
    // min1, min2: Son nuestros minimos a encontrar...
    // digito es el digito que se esta procesando actualmente...
    min1, min2, digito: integer;
    s1, s2: string;
begin
    // Inicializamos las variables...
    min1 := 9;
    min2 := 9;

    // Mientras el numero no sea cero...
    while (numero <> 0) do
        begin
            // El digito a procesar es el resto de dividirlo ebtre 10...
            digito := numero mod 10;

            // Si el digito es menor que el primer minimo...
            if (digito < min1) then
                begin
                    // Actualizamos el segundo minimo con el valor del primero...
                    min2 := min1;
                    // Y actualizamos el primero con el valor del digito...
                    min1 := digito;
                end
            // Y si el digito es menor que el segundo minimo...
            else if (digito < min2) then
                begin
                    // Solamente actualizamos el segundo minimo...
                    min2 := digito;
                end;
            // Cuando terminamos, dividimos entre 10 para eliminar el digito ya procesado y pasar al siguiente
            numero := numero div 10;
        end;

    // Convertimos los enteros a cadenas
    str(min1, s1);
    str(min2, s2);

    TwoSmallestOf := 'El primer digito mas chico es: ' + s1 + ' y el segundo es ' + s2;
end;

begin
    writeln(TwoSmallestOf(291))
end.