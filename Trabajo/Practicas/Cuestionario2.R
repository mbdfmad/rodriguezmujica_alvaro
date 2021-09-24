#Cual es el IQR de los elementos del vector datos?
set.seed(114)
library(MASS)
datos = mvrnorm(n = 10000, mu = 3.14, Sigma = 1.3^2, empirical = TRUE)
IQR(datos)

#¿Cuál es la desviación típica de esas medias muestrales?
set.seed(199)
library(MASS)
pob = mvrnorm(n = 513, mu = 3.2, Sigma = 0.704^2, empirical = TRUE)
k = 10000
mediasMuestrales = replicate(k, {
  muestra = sample(pob, 11, replace = TRUE)
  mean(muestra)
})
sd(mediasMuestrales)
# ¿Cual es la respuesta correcta?
library(tidyverse)
bA1 <- read_csv("./Data/boxplot_atipicos_05.csv")
View(bA1)
ggplot() + 
  geom_boxplot(bA1, mapping = aes(x = x))

#La variable aleatoria X es binomial, de tipo B(5, 0.5). Calcula la probabilidad
#P(X=2)
signif(dbinom(x = 2, size = 5, prob = 0.5), 4)

#La variable aleatoria X es binomial, de tipo B(11,0.4). Calcula la probabilidad
#P(4<X<2)
signif(pbinom(3, 11, 0.4) - pbinom(2, 11, 0.4), 4)

#La variable aleatoria X es binomial, de tipo B(12,0.5). Calcula la probabilidad
#P(3<=X<4)
signif(pbinom(3, 12, 0.5) - pbinom(3, 12, 0.5) + dbinom(3, 12, 0.5), 4)

#La variable aleatoria X es binomial, de tipo B(6,0.4). Calcula la probabilidad
#P(3<X<=5)
signif(pbinom(5, 6, 0.4) - pbinom(3, 6, 0.4), 4)

# La variable aleatoria X es binomial, de tipo B(14,0.5). Calcula la probabilidad
# P(3<=X<=5)
pbinom(5, size = 14, prob = 0.5) - pbinom(2, size = 14, prob = 0.5)

#La variable aleatoria X es binomial, de tipo B(9,0.6). Calcula la probabilidad
#P(X > 1)
pbinom(1, size = 9, prob = 0.6, lower.tail = FALSE)

#La variable aleatoria X es binomial, de tipo B(5,0.4). Calcula la probabilidad
#P(X >= 1)
pbinom(1, 5, 0.4, lower.tail = FALSE) + dbinom(1, 5, 0.4)


#La variable aleatoria X es binomial, de tipo B(2,0.7). Calcula la probabilidad
#P(X<1)
pbinom(1, 2, 0.7) - dbinom(1, 2, 0.7)

#La variable aleatoria X es binomial, de tipo B(8,0.3). Calcula la probabilidad
#P(X<=4)
signif(pbinom(4, 8, 0.3), 4)

