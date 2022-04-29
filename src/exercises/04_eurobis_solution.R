# devtools::install_github("lifewatch/eurobis@develop")
library(eurobis)

# Get data on the belgian part of the north sea for the species
eurobis_data <- eurobis_occurrences(
  type = "full", 
  mrgid = mrgid,
  # geometry = test_wkt,
  # startdate, 
  # enddate, 
  aphiaid = species_matched$AphiaID
  # , scientificname
)
