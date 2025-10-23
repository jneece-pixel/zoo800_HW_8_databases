######################################################

# HOMEWORK 8 
# Jillian Neece and Elizabeth Braatz! 

######################################################

library(rinat)
library(tidyverse)

## Reading in iNaturalist data for bumblebee sightings in Wisconsin
## in May of 2025
inat.data <- get_inat_obs(
  query = "Bombus", ## the genus of interest
  quality = "research",  ## research-grade observations only
  place_id = "wisconsin", ## location of observations
  year = 2025, 
  month = 5, 
  maxresults = 1000 ## don't show me more than 1000 observations
)


## histogram of bombus species
ggplot(data = inat.data)+
  geom_bar(aes(x = scientific_name))+
  theme(axis.text.x = 
          element_text(angle = 90, vjust = 0.5, hjust = 1))+
  labs(title = "May 2025 Bumblebee observations in Wisconsin", 
       caption = "Data from iNaturalist.org")
  

## There are a few species that are documented in much higher 
## numbers than most species (i.e. B. bimaculatus, B. impatiens, and B. 
## griseocollis). These could be the most abundant species, or there could 
## be other factors that cause them to be more commonly observed (maybe they are 
## found closer to populated areas where people are more likely to see them, maybe
## they are larger and more easily recognized, maybe they move slower and are 
## easier to take photos of). 


## pie chart of species proportions
species_counts = bees %>% 
  count(scientific_name)
species_counts

ggplot(data = species_counts, aes(x = "", 
                                  y = n, 
                                  fill = scientific_name)) +
  geom_col()+ #creating a barchart with the n column 
  coord_polar(theta = "y")+ #make it round 
  labs(title = "piechart of beeeeeees") + #add a title 
  theme_void() #remove the ugly background 
## This essentially shows the same information as the histogram, but allows us to
## compare proportions. The same concerns from the histogram apply here about there
## being very unequal counts of the different species


## map of observations
library(maps)
WI <- map_data("state", region = "wisconsin")

ggplot() +
  geom_polygon(data = WI, aes(x = long, y = lat, group = group),
                 fill = "gray95", color = "gray70")+
  geom_point(data= inat.data, aes(x = longitude, 
                                  y = latitude, 
                                  color = scientific_name)) +
  labs(title = "May 2025 Bombus observations", 
       caption = "Data from iNaturalist.org")
## The observations tend to be clustered around Wisconsin cities, particularly 
## cities with universities (Madison, Milwaukee, Stevens Point), suggesting that
## there may be some observer bias in the data. 

