# Grupo 3
# Integrantes: 
# David Valero Croma
# Pablo Villarreal Ortiz
# Carla Polanco Rodríguez


if (!require (dplyr)) {
  install.packages ("dplyr" , dependencies=TRUE)
  require (dplyr)
}

if (!require (ggpubr)) {
  install.packages ("ggpubr" , dependencies=TRUE)
  require (ggpubr)
}

# Direccion a reemplazar según ubicación del archivo
dir <- "C:/Users/rowin/OneDrive/Escritorio/modelos estadistico/grupo_3/IME_Grupo_3/EP04"
basename <- "EP04 Datos.csv"
file <- file.path(dir, basename)
poblacion <- read.csv2(file = file)

# 1. El criador a cargo del estudio cree que el peso medio de los pollitos alimentados con soya, a los 8 días de
# nacidos, es inferior a 97.1 gramos. ¿Soportan los datos esta afirmación?

# Pollos alimentados con soya a los 8 días nacidos, peso menor a 97.1
# H0 --> peso de pollos dictados media µ >= 97.1
# H1 --> peso de pollos dictados media µ < 97.1
# Nivel de confianza de 95%
# Se usa T de Studen porque hay menos de 30 muestras

Pollos_1 <- poblacion %>% filter(DIETA == "Soya", DIA == 8)

medidas_varias_1 <- Pollos_1 %>% summarise(Media_pesos = mean(PESO),
											SD_pesos = sd(PESO))
print(medidas_varias_1)

# Muestras de pollos independientes entre sí.
# Comprobación similaridad a distribución normal mediante gráfico Q-Q.

g_pollos_1 <- ggqqplot(data = data.frame(Pollos_1),
              x = "PESO",
              color = "steelblue",
              xlab = "Teórico",
              ylab = "Muestra",
              title = "Gráfico Q-Q muestra v/s distr. normal")
print(g_pollos_1)

# Establecer los datos conocidos.
n <- nrow(Pollos_1)
grados_libertad <- n - 1
valor_nulo <- 97.1

# Establecer nivel de significación.
alfa <- 0.05

# Calcular el estadístico de prueba.
media <- medidas_varias_1$Media_pesos
desv_est <- medidas_varias_1$SD_pesos
error <- desv_est / sqrt(n)
t <- (media - valor_nulo) / error

# Calcular el valor p.
p <- pt(t, df = grados_libertad, lower.tail = TRUE)

# p es mayor a 0.05, por lo que no es posible rechazar la hipótesis nula, por lo que esta se acepta.
# Finalmente los datos no logran confirmar que a los 8 días de nacidos el peso medio de los pollitos es inferior a 97.1 gramos

# Construir el intervalo de confianza.
t_critico <- qt(alfa, df = grados_libertad, lower.tail = FALSE)
superior <- media + t_critico * error

# con t.test
prueba <- t.test(Pollos_1$PESO,
                  alternative = "less",
                  mu = valor_nulo,
                  conf.level = 1 - alfa)

# 2. ¿Sugieren los datos que, en promedio, los pollitos alimentados con linaza aumentan su peso en 22.4 gramos
# a 6 días desde su nacimiento?

# Pollos alimentados con linaza a los 6 días nacidos, peso aumenta en 22.4 gramos en comparación a cuando nació
# H0 --> pollos dictados con gramos más que al nacer = 22.4
# H1 --> pollos dictados con gramos más que al nacer /= 22.4
# Nivel de confianza de 95%
# Se usa T de Studen porque hay menos de 30 muestras

Pollos_2 <- poblacion %>% filter(DIETA == "Linaza", (DIA == 0 | DIA == 6))

# Crear un vector vacío para almacenar los resultados.
resultados <- numeric()

# Obtener la lista de ids únicos en la tabla.

ids_unicos <- unique(Pollos_2$ID)


# Iterar sobre los ids únicos.


