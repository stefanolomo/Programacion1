
Program UltimosNDigitos;


// A. Implemente un módulo que permita imprimir los últimos dígitos de un número en orden inverso. El módulo debe recibir el número y la cantidad de dígitos a imprimir. Si recibe el número 1954 y la cantidad 3, debe imprimir 4 - 5 - 9. 

// B. Escriba un programa que lea números enteros por teclado hasta que llegue el número 0. Utilice el módulo implementado en a) para imprimir los últimos 3 y 5 dígitos de cada número ingresado

Var 
    numero, digitos:   integer;

Procedure ultimosDigitos(num: integer; n: integer);

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
    writeln('Ingrese su numero: ');
    readln(numero);
    writeln('Ingrese la cantidad de digitos que quiere obtener: ');
    readln(digitos);
    ultimosDigitos(numero, digitos);

End.
