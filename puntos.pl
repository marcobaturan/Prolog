%% Segmentos
% Hecho.
punto(X,Y).
% Funcion.
% Segmento.
segmento(punto(X,Y),punto(X,Y)).
% Segmento horizontal.
horizontal(seg(punto(X,Y),
	punto(X1,Y))).
% Segmento vertical.
vertical(seg(punto(X,Y),
	punto(X,Y1))).
% Angulo. Agregado por mi.
angulo:-
	horizontal(seg(punto(X,Y),punto(X1,Y))),
	vertical(seg(punto(Z,Y),punto(Z,Y1))).

%%% Conclusion
%% Revisar, es semanticamente erroneo.
