# API library
library(eurobis)

# Helper library
library(dplyr)
library(tidyr)

#---------------------------------------------------------------------------------------------
# Exercise 2.1.: 
#  - Use the eurobis R package to get EurOBIS data for the same species, time and location. 
#
# Hint: more info with ?eurobis_occurrences_basic()
#---------------------------------------------------------------------------------------------
list_aphia = unique(etn$valid_AphiaID)

basic <- eurobis_occurrences_basic(
  mrgid = 3293,
  aphiaid = list_aphia,
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
#   - Select the following columns: datecollected, decimallongitude, decimallatitude, 
#     scientificname, aphiaid
#   - As we are not considering the individual fishes tracked but only presences, there will be 
#     duplicates. Get unique combination of values
#   - Bind the rows of both datasets
#
# Hint: the aphiaID from EurOBIS comes with a full URL. Use `gsub()` or `stringr::str_replace()` 
#       together with `as.numeric()` to get only the AphiaID 
# Hint: we recommend to use `dplyr::transmute()`, `unique.data.frame()` and `dplyr::bind_rows()`
# Hint: EurOBIS follows the Darwin Core standard for naming the columns: https://dwc.tdwg.org/terms/
#---------------------------------------------------------------------------------------------
colnames(etn)
colnames(basic)

basic <- basic %>% select(datecollected, decimallongitude, decimallatitude, scientificname, aphiaid
             ) %>% mutate(datecollected = as.character(datecollected),
                          aphiaid = gsub("http://marinespecies.org/aphia.php?p=taxdetails&id=", "", aphiaid, fixed = TRUE)
             ) %>% mutate(aphiaid = as.integer(aphiaid))

df <- etn %>% 
  transmute(
    datecollected = time,
    decimallongitude = longitude,
    decimallatitude = latitude,
    scientificname = scientific_name, 
    aphiaid = AphiaID
  ) %>% arrange(
    scientificname, datecollected
  ) %>%
  unique.data.frame(
  ) %>% 
  bind_rows(basic)


#---------------------------------------------------------------------------------------------
# Bonus Exercise 2.4.: 
#  - Repeat the query adding all the information available in EurOBIS
#  - Get all the distinct values of the parameters_* columns
#  - Pivot the table to turn the values of "parameter" into columns, with the "parameter_values"
#    as values. Select only a few columns and use `distinct()`
#
# Hint: use `eurobis_occurrences_full_and_parameters()`
# Hint: use `st_drop_geometry()` to simplify
# Hint: pivot with: `tidyr::pivot_wider()` and the arguments `names_from` and `values_from`
# Hint: more information here: https://www.emodnet-biology.eu/emodnet-data-format
#---------------------------------------------------------------------------------------------

# Download all the info available in EurOBIS
full_emof <- eurobis_occurrences_full_and_parameters(
  mrgid = 3293,
  aphiaid = list_aphia,
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

# Pivot parameter into columns
full_emof %>% 
  st_drop_geometry() %>%
  select(scientificname, datecollected, decimallongitude, decimallatitude, parameter, parameter_value) %>%
  pivot_wider(names_from = parameter, values_from = parameter_value) %>%
  distinct() %>%
  View()


# Save
saveRDS(basic, "./save/02_basic.rds")
saveRDS(df, "./save/02_df.rds")
