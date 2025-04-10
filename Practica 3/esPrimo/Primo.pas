Program Primo;

Var 
    digito:   integer;

// Implemente un módulo que reciba un número y retorne verdadero si todos sus dígitos son primos.

// A. Modularice la solución implementando un módulo auxiliar que reciba un dígito (un número entre 0 y 9) y retorne verdadero si es un número primo, o falso en caso contrario.

// B. Utilice este módulo auxiliar para verificar si todos los dígitos del número ingresado son primos

Function EsPrimo(digito: integer):   Boolean;

Begin
    If (Not (digito < 0)) Or (Not (digito > 9)) Then
        Begin
            Case digito Of 
                2, 3, 5, 7:   EsPrimo := True;

                Else EsPrimo := False;
            End;
            
        End;
End;

Begin
    writeln('Ingrese el digito a procesar');
    readln(digito);

    if (EsPrimo(digito)) then writeln('El nro es primo')
    else writeln('El nro no es primo');

End.
