# API library
library(eurobis)

# Helper library
library(dplyr)

#---------------------------------------------------------------------------------------------
# Exercise 2.1.: 
#  - Use the eurobis R package to get EurOBIS data for the same species, time and location. 
#
# Hint: more info with ?eurobis_occurrences_basic()
#---------------------------------------------------------------------------------------------
mrgid = 2350
list_aphia = unique(etn$valid_AphiaID)

basic <- eurobis_occurrences_basic(
  mrgid = mrgid,
  aphiaid = species_matched$AphiaID,
  start_date = "2015-01-01",
  end_date = "2016-01-01"
)

#---------------------------------------------------------------------------------------------
# Exercise 2.2.: 
#  - Include more regions in your query! 
#    - Select your desired area with`eurobis_map_draw()` and pass to the argument `geometry` 
#    - Find more standardized marine regions with the family of functions `eurobis_map_regions_*()`
#  - Find data for the species of your interest by passing a scientific name.
#  - Find data for the functional group of your interest.
#---------------------------------------------------------------------------------------------
my_polygon <- eurobis_map_draw()

eurobis_map_regions_ecoregions()
eurobis_map_regions_eez()
eurobis_map_regions_iho()
eurobis_map_regions_eez_iho()
eurobis_map_regions_reportingareas()

basic <- eurobis_occurrences_basic(
  geometry = my_polygon,
  mrgid = c(2350),
  functional_groups = c("birds", "mammals")
)


#---------------------------------------------------------------------------------------------
# Exercise 2.3.:
#   - Wrangle the ETN dataset to fit the column names of eurobis.
#   - Bind the rows of both datasets
#   - Calculate the number of new occurrences retrieved from eurobis compared to lwdataexplorer
#
# Hint: we recommend to use `dplyr::transmute()` and `dplyr::bind_rows()`
# Hint: EurOBIS follows the Darwin Core standardized names: https://dwc.tdwg.org/terms/
#---------------------------------------------------------------------------------------------
colnames(etn)
colnames(basic)

basic <- basic %>% select(-gml_id, -id, -datasetid, -coordinateuncertaintyinmeters
             ) %>% mutate(datecollected = as.character(datecollected),
                          aphiaid = gsub("http://marinespecies.org/aphia.php?p=taxdetails&id=", "", aphiaid, fixed = TRUE)
             ) %>% mutate(aphiaid = as.integer(aphiaid))

df <- etn %>% 
  transmute(
    datecollected = time,
    decimallongitude = longitude,
    decimallatitude = latitude,
    scientificname = scientific_name, 
    aphiaid = AphiaID,
    scientificnameaccepted = valid_name
  ) %>% 
  bind_rows(basic)


#---------------------------------------------------------------------------------------------
# Bonus Exercise 2.4.: 
#  - Repeat the query adding all the information available in EurOBIS
#  - Get all the distinct values of the parameters_* coumns
#  - Filter only records with count of individuals
#
# Hint: use `eurobis_occurrences_full_and_parameters()`
# Hint: more information here: https://www.emodnet-biology.eu/emodnet-data-format
#---------------------------------------------------------------------------------------------
full_emof <- eurobis_occurrences_full_and_parameters(
  mrgid = mrgid,
  aphiaid = species_matched$AphiaID,
  start_date = "2015-01-01",
  end_date = "2016-01-01"
)

# View all parameters available
full_emof %>% 
  st_drop_geometry() %>%
  select(parameter, 
         parameter_bodcterm, 
         parameter_bodcterm_definition,
         parameter_measurementtypeid) %>%
  distinct() %>% 
  View()

# Query only Counts
full_emof2 <- full_emof %>%
  filter(parameter_measurementtypeid == "http://vocab.nerc.ac.uk/collection/P01/current/OCOUNT01/")

#---------------------------------------------------------------------------------------------
# Bonus exercise 2.5.: 
#  - Get the CPR Survey dataset. It has more than 2M occurrences: it will take some time!
# 
# Hint: Metadata page in https://www.emodnet-biology.eu/data-catalog?module=dataset&dasid=216
# Hint: Large queries are better done using pagination. Check ?eurobis_occurrences()
#---------------------------------------------------------------------------------------------
cpr <- eurobis_occurrences_basic(
  dasid = 216,
  paging = TRUE,
  paging_length = 5000
)