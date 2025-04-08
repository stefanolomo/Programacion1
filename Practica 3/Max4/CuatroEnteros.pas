
Program CuatroEnteros;

// Escriba un módulo Max4 que reciba cuatro enteros y retorne el mayor: 

Var 
    numero1, numero2, numero3, numero4:   integer;



// A. Implemente con una función. B. Implemente la función Max, que recibe 2 enteros y retorna el mayor, y re-implemente la función de A. utilizando Max. C. Compare y reflexione acerca de las implementaciones de a) y b). Piense en la modularización, la expresividad y la legibilidad

// C. La implementación con la modularización que permite la función maximoEntreDos mejora mucho la legibilidad!

Function maximoEntreDos(entero1: integer; entero2: integer):   integer;

Var 
    max:   integer;

Begin
    If (entero1 > entero2) Then max := entero1
    Else If (entero2 > entero1) Then max := entero2;

    maximoEntreDos := max;
End;

Function Max4(entero1: integer; entero2: integer; entero3: integer; entero4:
              integer):   integer;

// Var 
//     max:   integer;

Begin
    // If entero1 > entero2 Then
    //     If entero1 > entero3 Then
    //         If entero1 > entero4 Then
    //             max := entero1
    // Else
    //     max := entero4
    // Else
    //     If entero3 > entero4 Then
    //         max := entero3
    // Else
    //     max := entero4
    // Else
    //     If entero2 > entero3 Then
    //         If entero2 > entero4 Then
    //             max := entero2
    // Else
    //     max := entero4
    // Else
    //     If entero3 > entero4 Then
    //         max := entero3
    // Else
    //     max := entero4;

    max4 := maximoEntreDos(maximoEntreDos(entero1, entero2), maximoEntreDos(
            entero3, entero4));

End;

Begin
    writeln('Ingrese el primer numero: ');
    readln(numero1);
    writeln('Ingrese el segundo numero: ');
    readln(numero2);
    writeln('Ingrese el tercer numero: ');
    readln(numero3);
    writeln('Ingrese el cuarto numero: ');
    readln(numero4);

    writeln('El mas grande de todos es: ', max4(numero1, numero2, numero3,
            numero4));

End.
