library(leaflet)
library(htmltools)

# The following creates a simple leaflet map for displaying the location 
# of quoted periodicals. 

locations$lon <- jitter(locations$lon, factor = 0.3) 
locations$lat <- jitter(locations$lat, factor = 0.3) 

locations$label <- with(locations, paste(
  periodical, "(",location,")", " | ", "Mentions:", number_of_mentions))
  
map <- locations %>% leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  addCircleMarkers(
    lat=locations$lat, 
    lng=locations$lon,
    radius = 5,
    stroke = FALSE,
    fillOpacity = 0.5,
    label = ~label,
    options = popupOptions(closeButton = TRUE)
  ) 

map

htmlwidgets::saveWidget(as_widget(map), "html/map.html")
