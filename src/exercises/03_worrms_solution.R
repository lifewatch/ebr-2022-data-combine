library(worrms)
library(dplyr)

# Get unique list of species. Watch out for string inconsistencies (e.g. leading spaces)
species_list <- lw_data_etn_bpns %>% 
  st_drop_geometry() %>% 
  mutate(
    scientific_name = trimws(scientific_name, "both")
  ) %>%
  distinct(scientific_name)

# Perform taxon match with worrms.
species_matched <- wm_records_taxamatch(species_list[, 1])

# Transform into data frame
species_matched <- do.call(rbind, species_matched)

# Inspect, note the field AphiaID
glimpse(species_matched)