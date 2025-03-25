
Program EsCapicua;

Var 
    numero, digito:   integer;
    invertido, original:   integer;

Begin

    //? Repite infinitamente...
    Repeat
        //$ Inicializa las variables
        invertido := 0;
        digito := 0;
        numero := 0;
        original := 0;

        //> Lee el numero por el teclado y lo guarda en la variable...
        writeln('Ingrese el número para comprobar si es capicua: ');
        read(numero);

        //$ Almacena el numero original en la variable para mas tarde usarlo para comparar...
        original := numero;

        //? Mientras el numero ingresado por teclado no sea cero...
        While (numero <> 0) Do
            Begin
                //$ Tomamos el primer digio de derecha a izquierda...
                digito := numero Mod 10;
                //* El numero invertido lo multiplicamos por 10, osea hacemos espacio para el digito y luego lo sumamos...
                invertido := invertido * 10 + digito;
                //$ dividimos el numero por 10 para procesar el proximo digito...
                numero := numero Div 10;
            End;
        
        //> Informamos por consola el numero invertido...
        writeln('El numero invertido es: ', invertido);

        //? Si el numero invertido es el mismo que el original que se ingreso por teclado es capicua y si no son diferentes entonces no es capicua...
        If (original = invertido) Then writeln('El numero es capicua!')
        Else writeln('El numero no es capicua.');
        
    Until (False);
End.
