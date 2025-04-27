Program TPIntegrador;

const
    ALFABETOMAYUS = ['A'..'z'];
    ALFABETOMINUS = ['a'..'z'];
    DIGITOS_CHAR = ['0'..'9'];
    DIGITOS_INT = [0..9];

// 1. Validación de ID del robot: Implementar un módulo que valide el ID del robot. Para ello desarrolle un módulo cuya tarea sea descomponer un número que recibe como parámetro y retorne la suma de sus dígitos. Un ID del robot es válido si la suma de sus dígitos es mayor que la suma de los dígitos del ID del fabricante

Function IdValida(IdRobot: integer; IdFabricante: integer):   boolean;

Var 
    sumaRobot, sumaFabricante, digito:   integer;

Begin
    sumaRobot := 0;
    sumaFabricante := 0;

    // Descompone los digitos del ID del robot y los suma
    While (IdRobot <> 0) Do
        Begin
            digito := IdRobot Mod 10;
            sumaRobot := sumaRobot + digito;
            IdRobot := IdRobot Div 10;
        End;

    // Descompone los digitos del ID del fabricante y los suma
    While (IdFabricante <> 0) Do
        Begin
            digito := IdFabricante Mod 10;
            sumaFabricante := sumaFabricante + digito;
            IdFabricante := IdFabricante Div 10;
        End;

    // Si la suma de los digitos del robot es mayor a la del fabricante entonces la ID es válida
    If (sumaRobot > sumaFabricante) Then IdValida := True
    Else IdValida := False;
End;

// 2. Validación del código de robot Implemente un módulo que valide el código del robot. Para ello, desarrolle una serie de submódulos que procesen los caracteres del código y analicen si se cumple con el siguiente patrón ABC:

// a) Módulo 1 (Parte A): Secuencia de 6 caracteres que deben ser letras mayúsculas y números, con al menos 2 de cada uno (ej. si tiene 5 mayúsculas y 1 número no se cumpliría la Parte A de la secuencia).

function CheckParteA(secuencia: array[1..6] of char):boolean;

begin
    
end;

// b) Módulo 2 (Parte B): Secuencia de 5 dígitos ordenados de menor a mayor que no estén en la Parte A.

// Procedimientos para extraer digitos que hay en una secuencia y volcarlos a un conjunto
procedure ExtraerDigitosParteA(secuencia: array[1..6] of char; var conjunto: set of char);
begin
    for i := 1  to 6 do
        begin
            caracter := secuencia[i];
            conjunto := conjunto + [caracter];
        end;
end;

function CheckParteB(secuencia: array[1..5] of char):boolean;
begin
    
end;

// c) Módulo 3 (Parte C): Secuencia de 7 dígitos o letras que contengan el carácter 'A' seguido de 'B'. En el caso de tener dígitos, estos no deben estar en la Parte A.

function CheckParteC(secuencia: array[1..7] of char):boolean;
begin

end;

function CodigoValido(ArrParteA: array of char; ArrParteB: array of char; ArrParteC: array of char):boolean;

begin
    CodigoValido := CheckParteA(ArrParteA) and CheckParteB(ArrParteB) and CheckParteC(ArrParteC);
end;



// Programa Principal

begin
    
end.