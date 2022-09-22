# Simple arithmetic operations

variable_1 <- 10
variable_2 <- 20
sum(variable_1, variable_2)


# Functions

square <- function(number) {
  return (number * number)
}

product <- function(num1 , num2) {
  return (num1 * num2)
}

square(4)
product(23, 78)


# Creating vectors

marks <- c(75, 60, 53)
names(marks) <- c("Mathematics", "Science", "English")

A_vector <- c(1, 2, 4)
B_vector <- c(3, 5, 2)
total_vector <- A_vector + B_vector

total_vector

vehicle_vector <- c("car", "van", "bus", "jeep")


# Loops

for (vehicle in vehicle_vector) {
  print(vehicle)
}

for (num1 in 1:100) {
  for (num2 in 1:100) {
    if (num1 == num2 * num2) {
      print(num1)
    }
  }
}


# Creating matrices

vector_1 <- c(20, 30, 58, 45, 67, 92, 50, 90, 45)

A <- matrix(vector_1,

            nrow = 3,

            ncol = 3,

            byrow = TRUE)

rownames(A) = c("R1", "R2", "R3")

colnames(A) = c("C1", "C2", "C3")

print(A)


# Data frames

a <- c(10,20,30,40)
b <- c('book', 'pen','textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)


stationary.data <- data.frame(
  ID = a,
  items = b,
  store = c,
  price = d
)

print(stationary.data)

# Basic scatter plots

data(mtcars)
head(mtcars)


ggplot(mtcars, aes(drat, mpg)) + geom_point()



