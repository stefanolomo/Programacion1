program ejercicio5;

//  Un congreso de Informática dispone de una lista con la información de sus participantes. De cada participante, se conoce: Apellido y Nombre, año de nacimiento, Área de Investigación a la que se dedica y País de procedencia.
// Se desea procesar la información para:
// a) Informar los nombres de las participantes menores de 30 años, con país de procedencia “Argentina” y cuya Área de Investigación es “Accesibilidad Web”. Además, la cantidad total de participantes que cumplen con tal condición.
// b) Calcular e informar el porcentaje de participantes que provienen de países que no son “Argentina”.
// c) Generar una nueva lista ordenada por Área de Investigación.

type
    tipocadena = string[40];

    registrodatos = record
        Apellido: tipocadena;
        Nombre: tipocadena;
        Nacimiento: integer;
        Area: tipocadena;
        Pais: tipocadena;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

function Edad(nacimiento: integer): integer;

begin
    Edad := 2025 - nacimiento;
end;

function EsArgentino(nacionalidad: tipocadena): boolean;

begin
    EsArgentino := (nacionalidad = 'Argentina');
end;

function EsMenorDe30(nacimiento: integer): boolean;

begin
    EsMenorDe30 := (Edad(nacimiento) < 30);
end;

function CalcularPorcentajeExtranjeros(cantArg, cantExtr: integer): real;

begin
    CalcularPorcentajeExtranjeros := ((cantExtr) / (cantArg + cantExtr)) * 100;
end;

function CumpleParteA(datos: registrodatos): boolean;

begin
    CumpleParteA := EsMenorDe30(datos.Nacimiento) and (EsArgentino(datos.Pais)) and (datos.Area = 'Accesibilidad Web');
end;

procedure InformarParticipante(datos: registrodatos);

begin
    writeln('Nombre: ', datos.Nombre);
    writeln('Apellido: ', datos.Apellido);
    writeln('Año de nacimiento: ', datos.Nacimiento);
    writeln('Pais de procedencia: ', datos.Pais);
end;

procedure InsertarOrdenado(var Lista: ptrnodo; datos: registrodatos);

var
    ant, act, nodo: ptrnodo;

begin
    ant := nil;
    act := Lista;

    new(nodo);
    nodo^.datos := datos;

    while (act <> nil) and (act^.datos.Area < nodo^.datos.Area) do begin
        ant := act;
        act := act^.sig;
    end;

    if (ant = nil) then begin
        nodo^.sig := Lista;
        Lista^.sig := nodo; 
    end else begin
        ant^.sig := nodo;
        nodo^.sig := act;
    end;
end;

procedure LiberarLista(var Lista: ptrnodo);

var
    act: ptrnodo;

begin
    while (Lista <> nil) do begin
        act := Lista;
        Lista := Lista^.sig;
        dispose(act);
    end;
end;

procedure RecorrerLista(Lista: ptrnodo; var ListaC: ptrnodo);

var
    act: ptrnodo;
    contadorPuntoA, Arg, Ext: integer;

begin
    act := Lista;

    contadorPuntoA := 0;
    Arg := 0;
    Ext := 0;

    while (act <> nil) do begin
        if CumpleParteA(act^.datos) then begin
            contadorPuntoA := contadorPuntoA + 1;

            InformarParticipante(act^.datos);
        end;

        if EsArgentino(act^.datos.Pais) then
            Arg := Arg + 1
        else begin
            Ext := Ext + 1;
        end;

        InsertarOrdenado(ListaC, act^.datos); 

        act := act^.sig;
    end;

    writeln('La cantidad de participantes que cumplen los requisitos son: ', contadorPuntoA);

    writeln('El porcentaje de participantes extranjeros es de ', CalcularPorcentajeExtranjeros(Arg, Ext):0:2, '%');
end;

var

begin
end.