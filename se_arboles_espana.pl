%% Se clasifican los hechos de:
%% Arbol, aspecto, hoja, cono, floración, habitat, frutos, particularidad y peculiaridad.
%% Se tomará un solo ejemplo de cada sección sobre hojas.


% Arboles con caracteristicas.
arbol(abies_alba):-altura('50m'),
	  anchura('3m'),
	  hojas(aciculares),
	  corteza(gris_plata),
	  floración(abril),
	  flores(amarillas_o_verdes),
	  conos('15cm'),
	  habitat('1600m'),
	  particularidad(ramas_curvas),
	  peculiaridad(ninguna).

arbol(cytisus_escoparius):-altura('2m'),
	  anchura('3m'),
	  hojas(pinnadas),
	  corteza(no_tiene),
	  floración(julio),
	  flores(grandes_amarillas),
	  conos(ninguno),
	  habitat(matorrales),
	  particularidad(ramas_angulosas),
	  peculiaridad(toxica).

arbol(syringa_vulgaris):-altura('6m'),
	  anchura('3m'),
	  hojas(simples_opuestas),
	  corteza(verdosa_a_grisacea),
	  floración(mayo),
	  flores(blanco_azul_malva),
	  conos(ninguno),
	  habitat(europa_oriente_proximo),
	  particularidad(yemas_enparejadas),
	  peculiaridad(ornamental).

arbol(salix_caprea):-altura('12m'),
	  anchura('3m'),
	  hojas(simples_alternas),
	  corteza(lisa_gris),
	  floración(mayo),
	  flores(dioicas),
	  conos(ninguno),
	  habitat(canteras),
	  particularidad(hojas_enves_suave_blanquecino),
	  peculiaridad(salicina).

% Hechos.
% Calsificación por hojas.
hojas(aciculares).
hojas(pinnadas).
hojas(simples_opuestas).
hojas(simples_alternas).
% Calsificación por árbol.
arbol(abies_alba).
altura('50m').
anchura('3m').
hojas(aciculares).
corteza(gris_plata).
floración(abril).
flores(amarillas_o_verdes).
conos('15cm').
habitat('1600m').
particularidad(ramas_curvas).
peculiaridad(ninguna).

arbol(cytisus_escoparius).
altura('2m').
anchura('3m').
hojas(pinnadas).
corteza(no_tiene).
floración(julio).
flores(grandes_amarillas).
conos(ninguno).
habitat(matorrales).
particularidad(ramas_angulosas).
peculiaridad(toxica).

arbol(syringa_vulgaris).
altura('6m').
anchura('3m').
hojas(simples_opuestas).
corteza(verdosa_a_grisacea).
floración(mayo).
flores(blanco_azul_malva).
conos(ninguno).
habitat(europa_oriente_proximo).
particularidad(yemas_enparejadas).
peculiaridad(ornamental).

arbol(salix_caprea).
altura('12m').
anchura('3m').
hojas(simples_alternas).
corteza(lisa_gris).
floración(mayo).
flores(dioicas).
conos(ninguno).
habitat(canteras).
particularidad(hojas_enves_suave_blanquecino).
peculiaridad(salicina).

% consulta al usuario.

altura(X):-ask(altura,X).
anchura(X):-ask(anchura,X).
hojas(X):-ask(hojas,X).
corteza(X):-ask(corteza,X).
floración(X):-ask(floración,X).
flores(X):-ask(flores,X).
conos(X):-ask(conos,X).
habitat(X):-ask(habitat,X).
particularidad(X):-ask(particularidad,X).
peculiaridad(X):-ask(peculiar,X).
ask(Attr, Val):-
write(Attr:Val),
write('? '),
read(yes).
