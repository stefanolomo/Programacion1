
Program Capicua;

var
    num: integer;


// Escriba un módulo que reciba un entero y retorne si es capicúa (mismo número de izquierda a derecha que de derecha a izquierda).

Function Capicua(num: integer):   boolean;

Var 
    original, digito, reves:   integer;

Begin
    original := num;
    reves := 0;

    While (num <> 0) Do
        Begin
            digito := num Mod 10;

            reves := reves * 10 + digito;

            num := num Div 10;
        End;

    If (reves = original) Then Capicua := True
    Else Capicua := False;

End;

begin
    while (True) do
        begin
            writeln('Ingrese el numero a analizar: ');
            readln(num);

            if (Capicua(num)) then writeln('El numero ingresado es capicua')
            else writeln('El numero ingresado no es capicua');

        end;

end.
