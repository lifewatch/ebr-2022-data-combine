## Suggested libraries
library(worrms)
library(dplyr)
library(sf)

## Exercise 3.1.: Extract the list of species of lw_data_etn
## Hint: use `st_drop_geometry()` to turn an spatial object into a data frame
## Hint: use `distinct()` to get unique values


## Exercise 3.2.: Use the WoRMS Taxon Match using the worrms R package and  
## transform into a data frame
## Hint: worrms functions start all with `wm_`
## Hint: use `do.call(rbind, my_data_frame)` to turn a list into a data frame


## Bonus exercise 3.3: Get the AphiaID (unique vernacular name WoRMS identifier) of some taxa 
## you like using worrms
## Hint: an example could be the loggerhead sea turtle Caretta caretta
## Hint: you may need to use plus symbols "+" instead of white spaces " "


## Bonus exercise 3.4.: Get attribute data for one taxa you like via WoRMS AphiaID
## Hint: more info with `vignette("worrms")``

