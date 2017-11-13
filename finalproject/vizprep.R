if (!require('leaflet')) install.packages('leaflet')
if (!require('htmlwidgets')) install.packages('htmlwidgets')

all <- readRDS("DATA/GunsGeo.rds")


m <- leaflet(all) %>%
    addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png', 
             attribution='Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>') %>%  # Add default OpenStreetMap map tiles
    addCircles(lng=~lon, lat=~lat, 
               weight=all$Killed,
               popup=all$Content,
               stroke = TRUE, 
               fillOpacity = 0.8) 
m

saveWidget(m, file="HW6_R.html")