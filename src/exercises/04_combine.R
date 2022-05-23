library(raster)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 4.1.: 
#   - Join seabed data with the dataset
#
# Hint: use the `sf` package to perform the join and `dplyr` to select only the 
#      `habitat_description` column
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Exercise 4.2.: 
#   - Extract temperature data from Bio-Oracle layers
#
# Hint: use `raster::extract`. The geometries must be transformed into another spatial type. Try
#       with `sf::as_Spatial()`
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Bonus Exercise 4.3.: 
#   - This is the end of the workshop. Feel free to try things on this curated dataset!
#
#---------------------------------------------------------------------------------------------




# You can load this to continue with the workshop if something went wrong:
# readRDS("./save/04_df.rds")