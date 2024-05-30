# tests/testthat/test_data_analysis.R

library(testthat)
library(here)
source(here::here("R/data_analysis.R"))

test_that("calculate_mean computes correctly", {
  expect_equal(calculate_mean(c(1, 2, 3, 4, 5)), 3)
  expect_equal(calculate_mean(c(-1, 0, 1)), 0)
})

test_that("calculate_median computes correctly", {
  expect_equal(calculate_median(c(1, 2, 3, 4, 5)), 3)
  expect_equal(calculate_median(c(1, 3, 3, 6, 7, 8, 9)), 6)
})

test_that("generate_scatter_plot generates a plot", {
  x <- 1:10
  y <- rnorm(10)
  expect_silent(generate_scatter_plot(x, y, title = "Test Scatter Plot", x_label = "X", y_label = "Y"))
})
