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






