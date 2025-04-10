Program Primo;

Var 
    nro:   integer;

// Implemente un módulo que reciba un número y retorne verdadero si todos sus dígitos son primos.

// A. Modularice la solución implementando un módulo auxiliar que reciba un dígito (un número entre 0 y 9) y retorne verdadero si es un número primo, o falso en caso contrario.

// B. Utilice este módulo auxiliar para verificar si todos los dígitos del número ingresado son primos

Function EsPrimoDigito (digito: integer):   Boolean;

Begin
    If (Not (digito < 0)) And (Not (digito > 9)) Then
        Begin
            Case digito Of 
                2, 3, 5, 7:   EsPrimoDigito := True;

                Else EsPrimoDigito := False;
            End;
            
        End;
End;

function EsPrimoNro (nro: integer):boolean;

var
    digito: integer;

begin
    while (nro <> 0) do
        begin
            digito := nro mod 10;

            if not (EsPrimoDigito(digito)) then
                begin
                    EsPrimoNro := False;
                    Exit;
                end; 

            nro := nro div 10;
        end;
    
    EsPrimoNro := True;
    
end;

Begin
    writeln('Ingrese el nro a procesar');
    readln(nro);

    if (EsPrimoNro(nro)) then writeln('El nro tiene todos sus digitos primos')
    else writeln('El nro tiene al menos un digito no primo');

    
End.
