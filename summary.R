library(dplyr)
library(stringr)
library(tidyverse)
library(kableExtra)
library(stringr)

global_unemployment_data <- read.csv("https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-anushkaamalpani/main/data.csv")

summary <- list(
  num_observations = nrow(global_unemployment_data),
  num_countries = nrow(unique(global_unemployment_data["country_name"])),
  max_rate = max(global_unemployment_data$X2014),
  min_rate = min(global_unemployment_data$X2014),
  num_columns = ncol(global_unemployment_data)
)

# View(summary)