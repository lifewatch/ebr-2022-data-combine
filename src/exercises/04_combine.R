library(raster)
library(sf)


df1 <- head(df)

test <- st_join(df1, seabed_layers)

test2 <- raster::extract()