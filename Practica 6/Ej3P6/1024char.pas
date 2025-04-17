program MinVeinticuatroCaracteres;

const
    DimF = 1024;
    DIGITOS = ['0'..'9'];
    MAYUS = ['A'..'Z'];
    MINUS = ['a'..'z'];
    CONMAYUS = ['A'..'Z'] - ['A', 'E', 'I', 'O', 'U'];
    CONMINUS = ['a'..'z'] - ['a', 'e', 'i', 'o', 'u'];
    CORTE: '.';

type
    Vector = record
        V: Array[1..DimF] of char;
        DimL: integer;
    end;

// Se requiere analizar un fragmento de código fuente que contiene 1024 caracteres. Realizar un programa que lea del teclado los caracteres y los cargue en un vector.
// Finalizada la carga informar:

// a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
// b) La cantidad y porcentaje de caracteres que son: dígitos, letras mayúsculas y letras minúsculas sobre el total de caracteres ingresados.


// Leer por teclado y cargar 1024 caracteres en el vector. [Asume que el vector esta vacio]
procedure CargarCaracteres(var mV: Vector);

var
    i: integer;
    caracter: char;
    continuar: boolean;

begin
    i := 1;
    continuar := True;

    while (i <= DimF) and (continuar) do
        begin
            read(caracter);

            if(caracter = CORTE) then continuar := False
            else
                begin
                    mV.V[i] := caracter;
                    i := i + 1;
                end;
        end;
    
    if (i = DimF) then mV.DimL := i
    else mV.DimL := i - 1;
end;

// La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos
procedure calcularConsonantes(mV: Vector; var cantCon: integer; var porCon: real);

var
    i: integer;
    contadorAlfabetico: integer;

begin
    contadorAlfabetico := 0;
    cantCon := 0;

    for i := 1 to mV.DimL do
        begin
            if (mV.V[i] in MAYUS) or (mV.V[i] in MINUS) then contadorAlfabetico := contadorAlfabetico + 1;
            if (mV.V[i] in CONMAYUS) or (mV.V[i] in CONMINUS) then cantCon := cantCon + 1;
        end;
    
    if (contadorAlfabetico > 0) then porCon := (cantCon / contadorAlfabetico) * 100
    else porCon := 0;
    
end;

//La cantidad y porcentaje de caracteres que son: dígitos, letras mayúsculas y letras minúsculas sobre el total de caracteres ingresados
procedure calcularCaracteres(mV: Vector; var cantDig: integer; var cantMayus: integer; var cantMinus: integer; var porDig: real; var PorMayus: real; var porMinus: real);

var
    i: integer;
    
begin
    cantDig := 0;
    cantMayus := 0;
    cantMinus := 0;

    for i := 1 to mV.DimL do
        begin
            if (mV.V[i] in DIGITOS) then cantDig := cantDig + 1
            else if (mV.V[i] in MAYUS) then cantMayus := cantMayus + 1
            else if (mV.V[i] in MINUS) then cantMinus := cantMinus + 1;
        end;
    
    porDig := (cantDig / mV.DimL) * 100;
    porMayus := (cantMayus / mV.DimL) * 100;
    porMinus := (cantMinus / mV.DimL) * 100;
end;

var
    v: Vector;
    cantCon: integer;
    porCon: real;
    cantDig, cantMayus, cantMinus: integer;
    porDig, porMayus, porMinus: real;


begin
    // Cargar los caracteres desde la consola
    CargarCaracteres(v);
    
    // Calcular consonantes
    calcularConsonantes(v, cantCon, porCon);
    
    // Calcular caracteres
    calcularCaracteres(v, cantDig, cantMayus, cantMinus, porDig, porMayus, porMinus);
    
    // Mostrar resultados
    writeln('--- RESULTADOS ---');
    writeln('Consonantes: ', cantCon, ' (', porCon:0:2, '% del total de caracteres alfabeticos)');
    writeln('Dígitos: ', cantDig, ' (', porDig:0:2, '%)');
    writeln('Letras Mayúsculas: ', cantMayus, ' (', porMayus:0:2, '%)');
    writeln('Letras Minúsculas: ', cantMinus, ' (', porMinus:0:2, '%)');
end.