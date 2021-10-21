library(leaflet)
library(htmltools)

# The following creates a simple leaflet map for displaying the location 
# of quoted periodicals. 

locations$lon <- jitter(locations$lon, factor = 0.3) 
locations$lat <- jitter(locations$lat, factor = 0.3) 
  
map <- locations %>% leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(
    lat=locations$lat, 
    lng=locations$lon,
    radius = 5,
    stroke = FALSE,
    fillOpacity = 0.5,
    label = ~htmlEscape(periodical),
    options = popupOptions(closeButton = TRUE)
  ) 

map
