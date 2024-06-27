# Load necessary libraries
library(testthat)
library(readr)

# Define the test
test_that("Data is loaded correctly", {
  # Load the dataset
  customer_data <- read_csv("/Users/apple/Desktop/KT24602-SE/ASSIGN/Mall_Customers.csv")

  # Check if the dataset is not null
  expect_true(!is.null(customer_data))

  # Check if the number of columns matches
  expect_equal(ncol(customer_data), 5)

  # Check if the column names match
  expected_column_names <- c("CustomerID", "Gender", "Age", "Annual Income (k$)", "Spending Score (1-100)")
  actual_column_names <- names(customer_data)
  expect_equal(actual_column_names, expected_column_names)
})
