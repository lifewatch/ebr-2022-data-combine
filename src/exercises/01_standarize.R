# API libraries
library(lwdataexplorer)
library(worrms)
library(mregions2)
# devtools::install_github("lifewatch/mregions2")
# devtools::install_github("lifewatch/lwdataexplorer")

## Helper libraries
library(mapview)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 1.1.: 
# - Get fish tracking data from the European Tracking Network of the year 2015
#
# Hint: use `?getEtnData()` to find more information
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Exercise 1.2.: 
# - Extract a list of species of the ETN data and 
# - Find more taxonomic information using the WoRMS Taxon Match from the worrms R package.
# - Left join the taxonomic info to the ETN dataset on the scientific name
#
# Hint: use `dplyr::distinct()` or `base::unique()` to get unique values
# Hint: worrms functions start all like `wm_*`
# Hint: use `do.call(rbind, my_data_frame)` to turn a list into a data frame
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Exercise 1.3.: 
# - Use the mregions2 package to find and get the record for the Belgian Part of the North Sea.
# - Do a geospatial intersection between the latitude and longitude fields in the ETN 
#   data and the North Sea from Marine Regions. 
#
# Hint: you must transform the ETN data from a data.frame to a simple feature `sf` class. 
#       Use the function `st_as_sf()` with the `coords` and `crs` arguments
# Hint: all functions from the sf package start as `sf_*()`
# For example: `st_intersection()`
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Bonus Exercise 1.4.: 
# - Save the ETN data into disk
#
#---------------------------------------------------------------------------------------------




# You can load this to continue with the workshop if something went wrong:
# readRDS("./save/01_etn.rds")