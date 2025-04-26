needs(tidyverse,sf,leaflet,mapview)
options(scipen=999)


london_wards<-read_sf("https://maps.london.ca/arcgisa/rest/services/OpenData/OpenData_Elections/MapServer/8/query?outFields=*&where=1%3D1&f=geojson")

mapview(london_wards)
