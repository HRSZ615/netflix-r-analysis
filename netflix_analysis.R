#Netflix Content Analysis
#Dataset: Netflix Movies and TV Shows (Kaggle)
#Tool: R (tidyverse, ggplot2)

library (tidyverse)
df <- read_csv("netflix_titles.csv")
df <- df %>% mutate(date_added = mdy(date_added))


#How many Movies vs. TV Shows?
df %>%
  group_by(type) %>%
  summarise(count = n(), 
            percentage = round(n() / nrow(df) * 100,1))

df%>%
  filter(release_year >= 2010) %>%
  group_by(release_year, type) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = release_year, y = count, color = type)) +
  geom_line(size = 1) +
  geom_line(size = 2) +
  labs(title = "Netflix Content Growth by Year",
       x = "Release Year",
       y = "Number of Titles",
       color = "Type") +
  theme_minimal()


# Which countries produce the most Netflix content?
df %>%
  filter(!is.na(country)) %>%
  group_by(country) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  head(10) %>%
  ggplot(aes(x = reorder(country, count), y = count)) +
  geom_col(fill = "steelblue")+
  coord_flip() +
  labs(title = "Top 10 Countries by Netflix Content",
       x = "Country",
       y = "Number of Titles")+
  theme_minimal()



# What ratings dominate Netflix?
df %>%
  filter(!is.na(rating), !rating %in% c("66 min", "74 min", "84 min")) %>%
  group_by(rating) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  ggplot(aes(x = reorder(rating, -count), y = count)) +
  geom_col(fill = "steelblue") +
  labs(title = "Netflix Content by Rating",
       x = "Rating",
       y = "Count") +
  theme_minimal()



# Statistical summary of release years
summary(df$release_year)
sd(df$release_year, na.rm = TRUE)

# Content added by rating as proportions
prop.table(table(df$rating)) %>%
  round(3)



# Does release year predict content volume?
yearly <- df %>%
  group_by(release_year) %>%
  summarise(count = n())

model <- lm(count ~ release_year, data = yearly)
summary(model)

# Visualize
yearly %>%
  filter(release_year >= 2010) %>%
  ggplot(aes(x = release_year, y = count)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Netflix Content Growth — Regression",
       x = "Release Year",
       y = "Number of Titles") +
  theme_minimal()
