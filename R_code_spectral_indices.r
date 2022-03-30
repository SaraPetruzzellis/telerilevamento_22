library(raster)
setwd("C:/lab/")

#import the first file -> defor1_.jpg -> give it the name l1992

l1992 <- brick("defor1_.png")
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

#import the second file and give it the name l2006
l2006 <- brick("defor2_.png")
l2006
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

#plot in multiframe the 2 images
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

#DVI Difference Vegetation Index
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1992, col=cl)

dvi2006 = l2006[[1]] - l1992[[2]]
dvi2006

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2006, col=cl)
plot(dvi2006, col=cl)

#DVI difference in time 
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100) 
dev.off()
plot(dvi_dif,col=cld)
