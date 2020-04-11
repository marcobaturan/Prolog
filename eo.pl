%% Programa que codifica las reglas basicas del esperanto.
%% Basado en el libro de Fernando de Diego.
%% El objetivo es un estudio computacional de una lengua
%% construida. De gramatica simple y regular son excepciones.
%% Esta es la version 2.
%% Incluye generar negancion y preguntas.
%% Para la proxima version se basara en POMEGO:
%% Plena Manlibro Esperante Gramatiko.
%% Primer nivel de abstraccion.

% Generación de frases positivas.
oracion_afirmativa --> sujeto, predicado.
sujeto --> determinante, sustantivo.
predicado --> verbo, sustantivo,acusativo.
predicado --> verbo_compuesto, sustantivo,acusativo.
verbo_compuesto --> verbo,raiz,tiempo_compuesto.
verbo --> raiz, tiempo.
% Componentes menores.
% Determinantes.
acusativo --> ['n'].
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
% Generación de frases negativas.
oracion_negativa --> sujeto, predicado_negativo.
predicado_negativo --> negacion, verbo, sustantivo,acusativo.
predicado_negativo --> negacion, verbo_compuesto, sustantivo,acusativo.
% Negaciones.
negacion --> ['ne'].
negacion --> ['nenio'].
negacion --> ['neniu'].
negacion --> ['nenie'].
negacion --> ['neniam'].
negacion --> ['neniel'].
negacion --> ['nenial'].
negacion --> ['neniom'].
negacion --> ['nenia'].
negacion --> ['nenies']. 
% Generación de preguntas.
oracion_consulta --> pregunta, predicado_consulta.
oracion_consulta_negativa --> pregunta,negacion, predicado_consulta.
pregunta --> particula.
predicado_consulta --> predicado_q, sujeto, ['?'].
predicado_q --> verbo, sustantivo.
predicado_q --> verbo_compuesto.
particula --> ['Kio'].
particula --> ['Kie'].
particula --> ['Kiu'].
particula --> ['Kiam'].
particula --> ['Kiel'].
particula --> ['Kial'].
particula --> ['Kiom'].
particula --> ['Kia'].
particula --> ['Kies'].
