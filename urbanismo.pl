%% Programa sobre ciudades
% Reglas.
discontiguous capital_de(X,Y):-ciudad_de(X,Y), not(pueblo_de(X,Y)).
discontiguous ciudad_de(X,Y):-ciudad_de(X,Y), not(pueblo_de(X,Y)).
discontiguous pueblo_de(X,Y):-not(ciudad_de(X,Y)), not(capital_de(X,Y)).
% hechos.
ciudad(madrid).
ciudad(barcelona).
pueblo(mostoles).
% Relaciones de hechos.
capital_de(madrid,espana).
ciudad_de(madrid,espana).
ciudad_de(barcelona,espana).
pueblo_de(mostoles,espana).


