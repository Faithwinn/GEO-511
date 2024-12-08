# Load required libraries
library(terra)
library(spData)
library(tidyverse)
library(sf)
install.packages("ncdf4")
library(ncdf4)

# Download temperature data
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc",
              "crudata.nc", 
              method="curl") #curl method ensures compatibility across different system.

# Read the temperature data
tmean <- rast("crudata.nc")

# Inspect the data
print(tmean)
plot(tmean[[1]], main="Temperature - First Layer") #plot first layer of the data

# Calculate annual mean temperatures
max_temp <- max(tmean, na.rm=TRUE)
plot(max_temp, main="Maximum Temperature")

# Prepare world data
# Remove Antarctica and convert to sf object for compatibility
world_sf <- world %>%
  filter(continent != "Antarctica") %>% 
  st_as_sf() # ensure the world data is in the correct format for analysis

# Extract maximum temperatures for each country
country_temps <- terra::extract(max_temp, vect(world_sf), fun=max, na.rm=TRUE, small=TRUE)

# Combine world data with temperature data
# Modified this part to ensure proper joining
world_clim <- world_sf %>%
  mutate(max_temp = country_temps[,2])  # Use column 2 which contains the actual values

# Verify the data
print(head(world_clim))
print(summary(world_clim$max_temp))

# Create visualization
temp_map <- ggplot(world_clim) +
  geom_sf(aes(fill = max_temp)) +
  scale_fill_viridis_c(name="Maximum\nTemperature (C)") +
  theme_minimal() +
  theme(legend.position = 'bottom')

print(temp_map)

# Find hottest country in each continent
hottest_continents <- world_clim %>%
  group_by(continent) %>%
  top_n(1, max_temp) %>%
  select(continent, name_long, max_temp) %>%
  st_set_geometry(NULL) %>%
  arrange(desc(max_temp))

# Display results
print(hottest_continents)

