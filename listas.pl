/* miembro(Elem,Lista) <- el término Elem pertenece a Lista */
miembro(X,[X|_]).
miembro(X,[_|Y]):-miembro(X,Y).

/* nel(Lista,N) <- el numero de elementos de la lista Lista es N */
nel([],0).
nel([X|Y],N):-nel(Y,M),N is M+1.

/* es_lista(Lista) <- Lista es una lista */
es_lista([]).
es_lista([_|_]).

/* concatena(L1,L2,L3) <- concatenación de las listas L1 y L2 dando lugar a la lista L3 */
concatena([].L,L).
concatena([X|L1],L2,[X|L3]):-concatena(L1,L2,L3).

/* ultimo(Elem,Lista) <- Elem es el ultimo elemento de Lista */
ultimo(X,[X]).
ultimo(X,[_|Y]):-ultimo(X,Y).

/* inversa(Lista,Inver) <- Inver es la inversa de la lista Lista */
inversa([],[]).
inversa([X|Y],L):-inversa(Y,Z),concatena(Z,[X],L).

/* borrar(Elem,L1,L2) <- se borra el elemento Elem de la lista L1 obteniéndose la lista L2 */
borrar(X,[X|Y],Y).
borrar(X,[Z|L],[Z|M]):-borrar(X,L,M).

/* subconjunto(L1,L2) <- la lista L1 es un subconjunto de lista L2 */
subconjunto([X|Y],Z):-miembro(X,Z),subconjunto(Y,Z).
subconjunto([],Y).

/* insertar(Elem,L1,L2) <- se inserta el elemento Elem en la lista L1 obteniéndose la lista L2 */
insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]):-insertar(E,Y,Z).

/* permutacion(L1,L2) <- la lista L2 es una permutación de lista L1 */
permutacion([],[]).
permutacion([X|Y],Z):-permutacion(Y,L),insertar(X,L,Z).
