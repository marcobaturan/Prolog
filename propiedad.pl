/* Base de hechos de predicados monádicos y poliádicos */
/* Predicados monádicos: Propiedades */

/* mujer(Persona) <- Persona es una mujer */
mujer(clara).
mujer(chelo).

/* hombre(Persona) <- Persona es un hombre */
hombre(jorge).
hombre(felix).
hombre(borja).

/* moreno(Persona) <- Persona tiene el pelo de color oscuro */
moreno(jorge).

/* Predicados poliádicos: RELACIONES */

/* tiene(Persona,Objeto) <- Persona posee el objeto Objeto */
tiene(jorge,moto).
/* le_gusta_a(X,Y) <- a X le gusta Y */
le_gusta_a(clara,jorge).
le_gusta_a(jorge,clara).
le_gusta_a(jorge,informatica).
le_gusta_a(clara,informatica).

/* es_padre_de(Padre,Hijo-a) <- Padre es el padre de Hijo-a */
es_padre_de(felix,borja).
es_padre_de(felix,clara).

/* es_madre_de(Madre,Hijo-a) <- Madre es la madre de Hijo-a */
es_madre_de(chelo,borja).
es_madre_de(chelo, clara).

/* regala(Persona1,Objeto,Persona2) <- Persona1 regala Objeto a Persona2 */
regala(jorge, flores, clara).