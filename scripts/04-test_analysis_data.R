#### Preamble ####
# Purpose: Tests the structure and validity of the analysis data
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: Sakura.Hu@utoronto.ca
# License: MIT
# Pre-requisites:
# - The `arrow`, `testthat`, and `pointblank` package must be installed and loaded
# - 03-clean_data.R must have been run
# Any other information needed? Make sure you are in the `bmi` rproj


#### Workspace setup ####
library(testthat)
library(pointblank)
library(arrow)



#### Test data ####
analysis_data <- read_parquet("/Users/hxw/marriage/data/02-analysis_data/clean_data.parquet")



#### Test Suite ####

# 1. Test for Missing Values in Key Columns using pointblank
test_that("No columns contain NA values", {
  expect_equal(sum(is.na(analysis_data)), 0)
})

# 2. Test for Duplicates in the Dataset using testthat
test_that("No duplicate rows exist", {
  expect_equal(any(duplicated(analysis_data)), FALSE)
})

# 3. Test if all 'BMI' are positive
test_that("BMI values should be between 10 and 40", {
  expect_true(all(analysis_data$BMI >= 0))  # Fixing the range here
})

# 4. Test for Outliers in 'Poverty' using testthat
test_that("Poverty values should be between 0 and 5", {
  expect_true(all(analysis_data$Poverty >= 0 &
                    analysis_data$Poverty <= 5))
})

# 5. Test for Outliers in 'Age' using testthat
test_that("Age values should be between 16 and 80", {
  expect_true(all(analysis_data$Age >= 16 &
                    analysis_data$Age <= 80))
})

# 6. Test for Outliers in 'PhysActiveDays' using testthat
test_that("PhysActiveDays values should be between 1 and 7", {
  expect_true(all(
    analysis_data$PhysActiveDays >= 1 &
      analysis_data$PhysActiveDays <= 7
  ))
})

# 8. Test for Outliers in 'SleepHrsNight' using testthat
test_that("SleepHrsNight values should be between 2 and 12", {
  expect_true(all(
    analysis_data$SleepHrsNight >= 2 &
      analysis_data$PhysActiveDays <= 12
  ))
})

# 9. Check the Distribution of Gender using testthat
test_that("Gender should only be male or female", {
  expect_true(all(analysis_data$Gender %in% c("male", "female")))
})

# 10. Check for Data Type Consistency using testthat
test_that("Data types should match expectations", {
  expect_is(analysis_data$BMI, "numeric")
  expect_is(analysis_data$Poverty, "numeric")
  expect_is(analysis_data$PhysActiveDays, "integer")
  expect_is(analysis_data$Age, "integer")
  expect_is(analysis_data$SleepHrsNight, "integer")
  expect_is(analysis_data$Gender, "factor")
})

# End of Tests
