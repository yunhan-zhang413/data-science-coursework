# **************************************************************#
# R/Rstudio Practical Part 3
# **************************************************************#

# **************************************************************#
# Basic plotting
# **************************************************************#

t <- seq(from=0, to=10, by=0.1) 
y <- sin(t)
plot(y) #this might take a few seconds to run

plot(x=t, y=y, type="l")

plot(x=t, y=y, type="l", xlab="Angle", ylab="Sine", main="Sine function")

plot(x=t, y=y, type="l", lty="dashed", xlab="Angle", ylab="Sine", col="blue", main="Sine function")

plot(x=t, y=y, pch=2, xlab="Angle", ylab="Sine", col="red", main="Sine function")

plot(x=t, y=y, type="l", lty="dashed", lwd = 3, xlab="Angle", ylab="Sine", col="blue", main="Sine function")

points(x=t, y=y, pch=2, xlab="Angle", ylab="Sine", col="red", main="Sine function")


# **************************************************************#
# Packages
# **************************************************************#

install.packages("WDI")
library(WDI)
new_wdi_cache <- WDIcache()

WDIsearch("GDP per capita", cache = new_wdi_cache)

gdp_capita <- WDI(country="all",
                  indicator = "NY.GDP.PCAP.KD", 
                  start = 2012, end = 2022, 
                  cache = new_wdi_cache)

View(gdp_capita)

#Recap: data frame
gdp_capita$year

gdp_capita[1,1]

#Try to access the data yourself!

#Exercise: plot GDP per capita of United Kingdom (y-axis) vs year (x-axis)

#Exercise: add labels and title to the plot

#Exercise: plot UK in blue and United Arab Emirates in red



#Exercise: create a plot comparing the two measures of GDP: constant 2015 US$ and current US$

#Exercise: create another plot showing both measures as line (y-axis) vs year (x-axis)


# **************************************************************#
# Write/Read data
# **************************************************************#

uk<-gdp_capita[gdp_capita$country=="United Kingdom",]

#write data in uk into a csv file
write.table(uk, "UK GDP per capita 2012 2022.csv", sep=",", row.names=FALSE)

#read the data from the saved csv file
uk_copy<-read.csv("UK GDP per capita 2012 2022.csv", header=TRUE)	

View(uk_copy)
