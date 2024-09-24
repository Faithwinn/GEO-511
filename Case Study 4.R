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
  pull(name) #you can also use select

farthest_airport


#Extra time 
install.packages("ggplot2")
install.packages("maps")
library(ggplot2)
library(maps)

airports %>%
  distinct(lon,lat) %>%
  1



#Try the mean delay 
airport_delays <- flights %>% #find delays first
  group_by(dest) %>%
  summarise(mean_delay = mean(arr_delay, na.rm = TRUE)) %>% #na.rm to ignore na values 
  inner_join(airports, by = c("dest" = "faa")) #inner join helps to add the lat and long. kinda need it for the map 
#print results
airport_delays

#Create the plot 
ggplot() +
  borders("state") +
  geom_point(data = airport_delays, 
             aes(x = lon, y = lat, size = mean_delay, color = mean_delay)) +
  scale_color_gradient(low = "green", high = "red") +
  scale_size_continuous(range = c(1, 10)) +
  coord_quickmap() +
  labs(title = "Mean Arrival Delays by Destination Airport",
       size = "Mean Delay (minutes)",
       color = "Mean Delay (minutes)") +
  theme_minimal() 














#Trying mean delay

ggplot(airport_delays) + 
  borders(database = "state") +
  geom_point(aes(x = lon, y = lat, color = mean_delay), size = 2) +
  scale_color_gradient(low = "red", high = "blue") + 
  scale_size_continuous(range = c(1, 20)) + 
  coord_quickmap() + 
  labs(title = "Mean Arrival Delays by Destination Airport",
       size = "Mean Delay (minutes)",
       color = "Mean Delay (minutes)" ) +
  theme_minimal()
  