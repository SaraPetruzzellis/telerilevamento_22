# Code for generating land cover maps from satellite

setwd("C:/lab/")
library(raster)
library(RStoolbox)

install.packages("ggplot2")
library(ggplot2)

install.packages("patchwork")
library(patchwork)


l92 <- brick("defor1_.png")
plotRGB(l92, 1, 2, 3, stretch="lin")

#import defor2 and plot both in a single window

l06 <- brick("defor2_.png")
par(mfrow=c (1,2))
plotRGB(l92, 1, 2, 3, stretch="lin")
plotRGB(l06, 1, 2, 3, stretch="lin")

#multiframe with ggplot2 

ggRGB(l92, 1, 2, 3, stretch="lin")
ggRGB(l06, 1, 2, 3, stretch="lin")

p1 <- ggRGB(l92, 1, 2, 3, stretch="lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch="lin")
p1+p2 
p1/p2 #p1 on top of p2

#classification
l92c <- unsuperClass(l92, nClasses=2)
l92c
plot(l92c$map)
#class 1: agricultural areas+water
#class 2: forest

#classify the landsat image from 2006
l06c <- unsuperClass(l06, nClasses=2)
l06c
plot(l06c$map)
#class 1: agricultural areas+water 
#class 2: forest

#frequencies 

freq(l92c$map)
#class 1= 305213 pixels ( agricultural areas+water )
#class 2= 36079 pixels (forest)

freq(l06c$map)
#class 1= 177941 pixels (agricoltural areas)
#class 2= 164785 pixels (forest)
