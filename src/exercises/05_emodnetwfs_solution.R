# devtools::install_github("EMODnet/EMODnetWFS")
# devtools::install_github("eblondel/ows4R")
library(EMODnetWFS)
library(mapview)
library(sf)

# Check services available
emodnet_wfs()

# Start client seabed habitats and check layers available
seabed_client <- emodnet_init_wfs_client("seabed_habitats_general_datasets_and_products")
View(emodnet_get_wfs_info(seabed_client))

# Get layer sandbanks
seabed_sandbanks <- emodnet_get_layers(
  wfs = seabed_client, 
  layers = "art17_hab_1110", 
  reduce_layers = TRUE
) %>% 
  st_cast(to = "GEOMETRYCOLLECTION") %>% 
  st_collection_extract(type = "POLYGON")

# Inspect
mapview(seabed_sandbanks)


# Get windfarms
human_client <- emodnet_init_wfs_client("human_activities")
View(emodnet_get_wfs_info(human_client))

human_windfarms <- emodnet_get_layers(
  wfs = human_client, 
  layers = "windfarmspoly", 
  reduce_layers = TRUE
)

# Inspect
mapview(human_windfarms)
