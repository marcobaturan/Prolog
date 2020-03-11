%% Ciudades.
%% Programa lógico que decide si dos ciudades son contigüas.
% Reglas.

camino(X,Y):-
	camino(X,Z),
	camino(Z,Y).
% Hechos.
camino(madrid,bnc).
camino(bnc,madrid).
camino(mostoles,madrid).
camino(madrid,mostoles).
camino(sevilla,mostoles).
camino(mostoles,sevilla).
camino(madrid,zaragoza).

/*Conclusión:
	Este programa falla porque el problema lo
	entendí mal. Es necesario meditar sobre 
	ello.
*/
