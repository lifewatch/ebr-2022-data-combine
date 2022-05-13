# API library
library(EMODnetWFS)
library(sdmpredictors)

# Helper library
library(dplyr)
library(mapview)
library(sf)


#---------------------------------------------------------------------------------------------
# Exercise 3.1.:
#  - Get EMODnet Seabed Habitats using EMODnetWFS
#    - Start client
#    - Explore layers available
#    - Select habitats directive layers about Sandbanks and Reefs
#
#---------------------------------------------------------------------------------------------

# Check services available
emodnet_wfs()

# Start client seabed habitats and check layers available
seabed_client <- emodnet_init_wfs_client("seabed_habitats_general_datasets_and_products")

seabed_info <- emodnet_get_wfs_info(seabed_client)
View(seabed_info)

# Get layer sandbanks and reef
seabed_layers <- emodnet_get_layers(
  wfs = seabed_client, 
  layers = c("art17_hab_1110", "art17_hab_1170"),
  reduce_layers = TRUE,
  crs = 4326
) %>% 
  st_cast(to = "GEOMETRYCOLLECTION") %>% 
  st_collection_extract(type = "POLYGON")

# Inspect
mapview(seabed_layers, zcol = "habitat_description", burst = TRUE)


#---------------------------------------------------------------------------------------------
# Exercise 3.2.: 
#  - Get mean sea surface temperature from Bio-Oracle from present and future conditions using 
#    the sdmpredictors R package.
#  - Get the same data for future conditions under RCP85, for both 2050 and 2100.
#
# Hint: List all layers with `list_layers("Bio-ORACLE)` and list_layers_future("Bio-ORACLE")
#---------------------------------------------------------------------------------------------

# See all present layers available
list_layers <- list_layers("Bio-ORACLE", version = 2.2)
View(list_layers)

# Repeat for future layers
list_layers_future <- list_layers_future("Bio-ORACLE", version = 2.2)
View(list_layers_future)

# Get the codes of the layers
layer_codes <- c(
  "BO22_tempmean_ss", 
  "BO22_RCP85_2050_tempmean_ss",
  "BO22_RCP85_2100_tempmean_ss"
)

# Load the layers
layers <- load_layers(layer_codes, rasterstack = TRUE, datadir = "./data/")

# Inspect
mapview(layers)