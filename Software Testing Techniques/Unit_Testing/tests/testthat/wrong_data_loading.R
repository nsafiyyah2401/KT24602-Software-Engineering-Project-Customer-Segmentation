# Load necessary libraries
library(testthat)
library(readr)

# Define the test
test_that("Data is loaded correctly", {
  customer_data <- read_csv("/Users/apple/Desktop/KT24602-SE/ASSIGN/Mall_Customers.csv")

  expect_true(!is.null(customer_data))
  expect_equal(ncol(customer_data), 5)
  expect_equal(names(customer_data), c("CustomerID", "Gender", "Age", "Annual.Income..k..", "Spending.Score..1.100."))
})
