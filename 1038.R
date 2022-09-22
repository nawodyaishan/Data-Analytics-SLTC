variable_1 = 10
variable_2 = 20
sum(variable_1, variable_2)

square <- function(number) {
  return (number * number)
}

product <- function(num1 , num2) {
  return (num1 * num2)
}

square(4)
product(23, 78)

marks <- c(75, 60, 53)
names(marks) <- c("Mathematics", "Science", "English")

A_vector <- c(1, 2, 4)
B_vector <- c(3, 5, 2)
total_vector = A_vector + B_vector

total_vector

vehicle_vector <- c("car", "van", "bus", "jeep")

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








