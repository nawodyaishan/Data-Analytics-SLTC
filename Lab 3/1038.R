#1. use the the prediction data set
library(car)
str(Prestige)
summary(Prestige)

#2. explore and understand the data set
library(datasets)
data("prestige")
head(Prestige)
summary(Prestige)

df<- data.frame(Prestige)
df

#3.Create a subset from the data set to include the education and income column.

modi_df<-df[,c('education','income')]
modi_df

#4. Now use the lm(y~x) function to create the simple linear model.
my_model2 <- lm(income~education, data=modi_df)
my_model2

#5 .Plot the data set and the regression line.
plot(education~income,data= modi_df,
     xlab =	"education ",
     ylab = "income ",
     main =	"education vs income",
     pch	= 20,
     cex	= 2,
     col	= "red")


abline(reg = my_model2,col = "blue",lwd =2)

#More information about my_model class we created
names(my_model2)
summary(my_model2)

#Checking whether our models is fitting the assumptions of a linear model
my_model2$residuals

#6. Plot histogram and Q-Q plot to interpret the distribution of residuals.
hist(my_model2$residuals)

qqnorm(my_model2$residuals)

#7. Plot fitted.value vs residuals.

plot(my_model2$fitted.values,my_model2$residuals)


#8. A correlation coefficient for to compare the education and income

cor(modi_df$education , modi_df$income)
plot(Prestige$education , Prestige$income)

# Predictions

predict(my_model2)
predict(my_model2,newdata = data.frame(education=13))
predict(my_model2,newdata = data.frame(education=15))



