/* Conjunción de predicados
*/
le_gusta_a(clara,jorge), le_gusta_a(clara,chocolate).
/* Disyunción de predicados
*/
le_gusta_a(clara,jorge); le_gusta_a(jorge,clara).
/* Negación de predicados
*/
/* o también como */
\+ le_gusta_a(clara,jorge).
/* Condicional: REGLAS
*/
/* novios(Per1,Per2) <- Per1 y Per2 son novios */
novios(X,Y) :-
le_gusta_a(X,Y),
le_gusta_a(Y,X).
/* hermana_de(Per1,Per2) <- Per1 es la hermana de Per2 */
hermana_de(X,Y) :- mujer(X),
es_padre_de(P,X), es_madre_de(M,X),
es_padre_de(P,Y), es_madre_de(M,Y).
/* Ejemplo de disyunción con ; y con diferentes cláusulas */
/* 1. con ; sería :
*/
es_hijo_de(X,Y) :- (es_padre_de(Y,X) ; es_madre_de(Y,X)).
/* 2. con cláusulas diferentes quedaría:
es_hijo_de(X,Y) :- es_padre_de(Y,X).
es_hijo_de(X,Y) :- es_madre_de(Y,X).