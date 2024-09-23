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
  left_join(airports, by = c("dest" = "faa"))

# Find the farthest destination and get the full airport name
farthest_airport <- flights_airports %>%
  filter(!is.na(distance)) %>% #so no distance is invalid
  arrange(desc(distance)) %>% #arrange in distance descending order 
  slice(1) %>% #take the top result
  pull(name) #extract airport name

# Print the result
farthest_airport






farthest_airport <- flights %>%
  group_by(dest) %>%
  summarize(max_distance = max(distance, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(max_distance, n = 1) %>%
  left_join(airports, by = c("dest" = "faa")) %>%
  pull(name)

print(farthest_airport)


