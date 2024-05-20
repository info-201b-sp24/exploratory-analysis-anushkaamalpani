library(dplyr)
library(knitr)
library(kableExtra)

global_unemployment_data <- read.csv("/Users/anushkamalpani/Downloads/data.csv")

table <- global_unemployment_data %>%
  group_by(country_name) %>%
  summarise(avg_unemployment_rate_2014 = mean(X2014, na.rm = TRUE))

aggregate_table <- table %>%
  mutate_if(is.numeric, round, digits = 2)

# View(aggregate_table)