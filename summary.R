library(dplyr)
library(stringr)
library(tidyverse)

global_unemployment_data <- read_csv("Desktop/global_unemployment_data.csv")

summary <- list(
  num_observations = nrow(global_unemployment_data),
  num_countries = length(unique(global_unemployment_data["country_name"])),
  max_rate = max(global_unemployment_data$`2014`),
  min_rate = min(global_unemployment_data$`2014`),
  num_columns = ncol(global_unemployment_data)
)

# View(summary)