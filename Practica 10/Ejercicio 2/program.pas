program Ejercicio2;

const
    MAYUSAG = ['A'..'G'];
    DIGITOSPARES = [0, 2, 4, 6, 8, 0];
    MAYUS = ['A'..'Z'];
    MINUS = ['a'..'z'];
    DIGITOS = ['0'..'9'];
    NUMEROS = [0..9];

{ Se dispone de una estructura de datos con la información de personas que pagan su servicio de internet a una empresa. De cada persona se conoce nombre, apellido, categoría del servicio (1 doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia), monto básico que debe pagar y la dirección donde se le brinda el servicio (a lo sumo 70 caracteres).
El monto final a pagar por el servicio de internet se compone de un monto básico al que se le adiciona un importe extra de acuerdo a la categoría del servicio. Para ello la empresa dispone de una tabla adicional donde para cada categoría de servicio (1 doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia) se indica el monto extra a cobrar. Se pide:

- A. Calcular el monto recaudado por la empresa para cada categoría de servicio.
- B. El nombre de la persona que más pago por el servicio de internet de categoría 2. En caso de que nadie haya pagado esta categoría de servicio, informar “nadie pagó servicio de internet categoría 2”.
- C. Para cada persona indicar si su dirección cumple la siguiente forma: A % B % C donde:
    i. A debe ser una secuencia de letras mayúsculas de la “A”..”G” y caracteres dígitos pares.
    ii. % es el carácter “%” que seguro existe.
    iii. B debe ser exactamente las letras de A, en el mismo orden, donde para cada letra mayúscula de A aparece su minúscula en B.
    iv. C debe ser una secuencia donde están una única vez, todos los caracteres dígitos que no aparecieron en A.

Ejemplo: DFG2A4EG % dfgaeg % 13057896 cumple con el patrón.
Ejemplo: ABCDEFG02468 % abcdefg % 13579
Nota: Cada persona paga un solo servicio }

type
    tipocadena = String[40];
    tipocategoria = 1..4;
    tipodireccion = String[70];
    registrodatos = record
        Nombre: tipocadena;
        Apellido: tipocadena;
        Categoria: tipocategoria;
        MontoBasico: integer;
        Direccion: String
    end;

    ptrnodo = ^nodo;
    nodo = record
        datos: registrodatos;
        sig: ptrnodo;
    end;

    ArrCat = Array[tipocategoria] of integer;

procedure InicializarArrCat(var A: ArrCat);

var
    i: integer;

begin
    for i := 1 to 4 do
        A[i] := 0;
end;

function CumpleDireccion(Direccion: tipodireccion): boolean;

var
    i: integer;
    caracter: char;

begin
    for i := 1 to 70 do begin
        caracter := Direccion[i];

        
    end;
end;

procedure RecorrerLista(Lista: ptrnodo; ArregloMontoExtra: ArrCat);

var
    Recaudacion: ArrCat;
    max1: integer;
    max1Nombre: tipocadena;
    totalAPagar: integer;

begin
    max1 := -1;
    InicializarArrCat(Recaudacion);

    while (Lista <> nil) do begin
        totalAPagar := Lista^.datos.MontoBasico + ArregloMontoExtra[Lista^.datos.Categoria];
        Recaudacion[Lista^.datos.Categoria] := Recaudacion[Lista^.datos.Categoria] + totalAPagar;

        if (totalAPagar > max1) and (Lista^.datos.Categoria = 2) then begin
            max1Nombre := Lista^.datos.Nombre;
            max1 := totalAPagar;
        end;

        if CumpleDireccion(Lista^.datos.Direccion) then
            writeln('La persona ', Lista^.datos.Nombre, ' cumple con el formato de dirección.')
        else begin
            writeln('La persona ', Lista^.datos.Nombre, ' no cumple con el formato de dirección.');
        end;

        Lista := Lista^.sig;
    end;

    if (max1 <> -1) then begin
        writeln('La persona que mas pago en el servicio de categoria 2 fue: ', max1Nombre, '; Pagando un total de ', max1);
    end else begin
        writeln('No hubo personas en la categoria 2.');
    end;
end;

begin
end.