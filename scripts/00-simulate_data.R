#### Preamble ####
# Purpose: Simulates the cleaned NHANES dataset
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: Sakura.Hu@utoronto.ca
# License: MIT
# Pre-requisites: The `dplyr` and `arrow` package must be installed
# Any other information needed? Make sure you are in the `bmi` rproj



#### Workspace setup ####
# Load necessary libraries
library(dplyr)  # for data manipulation
library(arrow)  # for reading and writing Parquet files
set.seed(1009201917)  # Set the random seed for reproducibility of results

#### Simulate data ####
# Simulating data for the predictors
n <- 100  # Define the number of observations (100 rows of data)

# Simulating values for different predictors based on the specified parameters
simulated_data <- data.frame(
  BMI = rnorm(n, mean = 15, sd = 6),  # Simulating BMI values with a normal distribution (mean = 15, sd = 6)
  Poverty = sample(0:5, n, replace = TRUE),  # Simulating Poverty level as integer values between 0 and 5
  PhysActiveDays = sample(1:7, n, replace = TRUE),  # Simulating physical activity days (1 to 7 days a week)
  Age = sample(16:80, n, replace = TRUE),  # Simulating Age as integer values between 16 and 80
  SleepHrsNight = sample(2:12, n, replace = TRUE),  # Simulating hours of sleep (between 2 to 12 hours)
  Gender = sample(c("male", "female"), n, replace = TRUE)  # Simulating gender with equal probability of male or female
)

#### Save data ####
# Save the simulated data to a Parquet file for efficient storage
write_parquet(simulated_data, "data/00-simulated_data/simulated_data.parquet")  # Write the dataframe to a Parquet file