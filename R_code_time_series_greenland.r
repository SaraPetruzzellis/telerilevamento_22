#Time series analysis of Greenland LST data
setwd("C:/lab/greenland_data")
library(raster)

lst2000 <- raster("lst_2000.tif")
lst2000
plot(lst2000)

#import all the data 
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

#multiframe of greenland data 

par(mfrow=c(2,2))
plot(lst2000, col=cl)
plot(lst2005, col=cl)
plot(lst2010, col=cl)
plot(lst2015, col=cl)

# import the whole set altogether

rlist <- list.files(pattern = "lst")
rlist

lapply(rlist, raster)
import <- lapply(rlist, raster)
tgr <- stack(import)

plot(tgr, col=cl)
plot(tgr[[1]], col=cl)

plotRGB(tgr, r=1, g=2, b=3, stretch="lin")
