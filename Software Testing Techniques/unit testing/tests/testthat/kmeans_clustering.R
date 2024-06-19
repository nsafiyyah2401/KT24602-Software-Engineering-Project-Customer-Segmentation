# Load necessary libraries
library(testthat)
library(readr)

# Define the test
test_that("K-means clustering works correctly", {
  customer_data <- read_csv("/Users/apple/Desktop/KT24602-SE/ASSIGN/Mall_Customers.csv")

  set.seed(123)
  k6 <- kmeans(customer_data[, 3:5], 6, iter.max = 100, nstart = 50, algorithm = "Lloyd")

  expect_equal(length(k6$cluster), nrow(customer_data))
  expect_equal(nrow(k6$centers), 6)
})
