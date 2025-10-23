######################################################

# HOMEWORK 8 
# Jillian Neece and Elizabeth Braatz! 

######################################################

#Loading libraries 
#------------------------------------
library(rinat) #install a package meant for extracting iNat data 
library(tidyverse) #adding ggplot2 via tidyverse 

#Pulling data from iNat 
#-------------------------------------


#We thought about getting data from a project but it had too many things 
# about_d = get_inat_obs_project("city-nature-challenge-2025-northeast-wisconsin", type = "info", raw = FALSE) #this gets data from iNat project city Nature 2025 NE WI info about the project 

# d = get_inat_obs_project("city-nature-challenge-2025-northeast-wisconsin", type = "observations", raw = FALSE) #This gets the actual data but you can't tell it to not take everything 

#Let's just get bumble bees from WI in 2025, month 5, max 1000 bees 
bees = get_inat_obs(
  query = "Bombus", 
  quality = "research",
  place_id = "wisconsin", 
  year = 2025, 
  month = 5, 
  maxresults = 500 
)

# Conducting Exploratory Data Analysis 
#----------------------------------------------

#First let's see if this is normally distributed 

hist = ggplot(data = bees) + 
  geom_bar(aes(x = scientific_name)) + 
  labs(x = "Scientific Name", y = "Count of observations", title = "Histogram of Bees by Species")
hist

# I guess normal distribution doesn't make sense for species name 







# Code Graveyard 

# hist(bees$scientific_name) #base R is mad

