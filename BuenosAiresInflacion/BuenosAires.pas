Program BuenosAiresInflacion;

var
    Am : array[1..12] of real;
    max : real;
    i, mes : integer;

begin
    for i:=1 to 12 do
        {Para cada mes preguntamos al usuario y tomamos su input por teclado}
        begin
            writeln('Ingrese la inflación del mes ', i, ': ');
            readln(Am[i]);
        end;

    {Inicializamos la variable max en un valor muy bajo para despues actualizarlo}
    mes := 1;
    max := -100;

    for i:=1 to 12 do
        {Para cada mes verificamos si la inflacion es mas que nuestro maximo y si es asi actualizamos la variable}
        begin
            if (Am[i] > max) then
                begin
                    max := Am[i];
                    mes := i;
                    // writeln('>> Iteración i=', i, ' mes=', mes)
                end;
        end;
    {Informar la inflación maxima y el mes correspondiente}
    writeln('La mayor inflacion fue de ', max:2:2, ' correspondiente al mes ', mes);

end.