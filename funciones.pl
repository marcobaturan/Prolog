%% Funciones.
grande(pepe).
grande(cabeza(juan)).
grande(X):-mayor(X,Y).
mayor(cabeza(X),cabeza(Y)):-progenitor(X,Y).

