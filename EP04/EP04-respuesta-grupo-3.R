# Grupo 3
# Integrantes: 
# David Valero Croma
# Pablo Villarreal Ortiz
# Carla Polanco Rodriguez


# 3. ¿Es posible afirmar que, en promedio, los pollitos alimentados con maravilla superan por más de 0,02
# gramos a los alimentados con soya a los 4 días de nacidos?


library(dplyr)
library(ggpubr)

dir <- "C:/Users/rowin/OneDrive/Escritorio/modelos estadistico/grupo_3/IME_Grupo_3/EP04"
basename <- "EP04 Datos.csv"
file <- file.path(dir, basename)
poblacion <- read.csv2(file = file)

# 1. El criador a cargo del estudio cree que el peso medio de los pollitos alimentados con soya, a los 8 días de
# nacidos, es inferior a 97,1 gramos. ¿Soportan los datos esta afirmación?

# Pollos alimentados con soya a los 8 días nacidos, peso menor a 97,1
# H0 --> peso de pollos dictados media m = 97,1
# H1 --> peso de pollos dictados media m < 97,1

Pollos_1 <- poblacion %>% filter(DIETA == "Soya", DIA == 8)

medidas_varias_1 <- Pollos_1 %>% summarise(Media_pesos = mean(PESO),
											SD_pesos = sd(PESO))
print(medidas_varias_1)

# 2. ¿Sugieren los datos que, en promedio, los pollitos alimentados con linaza aumentan su peso en 22,4 gramos
# a 6 días desde su nacimiento?

# Pollos alimentados con linaza a los 6 días nacidos, peso aumenta en 22,4 gramos en coparacion a cuando nació
# H0 --> pollos dictados con gramos más que al nacer = 22,4
# H1 --> pollos dictados con gramos más que al nacer /= 22,4

Pollos_2 <- poblacion %>% filter(DIETA == "Linaza", (DIA == 0 | DIA == 6))

# 3. ¿Es posible afirmar que, en promedio, los pollitos alimentados con maravilla superan por más de 0,02
# gramos a los alimentados con soya a los 4 días de nacidos?

# Pollos alimentados con maravilla superan por mas de 0,02 a alimentados con soya a los 4 días
# H0 --> peso pollos dictados diferencia con los alimentados con soya por m = 0,02
# H1 --> peso pollos dictados diferencia con los alimentados con soya por m > 0,02

Pollos_3 <- poblacion %>% filter((DIETA == "Maravilla" | DIETA == "Soya"), DIA == 4)

#parametrico --> z o t
#proporciones --> wilson
#+2 proporciones --> q de cocran?
