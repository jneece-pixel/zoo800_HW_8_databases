######################################################

# HOMEWORK 8 
# Jillian Neece and Elizabeth Braatz! 

######################################################

#Loading libraries 
#------------------------------------
library(rinat) #install a package meant for extracting iNat data 
library(tidyverse) #adding ggplot2 via tidyverse 
library(dplyr) #dplyr package for rearranging the dataframe for the pie chart 

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

#######################
# GRAPH 1: HISTOGRAM 
# #####################

hist = ggplot(data = bees) + 
  geom_bar(aes(x = scientific_name)) + 
  labs(x = "Scientific Name", y = "Count of observations", title = "Histogram of Bees by Species")+ 
  theme(axis.text.x = 
          element_text(angle = 90, vjust = 0.5, hjust = 1)) #rotate the labels 
hist

# I guess normal distribution doesn't make sense for species name 

#######################
# GRAPH 2: PIECHART  
# #####################

bees$scientific_name

species_counts = bees %>% 
  count(scientific_name)
species_counts

## pie chart of species proportions
pie = ggplot(data = species_counts, aes(x = "", 
                             y = n, 
                             fill = scientific_name)) +
  geom_col()+ #creating a barchart with the n column 
  coord_polar(theta = "y")+ #make it round 
  labs(title = "piechart of beeeeeees") + #add a title 
  theme_void() #remove the ugly background 


#######################
# GRAPH 3: MAP   
# #####################

# Loading additional libraries 
library(ggmap)
library(maps)
library(mapdata)
library(grid)
library(ggspatial)
library(viridis) #lets you create color blind friendly maps


#load the state data 
states <- map_data("state") #load data for each state
wi <- subset(states, region =="wisconsin") #create object with wi data

#also make df objects with your county lines
counties <- map_data("county")
wi_county <- subset(counties, region == "wisconsin")

#Make a blank WI  map 

wi_b <- ggplot(data = wi, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "#f0f0f0") #can change background color of map

wi_b #view map

## map of observations
library(maps)
WI <- map_data("state", region = "wisconsin")

ggplot() +
  geom_polygon(data = WI, aes(x = long, y = lat, group = group),
               fill = "gray95", color = "gray70")+
  geom_point(data= bees, aes(x = longitude, 
                                  y = latitude, 
                                  color = scientific_name)) +
  labs(title = "May 2025 Bombus observations", 
       caption = "Data from iNaturalist.org")
## The observations tend to be clustered around Wisconsin cities, particularly 
## cities with universities (Madison, Milwaukee, Stevens Point), suggesting that
## there may be some observer bias in the data. 



##########################################################################33

# Code Graveyard 

# hist(bees$scientific_name) #base R is mad
# geom_text(aes(label = n), 
        #  position = position_stack(vjust = 0.5))  # I tried adding labels but hte  names were too long 
