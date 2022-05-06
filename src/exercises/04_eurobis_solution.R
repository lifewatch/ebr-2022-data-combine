# devtools::install_github("lifewatch/eurobis@develop")
library(eurobis)
library(dplyr)

## Exercise 4.1.: Use the eurobis R package to get EurOBIS data for the same species 
## retrieved via lwdataexplorer, occurring in the Belgian part of the North Sea in the year 2021
## Hint: use the mrgid argument to pass the correct Marine Regions identifier
## Hint: more info with ?eurobis_occurrences()
eurobis_data <- eurobis_occurrences(
  type = "basic", 
  mrgid = mrgid,
  startdate = "2021-01-01",
  enddate = "2022-01-01",
  aphiaid = species_matched$AphiaID
)

glimpse(eurobis_data)

## Bonus exercise 4.2.: Get occurrences of birds and mammals that are endangered in the area of your choice
## Hint: Use `eurobis_map_draw()` to draw a polygon interactively and pass it to `eurobis_occurrences()`
## Hint: Use the arguments `functional_groups` and `iucn_red_list`
my_polygon <- eurobis_map_draw()

eurobis_data_endangered <- eurobis_occurrences(
  type = "basic", 
  geometry = my_polygon,
  functional_groups = c("birds", "mammals"),
  iucn_red_list = "near threatened"
)

glimpse(eurobis_data_endangered)

## Bonus exercise 4.3.: Get the CPR Survey dataset. It has more than 2M occurrences: it will take some time!
## Hint: Metadata page in https://www.emodnet-biology.eu/data-catalog?module=dataset&dasid=216
## Hint: Large queries are better done using pagination
cpr <- eurobis_occurrences(
  type = "basic",
  dasid = 5649, # 216,
  paging = TRUE,
  paging_length = 5000
)
