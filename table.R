library(dplyr)

global_unemployment_data <- read_csv("Desktop/global_unemployment_data.csv")

table <- global_unemployment_data %>%
  group_by(country_name) %>%
  summarise(avg_unemployment_rate_2014 = mean(`2014`, na.rm = TRUE))

aggregate_table <- table %>%
  mutate_if(is.numeric, round, digits = 2)

# View(aggregate_table)