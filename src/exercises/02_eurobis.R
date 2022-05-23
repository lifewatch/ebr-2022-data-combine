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


#---------------------------------------------------------------------------------------------
# Exercise 2.2.: 
#  - Include more regions in your query! 
#    - Select your desired area with`eurobis_map_draw()` and pass to the argument `geometry` 
#    - Find more standardized marine regions with the family of functions `eurobis_map_regions_*()`
#  - Find data for the species of your interest by passing a scientific name.
#  - Find data for the functional group of your interest.
#---------------------------------------------------------------------------------------------


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




# You can load this to continue with the workshop if something went wrong:
# readRDS("./save/02_basic.rds")
# readRDS("./save/02_df.rds")