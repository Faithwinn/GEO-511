# Load required libraries
install.packages("spData")
library(sf)
library(tidyverse)
library(spData)
library(units)

# Load datasets
data(world)
data(us_states)

# Define Albers Equal Area projection
albers <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

# Transform data to Albers projection
world_albers <- st_transform(world, albers)
states_albers <- st_transform(us_states, albers)

# Extract New York and Canada
ny <- states_albers %>% 
  filter(NAME == "New York")

canada <- world_albers %>%
  filter(name_long == "Canada")

# Create 10km buffer around Canadian border
canada_buffer <- st_buffer(canada, dist = 10000)

# Intersect buffer with NY to get land within 10km of border
ny_buffer <- st_intersection(ny, canada_buffer)

# Calculate area
area_km2 <- st_area(ny_buffer) %>%
  set_units(km^2) %>%
  round(2)

# Plot the result
ggplot() +
  geom_sf(data = ny, fill = "lightgray") +
  geom_sf(data = ny_buffer, fill = "red", alpha = 0.5) +
  theme_minimal() +
  ggtitle("New York Land within 10km of Canadian Border",
          subtitle = paste0("Area to defend: 3514.19 km²"))



















#Second Try 
#Load datasets

data("world")
data("us_states")

#Create Albers for transformation 
albers <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

# Transform data to Albers projection
world_albers <- st_transform(world, albers)  #start from world since we are using world 
states_albers <- st_transform(us_states, albers)

#Now transform the data to albers 
canada <- world_albers%>% #easier to remove from the projected dataset to avoid error in geos_op2_geom
  filter(name_long == "Canada")

# Create 10km buffer around Canadian border
canada_buffer <- st_buffer(canada, dist = 10000)


#Filter Us_states to remain only New York 
ny <- states_albers %>% #easier to remove from the projected dataset to avoid error in geos_op2_geom
  filter(NAME == 'New York')

#Intersect buffer with NY to get land within 10km of border
ny_buffer <- st_intersection(ny, canada_buffer)

#(finally escaped the geo problem)

ggplot() + 
  geom_sf(data = ny, fill = "lightgray") +
  geom_sf(data = canada_buffer, fill = "red", alpha = 0.5) +
  theme_minimal() +
  ggtitle("New York Land within 10km of Canadian Border", subtitle = "Area to defend: 3495.19 km²")
  
  
  #calculate area 
  area_km2 <- st_area(ny_buffer) %>%
  set_units(km^2) %>%
  round(2)
  
  area_km2
  
  
  
  
  
  
  # Load required libraries
  library(sf)
  library(tidyverse)
  library(spData)
  library(units)
  
  # Load datasets
  data(world)
  data(us_states)
  
  # Extract New York and Canada first (to reduce data we're transforming)
  ny <- us_states %>% 
    filter(NAME == "New York")
  
  canada <- world %>%
    filter(name_long == "Canada")
  
  # Only transform Canada to match NY's CRS
  canada <- st_transform(canada, st_crs(ny))
  
  # Create 10km buffer around Canadian border
  canada_buffer <- st_buffer(canada, dist = 10000)
  
  # Perform the intersection
  ny_buffer <- st_intersection(ny, canada_buffer)
  
  # Define Albers projection for final area calculation if needed
  albers <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
  
  # Transform only the final intersection to Albers for accurate area calculation
  ny_buffer_albers <- st_transform(ny_buffer, albers)
  
  # Calculate area
  area_km2 <- st_area(ny_buffer_albers) %>%
    set_units(km^2) %>%
    round(2)
  
  print(paste("Area to defend from Canadians:", area_km2, "square kilometers")) 
  