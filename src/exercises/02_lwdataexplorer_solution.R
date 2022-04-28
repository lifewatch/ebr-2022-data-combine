# devtools::install_github("lifewatch/lwdataexplorer")
library(lwdataexplorer)
library(dplyr)
library(mapview)
library(sf)

# Get fish data from the European Tracking Network
lw_data_etn <- getEtnData(
  startdate = "2021-01-01",
  stopdate = "2022-01-01",
  action = "Time bins",
  by = "1 day",
  networks = "All",
  projects = "All"
)

glimpse(lw_data_etn)

# Turn into sf object for geospatial operations
lw_data_etn_sf <- lw_data_etn %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

mapview(lw_data_etn_sf)

# Select only those records in the BPNS
lw_data_etn_bpns <- st_intersection(lw_data_etn_sf, geom_sfc)

mapview(lw_data_etn_bpns, zcol = "counts")