for(IDN in ids_unicos) {
  
  # Seleccionar las filas correspondientes al id actual.
  filas <- subset(Pollos_2, IDN == ID)
  
  # Calcular la diferencia entre filas consecutivas y almacenar el resultado.
  diff_filas <- diff(filas$PESO)
  resultados <- c(resultados, diff_filas)
  
}

# Establecer los datos conocidos.
n <- length(ids_unicos)
grados_libertad <- n - 1
valor_nulo <- 22.4

# Comprobación similaridad a distribución normal mediante gráfico Q-Q.
g <- ggqqplot(data = data.frame(resultados),
              x = "resultados",
              color = "steelblue",
              xlab = "Teórico",
              ylab = "Muestra",
              title = "Gráfico Q-Q muestra v/s distr. normal")

print(g)

# Fijar un nivel de significación.
alfa <- 0.05

# Calcular el estadístico de prueba.
media <- mean(resultados)
desv_est <- sd(resultados)
error <- desv_est / sqrt(n)
t <- (media - valor_nulo) / error

# Calcular el valor p.
p <- pt(t, df = grados_libertad, lower.tail = TRUE)

# Construir el intervalo de confianza.
t_critico <- qt(alfa, df = grados_libertad, lower.tail = FALSE)
superior <- media + t_critico * error

# Aplicar la prueba t de Student con la función de R.
prueba <- t.test(resultados,
                 alternative = "less",
                 mu = valor_nulo,
                 conf.level = 1 - alfa)

print(prueba)

# Como el valor de p esta por encima del valor de alfa
# o tambien llamado nivel de significancia, podemos aceptar 
# la hipotesis nula y rechazar la alternativa.

# 3. ¿Es posible afirmar que, en promedio, los pollitos alimentados con maravilla superan por más de 0.02
# gramos a los alimentados con soya a los 4 días de nacidos?

# Pollos alimentados con maravilla superan por más de 0.02 a alimentados con soya a los 4 días
# H0 --> peso pollos dictados diferencia con los alimentados con soya por µ <= 0.02
# H1 --> peso pollos dictados diferencia con los alimentados con soya por µ > 0.02

# Generamos una lista con los datos de los pesos.
datosSoy_3 <- subset(poblacion, DIETA == "Soya" & DIA == 4)$PESO
datosMar_3 <- subset(poblacion, DIETA == "Maravilla" & DIA == 4)$PESO

# Muestras de pollos independientes entre sí.
# Comprobación similaridad a distribución normal mediante gráfico Q-Q.
g_pollos_3.1 <- ggqqplot(data = data.frame(datosSoy_3),
              x = "PESO",
              color = "steelblue",
              xlab = "Teórico",
              ylab = "Muestra",
              title = "Gráfico Q-Q muestra v/s distr. normal")
print(g_pollos_3.1)

g_pollos_3.2 <- ggqqplot(data = data.frame(datosMar_3),
              x = "datosMar_3",
              color = "steelblue",
              xlab = "Teórico",
              ylab = "Muestra",
              title = "Gráfico Q-Q muestra v/s distr. normal")
print(g_pollos_3.2)

# Establecer nivel de significancia
alfa <- 0.05

# Usamos prueba de normalidad de Shapiro-Wilk
normSoy<- shapiro.test(datosSoy_3)
print(normSoy)
# p-value = 0.3198

normMar <- shapiro.test(datosMar_3)
print(normMar)
# p-value = 0.6111

# Para estos resultados ya se ve un p-value mayor al nivel de significancia.

prueba <- t.test(y=datosMar_3,
                   x=datosSoy_3,
                   paired=FALSE,
                   alternative= "greater",
                   mu=0.02,
                   conf.level=1-alfa
)
print(prueba)

# Se observa que el p-value es mucho mayor al nivel de significancia, siendo este p = 0.9552,
# por lo que se toma a favor la hipótesis nula rechazando la alternativa.
# Finalmente, no es posible afirmar que los pollitos alimentados con maravilla
# superan por más de 0.02 gramos a los alimentados con soya a los 4 días de nacidos.
