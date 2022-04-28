library(dplyr)
library(worrms)
species_list <- lw_data_etn_bpns %>% 
  st_drop_geometry() %>% 
  distinct(scientific_name)


species_matched <- wm_records_taxamatch(species_list[, 1])
species_matched <- do.call(rbind, species_matched)

glimpse(species_matched)
