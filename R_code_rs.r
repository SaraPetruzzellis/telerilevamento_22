#Questo è il primo script che useremo a lezione

#install.packages("raster")
library(raster)

#settaggio cartella
setwd("C:/lab/")

#import
l2011 <- brick("p224r63_2011.grd")
l2011

#plot function
plot(l2011)

#ColorRampPalette, decido una serie di colori e adatto un'immagine, ('c' indica una serie di dati)
cl <- colorRampPalette(c("black","grey","light grey")) (100)
plot(l2011, col=cl)
