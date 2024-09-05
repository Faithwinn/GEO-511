#This line of code adds our example dataset from R. 
data("iris")

#To use ggplot, first install the packages and library for ggplot2. The install.packages() is used to download and install named packages. The library() function is used to load the packages into the current r session. 
# ggplot2 = data visualization, readr is for reading the data, dplyr is for data manipulation
install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)

#Write the code to create the histogram beginning with ggplot.Ensure to add a '+' sign and the geom_histogram(). 
# The aes() function is used to specify the aesthetic mappings for the plot.
#In this case, the x aesthetic is set to Petal.length, which means that the xaxis of the plot will represent the Petal.length column from our data frame.
#The geom_vline() function is used to add a vertical line to the plot at the mean value of price, which is specified using the xintercept argument.

ggplot(data = iris, mapping = aes (Petal.Length)) + geom_histogram(color = "white", fill = "blue") + geom_vline(aes(xintercept = mean_petal), data = iris, color = "red", linewidth = 2) + labs(x ='Petal Length', y='Frequency', title = 'Distribution of Petal Length')

#Calculate the petal.length mean in order to add the vline which shows the 'mean' 
mean_petal <- mean(iris$Petal.Length)
mean_petal

#Congratulations on creating a beautiful histogram using ggplot. 

#Attempt 2: Using the basic r. The histogram function here plots the petal.length column in the iris data.
#The code also includes labeling the histogram using xlab, ylab
hist(iris$Petal.Length, col = 'blue', border = 'white', xlab = 'Petal Length', ylab = 'Frequency', main = 'Distribution of Petal Length')

#this line of code adds the v line for mean petal length. The abline() function is then used to add a vertical line at the mean value of the price variable.
#The v argument specifies that the line should be vertical, and the col argument sets the color of the line to red.
abline(v = mean_petal, col='red', lwd = 3)

#This line of code summarizes the columns 
summary(iris)

