install.packages("ggplot2")
install.packages("gapminder")
library(ggplot2)
library(gapminder)
library(dplyr)
library(scales)

#use filter to remove "kuwait" from the dataset
View(gapminder)

Gapminder_filtered <- gapminder %>%
  filter(country != "Kuwait")

#check result 
unique(Gapminder_filtered$country)

#Plot 1(the first row of plots)
ggplot(Gapminder_filtered, aes(x = lifeExp, y = gdpPercap, color = continent)) + 
  geom_point(aes(size=pop/100000)) + 
  theme_bw() + 
  scale_y_continuous(trans = "sqrt") + 
  facet_wrap(~year, nrow=1) + 
  labs(x = "Life Expectancy", y = "GDP Per Capital")

#prepare data for the second plot

gapminder_continet <- Gapminder_filtered %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop))
Gapminder_filtered$pop

#trying to get pop to show 
pop = sum(as.numeric(Gapminder_filtered$pop))

View(gapminder_continet)

#Plot 2

ggplot(Gapminder_filtered, aes(x = year, y = gdpPercap, color = continent)) + 
  geom_line(aes(group = country)) + 
  geom_point(aes(size=pop/100000)) +
  facet_wrap(~continent, nrow = 1) +
  geom_line(data=gapminder_continet, aes(x = year, y =  gdpPercapweighted), color = "black") + 
  geom_point(data=gapminder_continet, aes(x = year, y = gdpPercapweighted, size = pop/100000), color = "black", size = 2) +
  scale_size_area(name = "Population (100k)", breaks = c(1000, 2000, 3000)) +
  theme_bw() + 
  labs( x = "Year", y = "GDP Per Capita", title = "Life Expectancy Over Time by Continent")

View()

                                                                                                                                   