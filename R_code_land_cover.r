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


setwd("C:/lab/")
library(raster)
library(ggplot2)
library(patchwork)
library(RStoolbox)

l92 <- brick("defor1_.png")
l06 <- brick("defor2_.png")
ggRGB(l92, 1, 2, 3, stretch="lin")
ggRGB(l06, 1, 2, 3, stretch="lin")

l92c <- unsuperClass(l92, nClasses=2)
l92c
tot92 <- 341292

#proportion of classes
prop_forest_l92 <- 305213 / tot92
prop_forest_l92:0.894287

#percent of forest
perc_forest_l92 <- 305213 * 100 / tot92
perc_forest_l92:89.4287


#calculate percentage of agricultural areas in 1992
perc_agr_l92 <- 100 - perc_forest_l92
perc_agr_l92:10.5713

l06c <- unsuperClass(l06, nClasses=2)
l06c


#percentages 2006
tot06 <- 342726

#percent forest
percent_forest_06 <- 177941 *100 / tot06 
percent_forest_06:51.91932

#percent agricultural areas in 2006
perc_agr_06 <- 100 - percent_forest_06
perc_agr_06:48.08068

#FINAL DATA:
perc_forest_l92:89.4287
perc_agr_l92:10.5713
percent_forest_06:51.91932
perc_agr_06:48.08068

#build a dataframe 
#fields
class <- c("forest", "agriculture")
percent_92 <- c(89.4287, 10.5713)
percent_06 <- c(51.91932, 48.08068)

multitemporal <- data.frame(class,percent_92,percent_06)
multitemporal
View(multitemporal)

#1992
ggplot(multitemporal, aes(x=class, y=percent_92, color=class)) + geom_bar(stat="identity", fill="white")
#2006
ggplot(multitemporal, aes(x=class, y=percent_06, color=class)) + geom_bar(stat="identity", fill="white")

#pdf
pdf("percentages_06.pdf")
ggplot(multitemporal, aes(x=class, y=percent_06, color=class)) + geom_bar(stat="identity", fill="white")
dev.off()
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
