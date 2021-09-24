library(tidyverse)
library(sas7bdat)
library(haven)

FrecAbs = read_csv(file = "./data/FicheroCsv_FrecuenciaAbsoluta_01.csv")
table(FrecAbs$x)
mean(FrecAbs$x)

library(readr)
FicheroCsv_media_01 <- read_csv("Practicas/Data/FicheroCsv_media_01.csv")
mean(FicheroCsv_media_01$x)



mediaSPSS = read_sav(file = "./data/FicheroSPSS_media_01.sav")
mean(mediaSPSS$x)

mediaSAS = read_sas("./data/FicheroSAS_media_01.sas7bdat")
mean(mediaSAS$x)

mediana = read_csv(file = "./data/FicheroCsv_mediana_01.csv")
median(mediana$x)
