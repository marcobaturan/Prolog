% Primer nivel de abstraccion.
oracion --> sujeto, predicado.
sujeto --> determinante, sustantivo.
predicado --> verbo, sustantivo.
predicado --> verbo_compuesto, sustantivo.
verbo_compuesto --> verbo,raiz,tiempo_compuesto.
verbo --> raiz, tiempo.
% Componentes menores.
% Determinantes.
determinate --> [].
determinante --> ['la'].
determinante --> ['un'].
% Sustantivos.
sustantivo --> ['kato'].
sustantivo --> ['fisxo'].
raiz --> ['mangx'].
% Tiempos simples.
tiempo --> ['as'].
tiempo --> ['os'].
tiempo --> ['is'].
tiempo --> ['us'].
tiempo --> ['u'].
% Tiempos compuestos.
tiempo_compuesto --> ['ita'].
tiempo_compuesto --> ['ata'].
tiempo_compuesto --> ['ota'].
tiempo_compuesto --> ['inta'].
tiempo_compuesto --> ['anta'].
tiempo_compuesto --> ['onta'].
