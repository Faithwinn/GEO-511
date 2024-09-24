install.packages("tidyverse")
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)
library(dplyr)


#View the different datasets
View(flights)
View(airports)

# Join flights data with airports data to get full airport names
flights_airports <- flights %>%
  left_join(airports, by = c("dest" = "faa")) #keeps the rows left of the airports column...like adding the full name and airports dest 

# Find the farthest destination and get the full airport name
farthest_airport <- flights_airports %>%
  filter(!is.na(distance)) %>% #to ignore the distance that are invalid
  arrange(desc(distance)) %>% #arrange in distance descending order to find highest easily
  slice(1) %>% #take only the top result
  pull(name) #extract airport name

# Print the result
farthest_airport




#SECOND TRY 

farthest_airport <- flights %>%
  group_by(dest) %>%
  summarize(max_distance = max(distance, na.rm = TRUE)) %>% #calculate maximum distance and ignore na values
  ungroup() %>% #removes grouping to work with whole dataset
  slice_max(max_distance, n = 1) %>% #selects the maximum distance and only keeping one row
  left_join(airports, by = c("dest" = "faa")) %>%
  pull(name)

print(farthest_airport)


#Extra time 
install.packages("ggplot2")
install.packages("maps")
library(ggplot2)
library(maps)

airports %>%
  distinct(lon,lat) %>%
  1
