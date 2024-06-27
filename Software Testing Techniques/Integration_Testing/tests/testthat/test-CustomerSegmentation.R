library(testthat)
library(ggplot2)
library(purrr)
library(cluster)
library(NbClust)
library(factoextra)
library(plotrix)

setwd("C:/Users/Acer/Desktop/INTEGRATION TESTING/custsegment")
customer_data <- read.csv("Mall_Customers.csv")

test_that("Data is loaded correctly", {
  expect_true(!is.null(customer_data))
  expect_true(nrow(customer_data) > 0)
  expect_true(ncol(customer_data) > 0)
})

test_that("Statistical summaries are calculated correctly", {
  age_summary <- summary(customer_data$Age)
  expect_true(length(age_summary) > 0)
  expect_true(!is.null(sd(customer_data$Age)))

  income_summary <- summary(customer_data$Annual.Income..k..)
  expect_true(length(income_summary) > 0)
  expect_true(!is.null(sd(customer_data$Annual.Income..k..)))

  spending_summary <- summary(customer_data$Spending.Score..1.100.)
  expect_true(length(spending_summary) > 0)
  expect_true(!is.null(sd(customer_data$Spending.Score..1.100.)))
})

test_that("Visualizations are created without errors", {
  expect_error(barplot(table(customer_data$Gender)), NA)
  expect_error(hist(customer_data$Age), NA)
  expect_error(hist(customer_data$Annual.Income..k..), NA)
  expect_error(plot(density(customer_data$Annual.Income..k..)), NA)
  expect_error(boxplot(customer_data$Spending.Score..1.100.), NA)
  expect_error(hist(customer_data$Spending.Score..1.100.), NA)
})

customer_data_scaled <- scale(customer_data[,3:5])

test_that("K-means clustering works correctly with scaled data", {
  iss <- function(k) {
    kmeans(customer_data_scaled, k, iter.max = 100, nstart = 100, algorithm = "Lloyd")$tot.withinss
  }

  k.values <- 1:10
  iss_values <- map_dbl(k.values, iss)

  expect_true(length(iss_values) == length(k.values))
  expect_true(all(iss_values >= 0))

  k6 <- kmeans(customer_data_scaled, 6, iter.max = 100, nstart = 100, algorithm = "Lloyd")
  expect_true(!is.null(k6))
  expect_true(length(k6$cluster) == nrow(customer_data_scaled))

  expect_error({
    ggplot(customer_data, aes(x = Annual.Income..k.., y = Spending.Score..1.100.)) +
      geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
      scale_color_discrete(name=" ", breaks=c("1", "2", "3", "4", "5", "6"), labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
      ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")
  }, NA)

  expect_error({
    ggplot(customer_data, aes(x = Spending.Score..1.100., y = Age)) +
      geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
      scale_color_discrete(name=" ", breaks=c("1", "2", "3", "4", "5", "6"), labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
      ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")
  }, NA)
})

test_that("Optimal number of clusters is determined correctly", {
  iss <- function(k) {
    kmeans(customer_data_scaled, k, iter.max = 100, nstart = 100, algorithm = "Lloyd")$tot.withinss
  }

  k.values <- 1:10
  iss_values <- map_dbl(k.values, iss)

  expect_true(length(iss_values) == length(k.values))
  expect_true(all(iss_values >= 0))

  elbow_plot <- ggplot(data.frame(k = k.values, tot.withinss = iss_values), aes(x = k, y = tot.withinss)) +
    geom_point() +
    geom_line() +
    ggtitle("Elbow Method for Optimal Number of Clusters") +
    xlab("Number of Clusters K") +
    ylab("Total Within-Cluster Sum of Squares")

  print(elbow_plot)
})

