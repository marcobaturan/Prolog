%% Hace el calculo de predicado existencial para inferenciar
%% sobre la relación madre e hijo.
% Reglas.
madre(X,Y):-
	mujer(X),
	progenitor(X,Y).
% Hechos.
mujer(pilar).	mujer(belen).
mujer(lucia). 	mujer(ana).
mujer(maria).
hombre(tomas).	hombre(pedro).
hombre(jose).
