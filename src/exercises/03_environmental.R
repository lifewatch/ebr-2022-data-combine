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


#---------------------------------------------------------------------------------------------
# Exercise 3.2.: 
#  - Get mean sea surface temperature from Bio-Oracle from present and future conditions using 
#    the sdmpredictors R package.
#  - Get the same data for future conditions under RCP85, for both 2050 and 2100.
#
# Hint: List all layers with `list_layers("Bio-ORACLE)` and list_layers_future("Bio-ORACLE"). Look
#       only at the latest version (2.2)
# Hint: layers are loaded by providing the layer code
#---------------------------------------------------------------------------------------------

