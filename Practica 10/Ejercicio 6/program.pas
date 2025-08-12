Program facultad;
// La facultad de informática decide abrir 10 cursos de actualización (cuyos códigos se numeran del 1 al 10) para sus graduados. A cada inscripto se le solicita la siguiente información: DNI, apellido, nombre, edad y el código del curso al que se desea inscribir (una persona se puede inscribir solo a un curso). La facultad dispone de una estructura en la que se almacena para cada código de curso el cupo máximo de personas que pueden inscribirse a ese curso. Se pide:

// A. Simular el proceso de inscripción de los graduados a los cursos. El proceso de inscripción finaliza cuando llega un graduado con apellido “zzz”. Para cada inscripción se debe controlar que la cantidad de graduados ya inscriptos no supere el cupo máximo que cada curso tiene. En caso de que el curso solicitado se encuentre completo se debe informar que no hay lugar disponible en dicho curso.

// B. Una vez finalizada la inscripción:
// I. Informar el código de aquellos cursos cuyo cupo máximo no se completó. 
// II. Calcular e informar la cantidad de inscriptos al curso con código 2 que tienen entre 30 y 35 años

type
    tipocadena = string[30];
    codCurso = 1..10;

    persona = record
        DNI, edad: longint;
        apellido, nombre: tipocadena;
        codigo: codCurso;
    end;

    ArrCurso = Array[1..10] of longint;

procedure LeerDatos(var datos: persona);

begin
    writeln('Ingrese su apellido');
    readln(datos.apellido);

    if (datos.apellido <> 'zzz') then begin
        writeln('Ingrese su nombre');
        readln(datos.nombre);

        writeln('Ingrese su edad');
        readln(datos.edad);

        writeln('Ingrese su DNI');
        readln(datos.DNI);

        writeln('Ingrese el codigo del curso');
        readln(datos.codigo);

        while not (datos.codigo in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) do begin
            writeln('Codigo de curso inválido. Ingrese nuevamente');
            readln(datos.codigo);
        end;
    end;
end;

procedure InicializarArrCurso(var V: ArrCurso);

var
    i: longint;

begin
    for i := 1 to 10 do begin
        V[i] := 0;
    end;
end;

procedure InformarCupos(capacidad, maximo: ArrCurso);

var
    i: longint;

begin
    for i := 1 to 10 do begin
        if (capacidad[i] < maximo[i]) then
            writeln('En el curso ', i, ' quedan ', maximo[i] - capacidad[i], ' cupos para completarse');
    end;
end;

procedure SetearCupos(var maximo: ArrCurso);

var
    i: longint;

begin
    for i := 1 to 10 do begin
        writeln('Ingresar el maximo nro de inscriptos para el curso ', i);
        readln(maximo[i]);
    end;
end;

procedure Inscripciones(MaximoCursos: ArrCurso);

var
    estudiantesCumplen: longint;
    Estudiante: persona;
    CapacidadActualCursos: ArrCurso;

begin
    InicializarArrCurso(CapacidadActualCursos);
    estudiantesCumplen := 0;

    repeat
        LeerDatos(Estudiante);
        if (Estudiante.apellido <> 'zzz') then begin
            if MaximoCursos[Estudiante.codigo] > CapacidadActualCursos[Estudiante.codigo] then begin
                CapacidadActualCursos[Estudiante.codigo] := CapacidadActualCursos[Estudiante.codigo] + 1;

                if (Estudiante.codigo = 2) and (Estudiante.edad > 30) and (Estudiante.edad < 35) then begin
                    estudiantesCumplen := estudiantesCumplen + 1;
                end;

                writeln('Se inscribió al estudiante en el curso solicitado');
            end else begin
                writeln('No hay espacio en el curso solicitado');
            end;
        end;
    until (Estudiante.apellido = 'zzz');

    InformarCupos(CapacidadActualCursos, MaximoCursos);

    writeln('Los estudiantes que se inscribieron al curso 2 y estan entre 30 y 35 años son ', estudiantesCumplen);
end;

var
    CuposMaximos: ArrCurso;

begin
    SetearCupos(CuposMaximos);

    Inscripciones(CuposMaximos);
end.