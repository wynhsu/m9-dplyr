# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
data('vehicles')

# Create a data.frame of vehicles from 1997
vehicles.1997 <- vehicles[vehicles$year==1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20.mph <- vehicles[vehicles$drive=='2-Wheel Drive' & vehicles$cty>20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy.mpg <- two.wheel.20.mph$id[two.wheel.20.mph$hwy==min(two.wheel.20.mph$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
most.hwy.miles.per.gallon <- function(year, make) {
  filter <- vehicles[vehicles$make==make & vehicles$year==year,]
  return(filter[filter$hwy==max(filter$hwy),])
}

# What was the most efficient honda model of 1995?
car <- most.hwy.miles.per.gallon(1995, 'Honda')

