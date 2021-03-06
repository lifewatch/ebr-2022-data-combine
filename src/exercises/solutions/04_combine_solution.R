library(raster)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 4.1.: 
#   - Join seabed data with the dataset
#
# Hint: use the `sf` package to perform the join and `dplyr` to select only the 
#      `habitat_description` column
#---------------------------------------------------------------------------------------------
seabed_layers <- seabed_layers %>% dplyr::select(habitat_description)

df <- st_join(df, seabed_layers)

#---------------------------------------------------------------------------------------------
# Exercise 4.2.: 
#   - Extract temperature data from Bio-Oracle layers
#
# Hint: use `raster::extract`. The geometries must be transformed into another spatial type. Try
#       with `sf::as_Spatial()`
#---------------------------------------------------------------------------------------------
df$temperature <- extract(layers$BO22_tempmean_ss, sf::as_Spatial(df))
df$temperature_2050 <- extract(layers$BO22_RCP85_2050_tempmean_ss, sf::as_Spatial(df))
df$temperature_2100 <- extract(layers$BO22_RCP85_2100_tempmean_ss, sf::as_Spatial(df))

View(st_drop_geometry(df))

#---------------------------------------------------------------------------------------------
# Bonus Exercise 4.3.: 
#   - This is the end of the workshop. Feel free to try things on this curated dataset!
#
#---------------------------------------------------------------------------------------------

# Save
saveRDS(df, "./save/04_df.rds")