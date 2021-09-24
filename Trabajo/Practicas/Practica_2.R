library(tidyverse)
library(kernlab)
data(spam)
spam[1:4, c(5:10, 58)]

#Cual es la probabilidad de que sea spam?
pSpam = spam %>% 
  count(type) %>% 
  mutate(prob = n/sum(n)) %>% 
  .[2, 3]


#Cual es la probabilidad de que contenga la palabra order?
pOrder = spam %>% 
  mutate(hasOrder = (order > 0)) %>% 
  select(order, hasOrder)%>% 
  count(hasOrder) %>% 
  mutate(prob = n/sum(n)) %>% 
  .[2, 3]

#or

pOrder2 = spam %>% 
  summarize(hasOrder = mean(order > 0)) %>% 
  .[1,1]


#Sabiendo que un mensaje es spam, cual es la probabilidad de que 
#contenga la palabra order

pOrder_y_spam = spam %>% 
  summarize(ambos = mean((order > 0) & type == "spam")) %>% 
  .[1,1]

pOrder_si_spam = pOrder_y_spam / pSpam


#Usando la formula de Bayes: sabiendo que un mensaje contiene la 
#palabra order, ¿cual es la probabilidad de que sea spam?

pSpam_si_order = pOrder_y_spam / pOrder

#or 

pSpam_si_order = spam %>% 
  filter(order > 0) %>% 
  select(order, type) %>% 
  count(type) %>% 
  mutate(prob = n/sum(n)) %>% 
  .[2,3]

library(readr)
clientes <- read_csv("churn_data.csv")

clientes <- clientes %>% 
  select(Contract, Churn) %>% 
  mutate(contrato = Contract == "Month-to-month")

# (tablaContingencia = table(clientes$Churn, clientes$contrato))

colnames(tablaContingencia) = c("Largo","Mensual" )
rownames(tablaContingencia) = c("Nochurn", "Churn" )
tablaContingencia


sum(tablaContingencia)


# Añadimos margenes
(tablaContingenciaAmpliada = addmargins(tablaContingencia))

# Intersecciones
(tablaContingenciaRel = tablaContingenciaAmpliada / sum(tablaContingencia))

# Dividimos cada fila por su suma (usando prop.table):
(tablaMarginalFilas = prop.table(tablaContingencia, margin = 1))
addmargins(tablaMarginalFilas) # Condicionadas por prueba+ / prueba-


# Dividimos cada columna por su suma:
(tablaMarginalColumnas = prop.table(tablaContingencia, margin = 2))
addmargins(tablaMarginalColumnas)  # Condicionadas por sano / enfermo


#B(6, 0.3) p(X = 2)
signif(dbinom(x = 2,size =  6,prob =  0.3), 4)
signif(pbinom(5, size = 15, prob = 0.4) - pbinom(3, size = 15, prob = 0.4), 4)
signif(dbinom(x = 2:5,size =  6,prob =  0.3), 4)

