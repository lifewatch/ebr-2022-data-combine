# API libraries
library(lwdataexplorer)
library(worrms)
library(mregions2)

## Helper libraries
library(mapview)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 1.1.: 
# - Get fish tracking data from the European Tracking Network of the year 2015
#
# Hint: use `?getEtnData()` to find more information
#---------------------------------------------------------------------------------------------
etn <- getEtnData(
  startdate = "2015-01-01",
  stopdate = "2016-01-01",
  action = "Time bins",
  by = "1 day",
  networks = "All",
  projects = "All"
)

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

# Unique list of species
species_list <- unique(etn$scientific_name)

# Taxon match
species_matched <- wm_records_taxamatch(species_list)
species_matched <- do.call(rbind, species_matched)

# Left join
etn <- merge(etn, species_matched, by.x = "scientific_name", by.y = "scientificname")

# Inspect
View(etn)


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

# Find the North Sea
mr_belgian <- mr_gaz_records_by_names("Belgian")
View(mr_belgian)

bpns <- mr_gaz_record(3293)

# Transform data frame into simple feature object
etn <- st_as_sf(etn, coords = c("longitude", "latitude"), crs = 4326, remove = FALSE)

# Inspect both
mapview(list(etn, bpns))

# Perform the intersection
etn <- st_intersection(etn, bpns)

# Inspect again
mapview(list(etn, bpns))


#---------------------------------------------------------------------------------------------
# Bonus Exercise 1.4.: 
# - Save the ETN data into disk
#
#---------------------------------------------------------------------------------------------

# To turn into a data.frame again
st_drop_geometry(etn)

# Save as geopackage or csv
# more info at https://inbo.github.io/tutorials/tutorials/spatial_standards_vector/
st_write(etn, "./data/etn.gpkg")
write.csv(st_drop_geometry(etn), "./data/etn.csv")

# Save
saveRDS(etn, "./save/01_etn.rds")

