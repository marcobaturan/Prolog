%% Reglas recursivas.
%% Describe la recursión en un programa lógico.

% Reglas.
antepasado(X,Y):-
	progenitor(X,Y). 
antepasado(X,Y):-
	progenitor(X,Z),
	entepasado(Z,Y).
