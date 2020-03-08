%% Relaciones.
%% Resumen de los apuntes del libro programación-lógica
%% hasta el punto previo a la unificación. Hasta la pag-
%% -gina cinco, punto cuatro. Unificación.


/* Reglas */
% Reglas de familia
madre(X,Y):-
	mujer(X),
	progenitor(X,Y).
antepasado(X,Y):-
	progenitor(X,Y).
antepasado(X,Y):-
	progenitor(X,Z),
	antepasado(Z,Y).

% Reglas de herencia de parentesco.
grande(pepe).
grande(cabeza(juan)).
grande(X):-
	mayor(X,Y).
mayor(cabeza(X),cabeza(Y)):- 
	progenitor(X,Y).

% Reglas de cuidado por parentesco.
cuida(belen,pedro):-
	paro(belen),
	bueno(pedro).

/* Relacion Progenitor */
% Hechos de relación de progenitor
progenitor(pilar,belen).
progenitor(tomas,belen).
progenitor(tomas,lucia).
progenitor(belen,ana).
progenitor(belen,pedro).
progenitor(pedro,jose).
progenitor(pedro,maria).

% Hechos de persona.
mujer(pilar). 
mujer(belen).
mujer(lucia). 
mujer(ana).
mujer(maria).
hombre(tomas). 
hombre(pedro).
hombre(jose).
/* 2 hechos más */
paro(belen).
bueno(pedro).

