program Ejercicio3;

const
    YEARACTUAL = 2025;

{ Se dispone de una lista con la información de los ingresantes a la Facultad en el año anterior. De cada
ingresante se conoce: apellido, nombre, ciudad de origen, fecha de nacimiento (día, mes, año), si presentó el título del colegio secundario y el código de la carrera en la que se inscribe (1: APU, 2: ATIC, 3: LI, 4: LS, 5: IC, 6: CDO). Con esta información de los ingresantes se pide que recorra la lista una vez para:

a. Informar el apellido de los ingresantes cuya ciudad origen es “Chacabuco”.

b. Calcular e informar el año en que más ingresantes nacieron (asumir que los años de nacimientos de los ingresantes pueden variar entre 1975 y 2006).

c. Informar la carrera con la mayor cantidad de inscriptos.

d. Eliminar de la lista aquellos ingresantes que no presentaron el título. }

type
    tipocadena = string[40];
    tipodia = 1..31;
    tipomes = 1..12;
    tipoyear = 1974..2006;
    tipofecha = record
        dia: tipodia;
        mes: tipomes;
        year: tipoyear;
    end;
    tipocarrera = 1..6;

    registrodatos = record
        Apellido: tipocadena;
        Nombre: tipocadena;
        Ciudad: tipocadena;
        Nacimiento: tipofecha;
        Secundario: boolean;
        Carrera: tipocarrera;
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

    ArrCarrera = Array[tipocarrera] of Integer;
    ArrEdades = Array[tipoyear] of Integer;

procedure InicializarArrCarrera(var A: ArrCarrera);

var
    i: integer;

begin
    for i := 1 to 6 do
        A[i] := 0;
end;

procedure InicializarArrEdades(var A: ArrEdades);

var
    i: integer;

begin
    for i := 1974 to 2006 do
        A[i] := 0;
end;

function Edad(year: tipoyear): integer;

begin
    Edad := YEARACTUAL - year;
end;

function HallarMaxEnArrCarrera(A: ArrCarrera): integer;

var
    i, maxIn, max1: integer;

begin
    max1 := -1;
    maxIn := 1;

    for i := 1 to 6 do begin
        if (A[i] > max1) then begin
            maxIn := i;
            max1 := A[i];
        end;
    end;

    HallarMaxEnArrCarrera := maxIn;
end;

function HallarMaxEnArrEdades(A: ArrEdades): integer;

var
    i, maxIn: tipoyear;
    max1: integer;

begin
    max1 := -1;
    maxIn := 2006;

    for i := 1974 to 2006 do begin
        if (A[i] > max1) then begin
            maxIn := i;
            max1 := A[i];
        end;
    end;

    HallarMaxEnArrEdades := maxIn;
end;

procedure RecorrerLista(var Lista: ptrnodo);

var
    ant, act, aux: ptrnodo;
    FrecuenciaCarreras: ArrCarrera;
    FrecuenciaEdades: ArrEdades;

begin
    InicializarArrCarrera(FrecuenciaCarreras);
    InicializarArrEdades(FrecuenciaEdades);

    ant := nil;
    act := Lista;

    while (act <> nil) do begin
        if act^.datos.Secundario then begin
            if (act^.datos.Ciudad = 'Chacabuco') then
                writeln('El alumno de apellido ', act^.datos.Apellido, ' nació en Chacabuco');
            
            FrecuenciaEdades[act^.datos.Nacimiento.year] := FrecuenciaEdades[act^.datos.Nacimiento.year] + 1;
            FrecuenciaCarreras[act^.datos.Carrera] := FrecuenciaCarreras[act^.datos.Carrera] + 1;

            ant := act;
            act := act^.sig;
        end else begin
            // Eliminar el nodo
            aux := act;
            act := act^.sig;

            if (ant = nil) then
                Lista := act
            else
                ant^.sig := act;

            dispose(aux);
        end;
    end;

    writeln('La carrera con mas inscriptos es la que tiene el codigo: ', HallarMaxEnArrCarrera(FrecuenciaCarreras));

    writeln('La mayoria de los ingresantes nacieron en el año: ', HallarMaxEnArrEdades(FrecuenciaEdades));
end;

var
    ListaEstudiantes: ptrnodo;

begin
    // CargarLista(ListaEstudiantes);

    RecorrerLista(ListaEstudiantes);
    
    // LiberarLista(ListaEstudiantes);
end.