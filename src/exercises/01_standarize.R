# API libraries
library(lwdataexplorer)
library(worrms)
library(mregions2)

## Helper libraries
library(dplyr)
library(mapview)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 1.1.: 
# - Get fish data from the European Tracking Network of the year 2021
# - Remove white spaces in the species names
#
# Hint: use `?getEtnData()` to find more information
# Hint: you may need `trimws()`
#---------------------------------------------------------------------------------------------
etn <- getEtnData(
  startdate = "2015-01-01",
  stopdate = "2016-01-01",
  action = "Time bins",
  by = "1 week",
  networks = "All",
  projects = "All"
)

# With dplyr
etn <- etn %>% 
  mutate(scientific_name = trimws(scientific_name)) 

# With R base
etn$scientific_name <- trimws(etn$scientific_name)

# Inspect
View(etn)


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

# dplyr
species_list <- etn %>% distinct(scientific_name)

# base
species_list <- unique(etn$scientific_name)

# Taxon match
species_matched <- wm_records_taxamatch(species_list)
species_matched <- do.call(rbind, species_matched)

# Left join
etn <- left_join(etn, species_matched, by = c("scientific_name" = "scientificname"))

# Inspect
View(etn)


#---------------------------------------------------------------------------------------------
# Exercise 1.3.: 
# - Use the mregions2 package to find and get the record for the North Sea.
# - Do a geospatial intersection between the latitude and longitude fields in the ETN 
# data and the North Sea from Marine Regions. 
#
# TODO ADD TO SLIDES
# To do spatial calculations, you must transform the ETN data from a data.frame to the 
# class `sf`. Do it with sf::st_as_sf() with the arguments `coords` and `crs`. 
#
# In `coords`, you can pass the columns of your dataset containing the longitude and latitude 
# as `coords = c("column_with_longitude", "column_with_latitude")`
# set `remove = FALSE` to keep the longitude and latitude columns
#
# In `crs` you provide the Coordinate Reference System. We assume this is 4326. 
# More info in: https://inbo.github.io/coding-club/sessions/20190226_gis_vector.html
# END TODO
#
# Hint: all functions from the sf package start as `sf_*()`
# For example: `st_intersection()`
#---------------------------------------------------------------------------------------------

# Find the North Sea
mr_gaz_records_by_names("North Sea", FALSE)
north_sea <- mr_gaz_record(2350)

# Transform data frame into simple feature object
etn <- etn %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326, remove = FALSE)

# Inspect both
mapview(list(etn, north_sea))

# Get unique list of longitude and latitude combinations


# Perform the intersection
system.time(
  etn <- st_intersection(etn, north_sea)
)
# user  system elapsed 
# 517.85   15.19  533.74 
# Inspect again
mapview(list(etn, north_sea))


#---------------------------------------------------------------------------------------------
# Exercise 1.4.: 
# - Wrangle data to have only a subset of columns:
#   - Species name
#   - Aphia ID
#   - Valid Aphia ID
#   - Time
#   - Longitude and Latitude
# - Save results to `./data`
# 
# Hint: We recommend to use`dplyr::select()`
#---------------------------------------------------------------------------------------------

# See all the columns
colnames(etn)

# Subset a few
etn <- etn %>% select(
  scientific_name, AphiaID, valid_AphiaID, valid_name,
  time, 
  longitude, latitude, MRGID
)

# Inspect
View(etn)

# To turn into a data.frame again
st_drop_geometry(etn)

# Save as shapefile or csv
st_write(etn, "./data/etn.shp")
write.csv(st_drop_geometry(etn), "./data/etn.csv")
