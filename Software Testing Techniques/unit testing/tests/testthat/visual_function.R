
# Load necessary libraries
library(testthat)
library(readr)

# Define the test
test_that("Visualization functions run without errors", {
  # Load the dataset
  customer_data <- read_csv("/Users/apple/Desktop/KT24602-SE/ASSIGN/Mall_Customers.csv")

  # Run the visualization function for the barplot
  a <- table(customer_data$Gender)
  barplot_output <- tryCatch({
    barplot(a, main = "Using BarPlot to display Gender Comparison",
            ylab = "Count",
            xlab = "Gender",
            col = rainbow(2),
            legend = rownames(a))
  }, error = function(e) {
    stop("Error in generating barplot: ", conditionMessage(e))
  })

  # Check if the barplot was generated successfully
  expect_false(inherits(barplot_output, "try-error"))
})
