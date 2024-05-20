# Libraries
library(tidyverse) 
library(readr)
library(sf)
library(maps)

# Import dataset
global_unemployment_data <- read.csv("/Users/anushkamalpani/Downloads/data.csv")
world_map <- map_data("world")

# Averaging unemployment rate for the year 2014
q2_2014 <- global_unemployment_data %>%
  group_by(country_name) %>%
  summarise(avg_unemployment_rate_2014 = mean(X2014, na.rm = TRUE))

# Making sure country names match up
q2_2014[140, 1] = "Russia"
q2_2014[180, 1] = "USA"
q2_2014[39, 1] = "Democratic Republic of the Congo"
q2_2014[38, 1] = "Republic of Congo"
q2_2014[167, 1] = "Tanzania"
q2_2014[185, 1] = "Venezuela"
q2_2014[78, 1] = "Iran"
q2_2014[89, 1] = "North Korea"
q2_2014[90, 1] = "South Korea"
q2_2014[93, 1] = "Laos"
q2_2014[165, 1] = "Taiwan"
q2_2014[186, 1] = "Vietnam"
q2_2014[23, 1] = "Brunei"
q2_2014[111, 1] = "Moldova"
q2_2014[129, 1] = "Palestine"
q2_2014[164, 1] = "Syria"
q2_2014[179, 1] = "UK"
q2_2014[44, 1] = "Czech Republic"

country_geometry_2014 <- inner_join(q2_2014, world_map, by = c("country_name" = "region"))
country_geometry_2014 <- country_geometry_2014 %>%
  select(-"group", -"order", -"subregion")

# Creating the plot
gg <- ggplot(country_geometry_2014) + 
  geom_map(dat=world_map, map=world_map, 
           aes(map_id=region), fill="yellowgreen", color="white") + 
  geom_map(map=world_map, 
           aes(map_id=country_name, fill=avg_unemployment_rate_2014)) + 
  expand_limits(x = world_map$long, y = world_map$lat) +
  scale_fill_continuous(name = "2014 Unemployment Rate") +
  theme(axis.title.x = element_blank(), axis.text.x = element_blank(),
        axis.ticks.x = element_blank(), axis.title.y = element_blank(),
        axis.text.y = element_blank(), axis.ticks.y = element_blank(),
        panel.background = element_rect(fill="white", color="darkgray"),
        aspect.ratio=3/4, legend.key.size = unit(4, "mm"),
        legend.text = element_text(size=6), legend.title=element_text(size=7)) +
  ggtitle("Unemployment rate by country, divided by tropic") +
  geom_hline(yintercept = 23.43612) + # Tropic of Cancer
  geom_hline(yintercept = -23.43612) # Tropic of Capricorn
