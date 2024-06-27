library(testthat)
library(readr)

# Load your data
customer_data <- read_csv("/Users/apple/Desktop/KT24602-SE/ASSIGN/Mall_Customers.csv")

# Calculate the actual mean and standard deviation of Age
actual_mean_age <- mean(customer_data$Age)
actual_sd_age <- sd(customer_data$Age)

# Define the expected values (replace these with the actual expected values)
expected_mean_age <- 38.85  # Replace with the actual expected mean
expected_sd_age <- 14  # Replace with the actual expected SD

# Define the test
test_that("Mean and standard deviation of Age are correct", {
  expect_equal(actual_mean_age, expected_mean_age, tolerance = 1e-2)
  expect_equal(actual_sd_age, expected_sd_age, tolerance = 1e-2)
})
