
library(dplyr)
library(ggplot2)

# Load the dataframe
data <- read.csv("/Users/anushkamalpani/Downloads/data.csv")

# Step 1: Filter for the United States
us_data <- filter(data, country_name == "United States")

# Step 2: Select only the columns for age categories and the year 2024
us_2024 <- us_data %>%
  select(age_categories, X2024)

# Step 3: Calculate the average unemployment rate for each age category for 2024
us_avg_2024 <- us_2024 %>%
  group_by(age_categories) %>%
  summarise(avg_unemployment_rate = mean(X2024, na.rm = TRUE))

# Step 4: Reorder the levels of age_categories variable
us_avg_2024$age_categories <- factor(us_avg_2024$age_categories, levels = c("Children", "Youth", "Adults"))

# Step 5: Create the barplot
us_avg_24_graph <- ggplot(us_avg_2024, aes(x = age_categories, y = avg_unemployment_rate, fill = age_categories)) +
  geom_bar(stat = "identity") +
  labs(title = "Age Categories vs Average Unemployment Rate in the US for 2024",
       x = "Age Category",
       y = "Average Unemployment Rate",
       fill = "Age Category") +
  theme_minimal() +
  theme(legend.position = "none")