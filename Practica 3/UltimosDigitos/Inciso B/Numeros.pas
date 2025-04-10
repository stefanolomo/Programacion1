
Program NumerosPorTeclado;

Var 
    num:   longint;

// B. Escriba un programa que lea números enteros por teclado hasta que llegue el número 0. Utilice el módulo implementado en a) para imprimir los últimos 3 y 5 dígitos de cada número ingresado

Procedure ultimosDigitos(num: longint; n: integer);

Var 
    digito, i:   integer;

Begin
    For i := 1 To n Do
        Begin
            digito := num Mod 10;
            write(digito);
            num := num Div 10;
        End;
    writeln('');
End;

Begin
    num := 1;

    While (num <> 0) Do
        Begin
            writeln('Ingrese el nro: ');
            readln(num);

            If (num <> 0) Then
                Begin

                    ultimosDigitos(num, 5);
                    ultimosDigitos(num, 3);

                End;

        End;
End.
