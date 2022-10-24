# Importing Dataset
library(datasets)
data("housing")
head(housing)
summary(housing)
str(housing)

sum(is.na(housing))
colSums(is.na(housing))

clean_missing_data <- na.omit(housing)
attach(clean_missing_data)
colSums(is.na(clean_missing_data))

#analize the ocean_proximity column
p <- table(housing$ocean_proximity)
p

#Encording categorical label
clean_missing_data$ocean_proximity <- factor(clean_missing_data$ocean_proximity, level = c("<1H OCEAN", "INLAND", "ISLAND ", "NEAR BAY", "NEAR OCEAN"),
                                             labels = c(1, 2, 3, 4, 5))

str(clean_missing_data)
boxplot(clean_missing_data)


# Creating a data frame
df <- data.frame(clean_missing_data)
df


#identify the each variables boarderline
summary(df$total_rooms)
IQR_total_room <- 3143 - 1450
up_total_room <- 3143 + 1.5 * IQR_total_room
up_total_room

summary(df$total_bedrooms)
IQR_total_bedrooms <- 647 - 296
up_total_bedroom <- 647 + 1.5 * IQR_total_room
up_total_bedroom

summary(df$population)
IQR_population <- 1722 - 787
up_population <- 1722 + 1.5 * IQR_total_room
up_population

summary(df$households)
IQR_households <- 604 - 280
up_households <- 604 + 1.5 * IQR_total_room
up_households

summary(median_house_value)
IQR_median_house_value <- 264700 - 119500
up_median_house_value <- 264700 + 1.5 * IQR_total_room
up_median_house_value

summary(df$median_income)
IQR_median_income <- 4.744 - 2.5365
up_median_income <- 4.744 + 1.5 * IQR_total_room
up_median_income

summary(total_rooms)

summary(clean_missing_data)

clean_outliers <- subset(clean_missing_data, longitude <= -114 &
  latitude <= 41.95 &
  housing_median_age <= 52 &
  total_rooms <= 5682.5 &
  total_bedrooms <= 3186.5 &
  population <= 4261.5 &
  households <= 3143.5 &
  median_income <= 2544.244 &
  median_house_value <= 267239.5)


# Cleaning missing values and outliers encorded at last column
boxplot(clean_outliers)

install.packages("caret")
library(caret)
set.seed(123)

# Split the dataset into training set(80%) and test set(20%)

house_sampling_vector <- createDataPartition(clean_outliers$median_house_value, p = 0.80, list = FALSE)
house_sampling_vector
house_train <- clean_outliers[house_sampling_vector,]
house_train
house_train_features <- clean_outliers[, c(1:8, 10)] # removing the median house value column
house_train_features
house_train_labels <- clean_outliers$median_house_value[house_sampling_vector]
house_train_labels
house_test <- clean_outliers[-house_sampling_vector,] # creating the test set
house_test
house_test_labels <- clean_outliers$median_house_value[-house_sampling_vector]
house_test_labels

# Apply lm() function
house_model1 <- lm(median_house_value ~ ., data = house_train)
summary(house_model1)

# Residual analysis
house_residuals <- house_model1$residuals
qqnorm(house_residuals, main = "Normal Q-Q Plot ") #Q-q plot
qqline(house_residuals)

plot(house_model1, pch = 16, which = 1) # residual plot

# Predictions
house_model1_predictions <- predict(house_model1, house_test)
house_model1_predictions

# Testing set performance
compute_mse <- function(predictions, actual) { #defining our own function to calculate MSE
  mean((predictions - actual)^2)
}

compute_mse(house_model1$fitted.values, house_train$median_house_value) #compute MSE for training data
compute_mse(house_model1_predictions, house_test$median_house_value) # compute MSE for test data






