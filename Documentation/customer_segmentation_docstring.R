#' Customer Segmentation Analysis
#'
#' This script performs a customer segmentation analysis using a dataset of mall customers.
#' It includes data visualization, summary statistics, and k-means clustering.

# Load necessary libraries
library(plotrix)
library(purrr)
library(cluster)
library(gridExtra)
library(grid)
library(NbClust)
library(factoextra)
library(ggplot2)

#' Load customer data
#'
#' @param file_path The path to the customer data CSV file.
#' @return A data frame containing the customer data.
customer_data <- read.csv("~/GitHub/KT24602-Software-Engineering-Project-Customer-Segmentation/Mall_Customers (1).csv")

#' Display data structure and basic information
#'
#' Displays the structure, column names, and first few rows of the customer data.
str(customer_data)
names(customer_data)
head(customer_data)

#' Summary statistics for customer data
#'
#' Displays summary statistics and standard deviation for 'Age', 'Annual Income', and 'Spending Score'.
summary(customer_data$Age)
sd(customer_data$Age)
summary(customer_data$Annual.Income..k..)
sd(customer_data$Annual.Income..k..)
summary(customer_data$Spending.Score..1.100.)
sd(customer_data$Spending.Score..1.100.)

#' Visualize customer gender distribution
#'
#' Generates a bar plot and 3D pie chart to compare gender distribution among customers.
a <- table(customer_data$Gender)
barplot(a, main = "Using BarPlot to display Gender Comparison",
        ylab = "Count",
        xlab = "Gender",
        col = rainbow(2),
        legend = rownames(a))
pct <- round(a / sum(a) * 100)
lbs <- paste(c("Female", "Male"), " ", pct, "%", sep = " ")
pie3D(a, labels = lbs,
      main = "Pie Chart Depicting Ratio of Female and Male")

#' Visualize age distribution
#'
#' Generates a histogram and boxplot to show the age distribution of customers.
summary(customer_data$Age)
hist(customer_data$Age,
     col = "blue",
     main = "Histogram to Show Count of Age Class",
     xlab = "Age Class",
     ylab = "Frequency",
     labels = TRUE)
boxplot(customer_data$Age,
        col = "#ff0066",
        main = "Boxplot for Descriptive Analysis of Age")

#' Analyze annual income of customers
#'
#' Generates summary statistics, histogram, density plot, and boxplot for annual income.
summary(customer_data$Annual.Income..k..)
hist(customer_data$Annual.Income..k..,
     col = "#660033",
     main = "Histogram for Annual Income",
     xlab = "Annual Income Class",
     ylab = "Frequency",
     labels = TRUE)
plot(density(customer_data$Annual.Income..k..),
     col = "yellow",
     main = "Density Plot for Annual Income",
     xlab = "Annual Income Class",
     ylab = "Density")
polygon(density(customer_data$Annual.Income..k..),
        col = "#ccff66")

#' Analyze spending score of customers
#'
#' Generates a boxplot and histogram for spending score.
boxplot(customer_data$Spending.Score..1.100.,
        horizontal = TRUE,
        col = "#990000",
        main = "BoxPlot for Descriptive Analysis of Spending Score")
hist(customer_data$Spending.Score..1.100.,
     main = "Histogram for Spending Score",
     xlab = "Spending Score Class",
     ylab = "Frequency",
     col = "#6600cc",
     labels = TRUE)

#' K-means clustering analysis
#'
#' Performs k-means clustering and evaluates the optimal number of clusters using the elbow method, silhouette method, and gap statistic.
#' @param k The number of clusters.
#' @return A k-means clustering model.
set.seed(123)
iss <- function(k) {
  kmeans(customer_data[, 3:5], k, iter.max = 100, nstart = 100, algorithm = "Lloyd")$tot.withinss
}
k.values <- 1:10
iss_values <- map_dbl(k.values, iss)
plot(k.values, iss_values,
     type = "b", pch = 19, frame = FALSE,
     xlab = "Number of clusters K",
     ylab = "Total intra-clusters sum of squares")

# Average Silhouette Method
k2 <- kmeans(customer_data[, 3:5], 2, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s2 <- plot(silhouette(k2$cluster, dist(customer_data[, 3:5], "euclidean")))
k3 <- kmeans(customer_data[, 3:5], 3, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s3 <- plot(silhouette(k3$cluster, dist(customer_data[, 3:5], "euclidean")))
k4 <- kmeans(customer_data[, 3:5], 4, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s4 <- plot(silhouette(k4$cluster, dist(customer_data[, 3:5], "euclidean")))
k5 <- kmeans(customer_data[, 3:5], 5, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s5 <- plot(silhouette(k5$cluster, dist(customer_data[, 3:5], "euclidean")))
k6 <- kmeans(customer_data[, 3:5], 6, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s6 <- plot(silhouette(k6$cluster, dist(customer_data[, 3:5], "euclidean")))
k7 <- kmeans(customer_data[, 3:5], 7, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s7 <- plot(silhouette(k7$cluster, dist(customer_data[, 3:5], "euclidean")))
k8 <- kmeans(customer_data[, 3:5], 8, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s8 <- plot(silhouette(k8$cluster, dist(customer_data[, 3:5], "euclidean")))
k9 <- kmeans(customer_data[, 3:5], 9, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s9 <- plot(silhouette(k9$cluster, dist(customer_data[, 3:5], "euclidean")))
k10 <- kmeans(customer_data[, 3:5], 10, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s10 <- plot(silhouette(k10$cluster, dist(customer_data[, 3:5], "euclidean")))

# Evaluate clusters using NbClust and visualize the gap statistic
fviz_nbclust(customer_data[, 3:5], kmeans, method = "silhouette")
set.seed(125)
stat_gap <- clusGap(customer_data[, 3:5], FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(stat_gap)

# Perform k-means clustering with optimal number of clusters
k6 <- kmeans(customer_data[, 3:5], 6, iter.max = 100, nstart = 50, algorithm = "Lloyd")
k6

# Visualize clustering results using PCA
pcclust <- prcomp(customer_data[, 3:5], scale = FALSE)
summary(pcclust)
pcclust$rotation[, 1:2]
set.seed(1)
ggplot(customer_data, aes(x = Annual.Income..k.., y = Spending.Score..1.100.)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name = " ",
                       breaks = c("1", "2", "3", "4", "5", "6"),
                       labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")

# Plot scatter plot for Spending Score vs Age
ggplot(customer_data, aes(x = Spending.Score..1.100., y = Age)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name = " ",
                       breaks = c("1", "2", "3", "4", "5", "6"),
                       labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")

#' Assign colors to clusters
#'
#' @param vec A vector of cluster assignments.
#' @return A vector of colors corresponding to each cluster.
kCols <- function(vec) {
  cols <- rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}

# Extract cluster information
digCluster <- k6$cluster
dignm <- as.character(digCluster)

# Plot first two principal components with cluster colors
plot(pcclust$x[, 1:2], col = kCols(digCluster), pch = 19, xlab = "K-means", ylab = "Classes")
legend("bottomleft", unique(dignm), fill = unique(kCols(digCluster)))
