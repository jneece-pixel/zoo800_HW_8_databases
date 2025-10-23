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
ggplot(data = inat.data, aes(x = "", 
                             y = scientific_name, 
                             fill = scientific_name))+
  geom_col()+
  coord_polar(theta = "y")+
  labs(ylab = NA)




