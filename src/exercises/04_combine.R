library(raster)
library(sf)


df1 <- head(df)


#---------------------------------------------------------------------------------------------
# Exercise 4.1.: 
#   - Join seabed data with the dataset
#
#---------------------------------------------------------------------------------------------

test <- st_join(df1, seabed_layers)

#---------------------------------------------------------------------------------------------
# Exercise 4.2.: 
#   - Extract temperature data from Bio-Oracle layers
#
#---------------------------------------------------------------------------------------------

df1$temperature <- extract(layers$BO22_tempmean_ss, sf::as_Spatial(df1))
df1$temperature_2050 <- extract(layers$BO22_RCP85_2050_tempmean_ss, sf::as_Spatial(df1))
df1$temperature_2100 <- extract(layers$BO22_RCP85_2100_tempmean_ss, sf::as_Spatial(df1))
