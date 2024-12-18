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















