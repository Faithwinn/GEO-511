#Add data from R-studio
data("iris")

#Install the packages for ggplot2 
install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)

#Write the code for the histogram beginning with ggplot
ggplot(data = iris, mapping = aes (Petal.Length)) + geom_histogram(color = "white", fill = "blue") + geom_vline(aes(xintercept = mean_petal), data = iris, color = "red", linewidth = 2)

#Calculate mean of petal in order to add the line showing the 'mean' 
mean_petal <- mean(iris$Petal.Length)
mean_petal

#Attempt 2: Using the basic r. The histogram function here plots the petal.length column in the iris data. 
hist(iris$Petal.Length, col = 'blue', border = 'white')
#this line of code adds the v line for mean petal length 
abline(v = mean_petal, col='red', lwd = 3)

#This line of code summarizes the columns 
summary(iris)

