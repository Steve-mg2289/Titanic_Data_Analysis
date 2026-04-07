#loading dataset
data <- read.csv("titanic.csv.txt")

#understanding data
View(data)
head(data)
str(data)
summary(data)
tail(data)

#checking dimesions
dim(data)
ncol(data)
nrow(data)

#check missing values
is.na(data)
colSums(is.na(data))

#clean missing values
data$Age[is.na(data$Age)] <- median(data$Age, na.rn = TRUE)
data$Cabin <- NULL

#install dplyr
library(dplyr)
data <- data %>%
  group_by(Pclass) %>%
  mutate(Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age)) %>%
  ungroup()

#check for duplicates
sum(duplicated(data))
data <- data[!duplicated(data),]

#fix datatypes and convert important variables
str(data)
data$Sex <- as.factor(data$Sex)
data$Survived <- as.factor(data$Survived)

#check for outliers
boxplot(data$Age)
boxplot(data$Fare)

#validate clean data
colSums(is.na(data))
str(data)
summary(data)

#clean data 
write.csv(data, "titanic.csv.txt",row.names = FALSE)

