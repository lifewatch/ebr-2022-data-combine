library(httr2)
library(dplyr)
library(glue)
library(sf)
library(mapview)
library(stringr)

# Config
mrgid <- 3293
source <- 4

# Define service URL
url <- glue("https://marineregions.org/rest/getGazetteerGeometry.jsonld/{mrgid}/?source={source}&attributeValue={mrgid}")

# Create HTTP request, perform and fetch response info
resp <- request(url) %>%
  req_perform(verbosity = 1) %>%
  resp_body_json()

# Get polygon as WKT
names(resp)
names(resp$`mr:hasGeometry`)

geom_wkt <- resp$`mr:hasGeometry`$`gsp:asWKT` %>%
  str_replace("<http://www.opengis.net/def/crs/OGC/1.3/CRS84> ", "")

str_sub(geom_wkt, 1, 100)

# Visualize
geom_sfc <- geom_wkt %>%
  st_as_sfc(crs = 4326)

mapview(geom_sfc)