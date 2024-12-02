#### Preamble ####
# Purpose: Models the marriage rate
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 01-download_data.R and 03-clean_data.R
# Any other information needed? None


#### Workspace setup ####
library(dplyr)
library(arrow)

#### Read data ####
model_data <- read_parquet("data/02-analysis_data/clean_data.parquet")

# Convert Gender to a factor
model_data$Gender <- as.factor(model_data$Gender)

# Fit a linear model
lm_model <- lm(log(BMI) ~ Poverty + PhysActiveDays + Age + SleepHrsNight + Gender,
               data = model_data)

# Summary of the model (optional to display)
summary(lm_model)

# Save the model as an RDS file
saveRDS(lm_model, "models/lm_model.rds")