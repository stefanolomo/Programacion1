Program TestDescomponer;

Type
    VectorCodigo = Record
        V: array[1..18] of char;
        DimL: integer;
        DimF: integer;
    End;

    VectorParteA = Record
        V: array[1..6] of char;
        DimL: integer;
        DimF: integer;
    End;

    VectorParteB = Record
        V: array[1..5] of char;
        DimL: integer;
        DimF: integer;
    End;

    VectorParteC = Record
        V: array[1..7] of char;
        DimL: integer;
        DimF: integer;
    End;

Procedure DescomponerVectorCodigo(
    codigo: VectorCodigo;
    Var A: VectorParteA;
    Var B: VectorParteB;
    Var C: VectorParteC
);
Var
    i: integer;
Begin
    // Parte A: V[1..6]
    For i := 1 to 6 do
        A.V[i] := codigo.V[i];
    A.DimL := 6;
    A.DimF := 6;

    // Parte B: V[7..11]
    For i := 1 to 5 do
        B.V[i] := codigo.V[i + 6];
    B.DimL := 5;
    B.DimF := 5;

    // Parte C: V[12..18]
    For i := 1 to 7 do
        C.V[i] := codigo.V[i + 11];
    C.DimL := 7;
    C.DimF := 7;
End;

Var
    codigo: VectorCodigo;
    A: VectorParteA;
    B: VectorParteB;
    C: VectorParteC;
    i: integer;
    datos: string;

Begin
    // Cargar 18 caracteres: a..r
    datos := '1bc2ef3h4jk5mn6pqr'; // 18 caracteres
    For i := 1 to 18 do
        codigo.V[i] := datos[i];
    codigo.DimL := 18;
    codigo.DimF := 18;

    // Descomposición
    DescomponerVectorCodigo(codigo, A, B, C);

    // Mostrar resultados
    Write('Parte A: ');
    For i := 1 to A.DimL do
        Write(A.V[i], ' ');
    Writeln;

    Write('Parte B: ');
    For i := 1 to B.DimL do
        Write(B.V[i], ' ');
    Writeln;

    Write('Parte C: ');
    For i := 1 to C.DimL do
        Write(C.V[i], ' ');
    Writeln;
End.
