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

function CodigoValido():boolean;
begin
    
end;

// a) Módulo 1 (Parte A): Secuencia de 6 caracteres que deben ser letras mayúsculas y números, con al menos 2 de cada uno (ej. si tiene 5 mayúsculas y 1 número no se cumpliría la Parte A de la secuencia).

function CheckParteA(secuencia: string[6]):boolean;

var
    i, contAlfabetico, contDigito: integer;
    caracter: char;
    excluyenteAlfaNumerico: boolean;

begin
    contDigito := 0;
    contAlfabetico := 0;
    excluyenteAlfaNumerico := True;

    for i := 1 to 6 do
        begin
            caracter := secuencia[i];
            if (caracter in ALFABETOMAYUS) then contAlfabetico := contAlfabetico + 1

            else if (caracter in DIGITOS_CHAR) then contDigito := contDigito + 1

            else excluyenteAlfaNumerico := False;
        end;

    // if (contAlfabetico >= 2) and (contDigito >= 2) and (excluyenteAlfaNumerico) then CheckParteA := True
    // else CheckParteA := False;

    CheckParteA := (contAlfabetico >= 2) and (contDigito >= 2) and (excluyenteAlfaNumerico);
end;

//b) Módulo 2 (Parte B): Secuencia de 5 dígitos ordenados en secuencia de menor a mayor que no estén en la Parte A.

function CheckParteA(secuencia: string[5]):boolean;
begin
    if ()
end;

// c) Módulo 3 (Parte C): Secuencia de 7 dígitos o letras que contengan el carácter 'A' seguido de 'B'. En el caso de tener dígitos, estos no deben estar en la Parte A.

function CheckParteA(secuencia: string[7]):boolean;
begin
    if ()
end;