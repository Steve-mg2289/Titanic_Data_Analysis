#loading dataset
data <- read.csv("titanic.csv.txt")

#install ggplot2 and dplyr
library(dplyr)
library(ggplot2)

#overview of data
str(data)
summary(data
      )
#common visualization for titanic data
# 1. Survival Count
p1 <- ggplot(data, aes(x = Survived)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Survival Count") +
  theme_minimal()
ggsave("plot_survival_count.png", plot = p1, width = 6, height = 4)

# 2. Survival by Sex
p2 <- ggplot(data, aes(x = Sex, fill = Survived)) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Sex") +
  theme_minimal()
ggsave("plot_survival_by_sex.png", plot = p2, width = 6, height = 4)

# 3. Age Distribution
p3 <- ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Age Distribution") +
  theme_minimal()
ggsave("plot_age_distribution.png", plot = p3, width = 6, height = 4)

# 4. Survival by Age and Sex
p4 <- ggplot(data, aes(x = Survived, y = Age, fill = Sex)) +
  geom_boxplot() +
  labs(title = "Age by Survival and Sex") +
  theme_minimal()
ggsave("plot_age_by_survival.png", plot = p4, width = 6, height = 4)

# 5. Survival by Passenger Class
p5 <- ggplot(data, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "fill") +
  labs(title = "Survival Proportion by Passenger Class",
       y = "Proportion") +
  theme_minimal()
ggsave("plot_survival_by_class.png", plot = p5, width = 6, height = 4)

# Save the plot
ggsave("plot_survival_by_sex.png", plot = p1, width = 6, height = 4, dpi = 300)

#saving the plots
ggsave("survival_by_sex.png", width = 6, height = 4)
pdf("all_titanic_plots.pdf", width = 7, height = 5)
print(p1)
print(p2)
print(p3)
print(p4)
print(p5)
dev.off()

