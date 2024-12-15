#### Preamble ####
# Purpose: Cleans the raw marriage data recorded by IPUMS USA
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The raw marriage data must be downloaded and saved as a parquet to data/raw_data.
# - The `tidyverse` packages must be installed and loaded.
# - 02-download_data.R must have been run.
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(arrow)

# Load raw data
raw_data <- read_parquet("data/01-raw_data/raw_data.parquet")

# Select only the columns of the predictor variables and filter out rows with missing values
clean_data <- raw_data %>%
  select(BMI, Poverty, PhysActiveDays, Age, SleepHrsNight, Gender) %>%
  filter(
    !is.na(BMI),!is.na(Poverty),!is.na(PhysActiveDays),!is.na(Age),!is.na(SleepHrsNight),!is.na(Gender)
  ) %>%
  distinct()  # Remove duplicate rows


#### Save data ####
write_parquet(clean_data, "data/02-analysis_data/clean_data.parquet")
