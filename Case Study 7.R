library(tidyverse)
library(reprex)
library(sf)

library(spData)
data(world)

#The plot 
ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F) #run and copy to clipboard 

reprex(venue = "gh") 

#Fix the code 
library(dplyr)

ggplot(world, aes(x = gdpPercap, fill = continent)) + #'y=continent' not necessary since we are working with geom_density, use fill instead of color  
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(x = "GDP Per Capita", y = "Density") + 
  theme(legend.position = "bottom")
