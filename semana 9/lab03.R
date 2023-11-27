#Integrantes Javier H-Yasniela R
#Necesitaremos estas librerias para generar los datos
install.packages("hexbin")
install.packages("ggplot2")

library(hexbin)
library(ggplot2)


#1. Exploración inicial de datos

datos<-read.csv(file = "files/rentadebicis.csv",header = T,sep = ",",encoding = "latin1")
View(datos)
#1.1 Obtener información sobre las columnas y tipos de datos
head(datos)
#Con la siguiente instrucción, se pueden ver las columnas y las 6 primeras filas de datos. Se observa que
#todas las filas de datos son valores numéricos.

#1.2 Resumen estadístico de las variables numéricas
summary(datos)
#Con la siguiente instrucción se puede observar los datos como, valor minimo, máximo, media (promedio), mediana,
#y los cuartiles 1 y 3 de cada una de las columnas. En esta caso, todas las columnas poseen valores
#númericos


#---------------------


#2.Limpieza y Tratamiento de Datos:

#2.1 Determine valores nulos.
#Es función se encarga de identificar si existen nulos dentro del data frame. Si retorna "TRUE" significa
#que existen más de 1 valor nulo, si retorna "FAlSE" quiere decir que no existen valores nulos dentro
#del data frame. En este caso, el valor retornado es "FALSE".
any(is.na(datos))

#En caso de que hubiese retornado "TRUE" se podría utilizar esta funión para medir la cantidad de 
#nulos dentro del data frame. PERO no fue necesario.
nerysF <-function(x) {
  a<-mean(x);
  b<-sum(x)
  return(c(a,b))
}
apply(is.na(datos), 2, nerysF)

#2.2 Determine valores atípicos.
#Con los siguiente boxplot se pueden observar los valores atípicos de cada variable categorica extraida
#del data frame:

#Dia de la semana
boxplot(datos$rentas_totales ~ datos$dia_de_la_semana, main="Boxplot de Monto por Dia de la semana", xlab="DiaDeLaSemana", ylab="Monto")
#Se encuentran valores atípicos que superan el máximo.

#Mes
boxplot(datos$rentas_totales ~ datos$mes, main="Boxplot de Monto por Mes", xlab="Mes", ylab="Monto")
#Se encuentran valores atípicos que superan el máximo.

#Año
boxplot(datos$rentas_totales ~ datos$año, main="Boxplot de Monto por Año", xlab="año", ylab="Monto")
#Se encuentran valores atípicos que superan el máximo.

#Estación
boxplot(datos$rentas_totales ~ datos$estacion, main="Boxplot de Monto por Estacion", xlab="estacion", ylab="Monto")
#Se encuentran valores atípicos que superan el máximo.

#2.3 Determine concentraciones y tendencia de datos.
hist(datos$rentas_totales, main = "Histograma de las rentas totales",
     xlab = "RentasTotales", ylab = "Frecuencia",
     col = "purple")
#En el siguiente histograma, se aprecia un sesgo a la izquiera y se observan concentraciones de datos
#entre los primeros valores.

#2.4 Determine acciones correctivas (imputación).
#No es necesario realizar imputaciones, ya que no existen valores nulos o vacíos dentro del dataframe.


#---------------------


#3. Visualización de datos.
#3.1. Realice las gráficas de datos y agrupaciones para las variables categóricas en el dataset.
#Dia de la semana
ggplot(datos, aes(x = datos$dia_de_la_semana, y = datos$rentas_totales)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Rentas totales por dia de la semana") +
  xlab("DiaDeLaSemana") +
  ylab("RentasTotales")
#En el siguiente gráfico se aprecia que el día que genera más renta es el 6 (sábado) y el dia que genera menos
#renta es el 7 (domingo)

#Mes
ggplot(datos, aes(x = datos$mes, y = datos$rentas_totales)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Rentas totales por mes") +
  xlab("Mes") +
  ylab("RentasTotales")
#En el siguiente gráfico se aprecia que el mes 6 (Junio) genera más renta y el mes que genera menos
#renta es el 1 (Enero)

#Año
ggplot(datos, aes(x = datos$año, y = datos$rentas_totales)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Rentas totales por año") +
  xlab("Año") +
  ylab("RentasTotales")
#En el siguiente gráfico se aprecia que el año 2012 es el que genera más renta y el año que genera menos
#renta es el 2011

#Estación
ggplot(datos, aes(x = datos$estacion, y = datos$rentas_totales)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Rentas totales por estación") +
  xlab("Estación") +
  ylab("RentasTotales")

#En el siguiente gráfico se aprecia que la estación que genera más renta es la 3 y estación que genera menos
#renta es 1.


#---------------------


# 4. Análisis de Relaciones de Datos:
# 4.1 Análisis Univariable y Bivariable

# En la dataframe analizada, se nota que las relaciones entre variables como las rentas con los diferentes números

library(dplyr)
datos %>% group_by(mes) %>% summarise(total=sum(rentas_totales))

#se pueden ver las relaciones entre diferentes variables cuando el porcentaje es mayor al 50

cor(datos)
  
