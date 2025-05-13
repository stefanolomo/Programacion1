Program  ListaSimple;

// 1. Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene en una lista simple. Utilizando la lista creada implementar:
// a) un módulo que reciba la lista y devuelva como resultado la cantidad de números que tienen exactamente 3 dígitos.
// b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
// c) Un módulo que reciba la lista y libere la memoria reservada

type
    ListaPrt = ^nodolista;

    nodolista = record
        num: integer;
        sig: ListaPrt;
    end;

procedure CorteControlLista(CORTE: integer; var Lista: ListaPrt);

var
    nro, i: integer;
    nodo, aux: ListaPrt;

begin
    i := 0;
    repeat
        writeln('Ingrese el numero del siguiente nodo. Hasta ahora hay ', i, ' nodos: ');
        readln(nro);

        // Creamos un nuvo nodo, siendo el numero el que ingreso el usuario y el siguiente nil porque es el ultimo
        new(nodo);
        nodo^.num := nro;
        nodo^.sig := nil;
        
        if (Lista = nil) then Lista := nodo
        else
            begin
                // Usamos a aux para recorrer hasta el ultimo nodo
                aux := Lista;
                while (aux^.sig <> nil) do
                    // Llegamos al ultimo nodo cuando el siguiente es nil
                    aux := aux^.sig;
                aux^.sig := nodo;
            end;

        i := i + 1;
    until (nro = CORTE);
end;

procedure ImprimirLista(Lista: ListaPrt);

var
    i: integer;

begin
    i := 1;

    // Mientras el nodo no sea el ultimo
    while (lista <> nil) do
        begin
            // Imprimimos el numero del nodo
            writeln('En el nodo ', i, ' hay: ', Lista^.num);
            // Movemos la cabeza de lista al siguiente
            Lista := Lista^.sig;
        end;
end;

procedure LiberarMemoria(var Lista: ListaPrt);

var
    aux: ListaPrt;

begin
    // Recorre hasta el final
    while (Lista <> nil) do
        begin
            // La direccion de memoria de cabeza de lista la pasamos a aux
            aux := Lista;
            // La lista la reorganizamos en el siguiente
            Lista := Lista^.sig;
            // Eliminamos aux ahora que ya esta desvinculado de la lista
            dispose(aux)
        end;
end;

var
    Lista: ListaPrt;

Begin
    CorteControlLista(12, Lista);
    ImprimirLista(Lista);
    LiberarMemoria(Lista);
end.