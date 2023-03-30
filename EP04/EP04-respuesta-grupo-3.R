# Grupo 3
# Integrantes: 
# David Valero Croma
# Pablo Villarreal Ortiz
# Carla Polanco Rodriguez

library(dplyr)
library(ggpubr)

dir <- "C:/Users/rowin/OneDrive/Escritorio/modelos estadistico/grupo_3/IME_Grupo_3/EP04"
basename <- "EP04 Datos.csv"
file <- file.path(dir, basename)
poblacion <- read.csv2(file = file)