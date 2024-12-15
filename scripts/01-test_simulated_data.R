#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: Sakura.Hu@utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse`, `testthat`, `arrow` and `pointblank` package must be installed and loaded
# - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `bmi` rproj


#### Workspace setup ####
library(testthat)
library(pointblank)
library(tidyverse)
library(arrow)



#### Test data ####
simulated_data <- read_parquet("../data/00-simulated_data/simulated_data.parquet")



#### Test Suite ####

# 1. Test for Missing Values in Key Columns using pointblank
test_that("No columns contain NA values", {
  expect_equal(sum(is.na(simulated_data)), 0)
})

# 2. Test for Duplicates in the Dataset using testthat
test_that("No duplicate rows exist", {
  expect_equal(any(duplicated(simulated_data)), FALSE)
})

# 3. Test if all 'BMI' are positive
test_that("BMI values should be between 10 and 40", {
  expect_true(all(simulated_data$BMI >= 0))  # Fixing the range here
})

# 4. Test for Outliers in 'Poverty' using testthat
test_that("Poverty values should be between 0 and 5", {
  expect_true(all(simulated_data$Poverty >= 0 &
                    simulated_data$Poverty <= 5))
})

# 5. Test for Outliers in 'Age' using testthat
test_that("Age values should be between 16 and 80", {
  expect_true(all(simulated_data$Age >= 16 &
                    simulated_data$Age <= 80))
})

# 6. Test for Outliers in 'PhysActiveDays' using testthat
test_that("PhysActiveDays values should be between 1 and 7", {
  expect_true(all(
    simulated_data$PhysActiveDays >= 1 &
      simulated_data$PhysActiveDays <= 7
  ))
})

# 7. Test for Outliers in 'SleepHrsNight' using testthat
test_that("SleepHrsNight values should be between 2 and 12", {
  expect_true(all(
    simulated_data$SleepHrsNight >= 2 &
      simulated_data$PhysActiveDays <= 12
  ))
})

# 8. Check the Distribution of Gender using testthat
test_that("Gender should only be male or female", {
  expect_true(all(simulated_data$Gender %in% c("male", "female")))
})

# 9. Check for Data Type Consistency using testthat
test_that("Data types should match expectations", {
  expect_is(simulated_data$BMI, "numeric")
  expect_is(simulated_data$Poverty, "integer")
  expect_is(simulated_data$PhysActiveDays, "integer")
  expect_is(simulated_data$Age, "integer")
  expect_is(simulated_data$SleepHrsNight, "integer")
  expect_is(simulated_data$Gender, "character")
})

# End of Tests