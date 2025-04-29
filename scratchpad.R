needs(tidyverse,sf,leaflet,mapview)
options(scipen=999)

uk_wards<-read_sf("/Users/robert/Downloads/uk_wards.geojson")

london_wards<-read_sf("https://bit.ly/Wards_London")
mapview(london_wards)

london_wards2<-read_sf("https://raw.githubusercontent.com/CablesCodeTfL/LondonWards/refs/heads/main/london_wards_geo.json")


nycounties <- sf::read_sf("https://maps.london.ca/arcgisa/rest/services/OpenData/OpenData_Elections/MapServer/8/query?outFields=*&where=1%3D1&f=geojson") 

mapview(london_wards2)

# Download the zip file (replace with the actual URL)
library(sf)


leaflet(london_wards)%>%
  addTiles()%>%
  addPolygons(stroke = F, smoothFactor = 0.3, fillOpacity = 1,
              fillColor = "red",
              label = london_wards$DISTRICT)

ward_data<-read_csv("~/Downloads/custom-filtered-2025-04-28T13_25_44Z.csv")%>%
  select(ward=`Electoral wards and divisions Code`,age=`Age (3 categories) Code`,Observation)%>%
  group_by(ward,age)%>%
  summarize(pop=sum(Observation))%>%
  ungroup()%>%
  spread(age,pop)

needs(readxl)
read_excel("https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/wardlevelmidyearpopulationestimatesexperimental", 
           sheet = "Mid 2022, Ward 2023")


data_source="https://www.ons.gov.uk/datasets/create/filter-outputs/3ffd76f1-cc47-416a-8e54-cfb36cd1a40e#get-data"
