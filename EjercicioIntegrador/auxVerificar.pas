Program Aux;

const
    MAX_FABRICANTES =   30;

type
    cadena70 = string[70];

    TFabricante =   Record
        nombre:   string[70];
        antiguedad:   integer;
    End;

    TFabricantes =   array[1..MAX_FABRICANTES] Of TFabricante;

Const 
    FABRICANTES:   TFabricantes =   (
                                    (nombre: 'AI Creators'; antiguedad: 9),
                                    (nombre: 'AI Dynamics'; antiguedad: 12),
                                    (nombre: 'AI Innovators'; antiguedad: 4),
                                    (nombre: 'AI Pioneers'; antiguedad: 9),
                                    (nombre: 'AutoGenius'; antiguedad: 11),
                                    (nombre: 'AutoMech'; antiguedad: 14),
                                    (nombre: 'CyberAndroids'; antiguedad: 7),
                                    (nombre: 'CyberWorks'; antiguedad: 10),
                                    (nombre: 'EvoBots'; antiguedad: 7),
                                    (nombre: 'EvoMech'; antiguedad: 8),
                                    (nombre: 'FutureBots'; antiguedad: 10),
                                    (nombre: 'FutureMinds'; antiguedad: 5),
                                    (nombre: 'MechSolutions'; antiguedad: 12),
                                    (nombre: 'NanoBots Co.'; antiguedad: 6),
                                    (nombre: 'NanoMinds'; antiguedad: 7),
                                    (nombre: 'NeuraBotics'; antiguedad: 8),
                                    (nombre: 'NextGen Androids'; antiguedad: 6),
                                    (nombre: 'NextGen Robotics'; antiguedad: 3),
                                    (nombre: 'Quantum Robotics'; antiguedad: 5),
                                    (nombre: 'QuantumAndroids'; antiguedad: 4),
                                    (nombre: 'RoboGenius'; antiguedad: 13),
                                    (nombre: 'RoboInnovators'; antiguedad: 3),
                                    (nombre: 'RoboMasters'; antiguedad: 6),
                                    (nombre: 'RoboTech Inc.'; antiguedad: 15),
                                    (nombre: 'SmartAndroids'; antiguedad: 8),
                                    (nombre: 'SmartBots'; antiguedad: 5),
                                    (nombre: 'SynthMind'; antiguedad: 9),
                                    (nombre: 'SynthTech'; antiguedad: 8),
                                    (nombre: 'TechHumanoid'; antiguedad: 11),
                                    (nombre: 'TechPioneers'; antiguedad: 10)
                                    );

function VerificarFabricante(FABRICANTES: TFabricantes; NombreFabricante: cadena70; AntiguedadMin: integer):Boolean;

var
    m, d, i: integer;
    Encontrado, CumpleAntiguedad: Boolean;

begin
    // Asumimos que ambas condiciones son falsas
    Encontrado := False;
    CumpleAntiguedad := False;

    // La parte derecha va a ser el final, o el maximo
    d := MAX_FABRICANTES;
    // La parte izquierda va a ser el primero o 1
    i := 1;

    // Mientras la izquierda sea igual o menor a la derecha, lo que siempre se debería cumplir
    while (i <= d) and (not Encontrado) do
        begin
            // El medio es la mitad de la izquierda a la derecha
            m := (i + d) div 2;

            // Si el del medio es el que buscamos
            if (FABRICANTES[m].nombre = NombreFabricante) then
                begin
                    // Verificamos si cumple la antiguedad
                    CumpleAntiguedad := FABRICANTES[m].antiguedad >= AntiguedadMin;
                    // Decimos que lo encontramos
                    Encontrado := True;
                end
            // O esta a la derecha, osea que es mayor al del medio
            else if (NombreFabricante > FABRICANTES[m].nombre) then
                begin
                    // La izquierda es el medio y la derecha sigue siendo el final
                    i := m + 1;

                end
            // O esta a la izquierda, osea que es menor al del medio
            else if (NombreFabricante < FABRICANTES[m].nombre) then
                begin
                    // La derecha es el medio y la izquierda no cambia
                    d := m - 1;
                end;
            // writeln(FABRICANTES[i].nombre);
            // writeln(FABRICANTES[i].antiguedad);
        end;

    VerificarFabricante := Encontrado and CumpleAntiguedad;
end;

var
    prueba: boolean;
    fabricantenombre: cadena70;
    fabricanteantiguedad: integer;

Begin
    write('Ingrese el nombre del fabricante: ');
    readln(fabricantenombre);

    write('Y ahora ingrese la antiguedad a verificar: ');
    readln(fabricanteantiguedad);

    prueba := VerificarFabricante(FABRICANTES, fabricantenombre, fabricanteantiguedad);

    writeln('Resultado: ', prueba);
end.