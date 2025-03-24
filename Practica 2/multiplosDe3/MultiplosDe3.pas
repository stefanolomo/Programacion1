
Program Multiplos;

var 
    digito, num:   integer;

Begin
    
    num := 0;
    writeln('Ingrese el numero a analizar: ');
    readln(num);
    while (num > 0) do
        Begin
            digito := num mod 10;
            // Extraemos el último dígito

            if (digito mod 3 = 0) then
                writeln(digito, ' es multiplo de 3')
                // Si es múltiplo de 3, lo imprimimos

            else if (digito mod 3 <> 0) then
                writeln(digito, ' no es multiplo de 3');
            
            num := num div 10;
            // writeln(num)
            // Eliminamos el último dígito
        End;


End.
