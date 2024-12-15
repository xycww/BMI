#### Preamble ####
# Purpose: Downloads and saves the data from IPUMS USA
# Author: Sakura Hu
# Date: 01 December 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download the data from IPUMS USA
# Any other information needed? Data was downloaded on November 20, 2024



#### Workspace setup ####
library(NHANES)
library(dplyr)
library(ggplot2)
library(arrow)

# Load the main NHANES dataset
data("NHANES")

#### Save data ####
write_parquet(NHANES, "data/01-raw_data/raw_data.parquet")

         

