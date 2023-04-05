# Grupo 3
# Integrantes: 
# David Valero Croma
# Pablo Villarreal Ortiz
# Carla Polanco Rodríguez

# Instalación de paquetes dplyr y ggpubr en caso de no poseerlos 
# instalados con anterioridad.

if (!require ( dplyr )) {
  install.packages ("dplyr" , dependencies=TRUE)
  require (dplyr)
}

if (!require ( ggpubr )) {
  install.packages ("ggpubr" , dependencies=TRUE)
  require (ggpubr)
}

# Explortacion de las librerias 

library(dplyr)
library(ggpubr)

# Lectura del archivo

dir <- "C:/Users/carla/OneDrive/Escritorio/IME/IME_Grupo_3/EP05"
basename <- "EP04 Datos.csv"
file <- file.path(dir, basename)
poblacion <- read.csv2(file = file)

# ------------------------------ PROBLEMA --------------------------------------

# Un agricultor dedicado a la producción de manzanas desea determinar, 
# usando una muestra aleatoria de 300 manzanas, si sus frutas tienen un 
# peso medio de 110 g. Se sabe que el peso de éstas sigue una distribución
# normal con desviación estándar de 15 g

# el calibre mínimo aceptable es de 60 mm si se mide 
# por el diámetro o de 90 g si se mide por el peso.

# -------------------------- PREGUNTAS AL GRUPO --------------------------------

# 1. El agricultor está seguro de que el verdadero peso medio no puede ser 
# inferior a 110 gramos y piensarechazar la hipótesis nula cuando la muestra 
# presente un peso medio mayor a 111 gramos. Determine,usando herramientas
# gráficas, la probabilidad de que cometa un error de tipo I.


# 2. Suponga ahora que el verdadero peso medio de las manzanas es de 110,5 gramos.
# Determine mediante herramientas gráficas cuál sería la probabilidad de que el 
# agricultor, quien obviamente no conoce este dato, cometa un error de tipo II.


# 3. Teniendo en cuenta que en realidad no se conoce el verdadero peso medio, 
# genere ahora un gráfico del poder teniendo en cuenta que el agricultor piensa 
# rechazar la hipótesis nula si la muestra presenta un peso medio mayor a 111,5 gramos,
# pero suponiendo ahora que el peso volumen medio podría variar entre 110 y 110,5 gramos.


# 4. Considerando un peso medio verdadero de 110,5 gramos, calcule usando funciones 
# de R (o alguno de sus paquetes) cuántas manzanas deberían revisarse para conseguir 
# un poder estadístico de 0,85 y un nivel de significación de 0,05.


# 5. Repita el ejercicio de la pregunta anterior, suponiendo ahora que el agricultor 
# es muy exigente y desea reducir la probabilidad de cometer un error de tipo I a un 1% solamente?
  