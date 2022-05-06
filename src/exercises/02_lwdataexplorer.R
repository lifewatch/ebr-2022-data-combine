## Suggested libraries
library(lwdataexplorer)
library(dplyr)
library(mapview)
library(sf)
library(readr)

## Install lwdataexplorer with: 
# devtools::install_github("lifewatch/lwdataexplorer", build_vignettes = TRUE)

## Exercise 2.1.: Get fish data from the European Tracking Network of the year 2021
## Hint: use `?getEtnData()` to find more information
lw_data_etn <-


## Exercise 2.2.: Turn data frame into sf spatial object. Explore and visualize the data
## Hint: use `st_as_sf()` with the coords and crs arguments.
## Hint: the coordinate reference system is assumed to be WGS48 (EPGS code 4326)


## Exercise 2.3.: Use the sf package to intersect or filter the results with the 
## polygon of the Belgian Part of the North Sea obtained in the previous exercise
lw_data_etn_bpns <- 


## Bonus exercise 2.4.: Get Zooplankton data using lwdataexplorer
## Hint: you can find more information with vignette(package = "lwdataexplorer")


## Bonus exercise 2.5.: Get the same data from the web.
## Hint: https://lifewatch.be/en/lifewatch-data-explorer
## Hint: the best practice is to not rename files


