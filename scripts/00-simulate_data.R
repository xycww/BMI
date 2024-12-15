#### Preamble ####
# Purpose: Simulates the cleaned NHANES dataset
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: Sakura.Hu@utoronto.ca
# License: MIT
# Pre-requisites: The `dplyr` and `arrow` package must be installed
# Any other information needed? Make sure you are in the `bmi` rproj



#### Workspace setup ####
library(dplyr)
library(arrow)
set.seed(1009201917)


#### Simulate data ####
# Simulating data for the predictors
n <- 100  # Number of observations

# Simulating values based on the provided data
simulated_data <- data.frame(
  BMI = rnorm(n, mean = 15, sd = 6),
  Poverty = sample(0:5, n, replace = TRUE),
  # Simulating physical activity days (1-7 scale)
  PhysActiveDays = sample(1:7, n, replace = TRUE),
  # Simulating ages (16 to 80 years)
  Age = sample(16:80, n, replace = TRUE),
  # Simulating hours of sleep (4-12 hours)
  SleepHrsNight = sample(2:12, n, replace = TRUE),
  Gender = sample(c("male", "female"), n, replace = TRUE)  # Simulating gender
)


#### Save data ####
write_parquet(simulated_data, "data/00-simulated_data/simulated_data.parquet")
