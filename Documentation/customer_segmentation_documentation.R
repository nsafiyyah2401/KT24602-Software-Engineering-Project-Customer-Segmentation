#customer_segmenatation_with_comments_docstrings

# Load the customer data from a CSV file
customer_data <- read.csv("~/GitHub/KT24602-Software-Engineering-Project-Customer-Segmentation/Mall_Customers (1).csv")

# Display the structure of the customer data
str(customer_data)
# Print the column names of the customer data
names(customer_data)
# Display the first few rows of the customer data
head(customer_data)

# Summary statistics for the 'Age' column
summary(customer_data$Age)
sd(customer_data$Age)
# Summary statistics for the 'Annual.Income..k..' column
summary(customer_data$Annual.Income..k..)
sd(customer_data$Annual.Income..k..)
# Summary statistics for the 'Spending.Score..1.100.' column
summary(customer_data$Spending.Score..1.100.)
sd(customer_data$Spending.Score..1.100.)


# Customer Gender Visualization

# Bar plot for gender comparison
a <- table(customer_data$Gender)
barplot(a, main = "Using BarPlot to display Gender Comparison",
        ylab = "Count",
        xlab = "Gender",
        col = rainbow(2),
        legend = rownames(a))

# Pie chart for gender comparison
pct <- round(a / sum(a) * 100)
lbs <- paste(c("Female", "Male"), " ", pct, "%", sep = " ")
library(plotrix)
pie3D(a, labels = lbs,
      main = "Pie Chart Depicting Ratio of Female and Male")


# Visualization of Age Distribution

# Histogram for age distribution
summary(customer_data$Age)
hist(customer_data$Age,
     col = "blue",
     main = "Histogram to Show Count of Age Class",
     xlab = "Age Class",
     ylab = "Frequency",
     labels = TRUE)

# Boxplot for age distribution
boxplot(customer_data$Age,
        col = "#ff0066",
        main = "Boxplot for Descriptive Analysis of Age")

# Analysis of the Annual Income of the Customers

# Summary statistics for annual income
summary(customer_data$Annual.Income..k..)
hist(customer_data$Annual.Income..k..,
     col = "#660033",
     main = "Histogram for Annual Income",
     xlab = "Annual Income Class",
     ylab = "Frequency",
     labels = TRUE)

# Density plot for annual income
plot(density(customer_data$Annual.Income..k..),
     col = "yellow",
     main = "Density Plot for Annual Income",
     xlab = "Annual Income Class",
     ylab = "Density")
polygon(density(customer_data$Annual.Income..k..),
        col = "#ccff66")

# Boxplot for spending score
boxplot(customer_data$Spending.Score..1.100.,
        horizontal = TRUE,
        col = "#990000",
        main = "BoxPlot for Descriptive Analysis of Spending Score")

# Histogram for spending score
hist(customer_data$Spending.Score..1.100.,
     main = "Histogram for Spending Score",
     xlab = "Spending Score Class",
     ylab = "Frequency",
     col = "#6600cc",
     labels = TRUE)

# K-means Algorithm

library(purrr)
set.seed(123)

# Function to calculate total intra-cluster sum of square
iss <- function(k) {
  kmeans(customer_data[, 3:5], k, iter.max = 100, nstart = 100, algorithm = "Lloyd")$tot.withinss
}

k.values <- 1:10

iss_values <- map_dbl(k.values, iss)

# Plot total intra-cluster sum of squares against number of clusters
plot(k.values, iss_values,
     type = "b", pch = 19, frame = FALSE,
     xlab = "Number of clusters K",
     ylab = "Total intra-clusters sum of squares")

# Average Silhouette Method

library(cluster)
library(gridExtra)
library(grid)

k2 <- kmeans(customer_data[, 3:5], 2, iter.max = 100, nstart = 50, algorithm = "Lloyd")
s2 <- plot(silhouette(k2$cluster, dist(customer_data[, 3:5], "euclidean")))
# Repeat for k = 3, 4, ..., 10
k3<-kmeans(customer_data[,3:5],3,iter.max=100,nstart=50,algorithm="Lloyd")
s3<-plot(silhouette(k3$cluster,dist(customer_data[,3:5],"euclidean")))

k4<-kmeans(customer_data[,3:5],4,iter.max=100,nstart=50,algorithm="Lloyd")
s4<-plot(silhouette(k4$cluster,dist(customer_data[,3:5],"euclidean")))

k5<-kmeans(customer_data[,3:5],5,iter.max=100,nstart=50,algorithm="Lloyd")
s5<-plot(silhouette(k5$cluster,dist(customer_data[,3:5],"euclidean")))

k6<-kmeans(customer_data[,3:5],6,iter.max=100,nstart=50,algorithm="Lloyd")
s6<-plot(silhouette(k6$cluster,dist(customer_data[,3:5],"euclidean")))

k7<-kmeans(customer_data[,3:5],7,iter.max=100,nstart=50,algorithm="Lloyd")
s7<-plot(silhouette(k7$cluster,dist(customer_data[,3:5],"euclidean")))

k8<-kmeans(customer_data[,3:5],8,iter.max=100,nstart=50,algorithm="Lloyd")
s8<-plot(silhouette(k8$cluster,dist(customer_data[,3:5],"euclidean")))

k9<-kmeans(customer_data[,3:5],9,iter.max=100,nstart=50,algorithm="Lloyd")
s9<-plot(silhouette(k9$cluster,dist(customer_data[,3:5],"euclidean")))

k10<-kmeans(customer_data[,3:5],10,iter.max=100,nstart=50,algorithm="Lloyd")
s10<-plot(silhouette(k10$cluster,dist(customer_data[,3:5],"euclidean")))

# Evaluate number of clusters using NbClust and visualize the gap statistic
library(NbClust)
library(factoextra)

# NbClust for silhouette method
fviz_nbclust(customer_data[, 3:5], kmeans, method = "silhouette")
# Calculate gap statistic
set.seed(125)
stat_gap <- clusGap(customer_data[, 3:5], FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)

# Visualize gap statistic
fviz_gap_stat(stat_gap)
# Perform k-means clustering with optimal number of clusters (e.g., k = 6)
k6 <- kmeans(customer_data[, 3:5], 6, iter.max = 100, nstart = 50, algorithm = "Lloyd")
k6

# Visualizing the Clustering Results using the First Two Principle Components
# Principal component analysis
pcclust <- prcomp(customer_data[, 3:5], scale = FALSE)
summary(pcclust)

pcclust$rotation[,1:2]

#Plot first two principal components with cluster colors
set.seed(1)
ggplot(customer_data, aes(x = Annual.Income..k.., y = Spending.Score..1.100.)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name = " ",
                       breaks = c("1", "2", "3", "4", "5", "6"),
                       labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")

# Plot another scatter plot for Spending Score vs Age
ggplot(customer_data, aes(x = Spending.Score..1.100., y = Age)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name = " ",
                       breaks = c("1", "2", "3", "4", "5", "6"),
                       labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")

# Function to assign colors to clusters
kCols <- function(vec) {
  cols <- rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}

# Extract cluster information
digCluster <- k6$cluster
dignm <- as.character(digCluster)

# Plot the first two principal components with cluster colors
plot(pcclust$x[, 1:2], col = kCols(digCluster), pch = 19, xlab = "K-means", ylab = "Classes")
legend("bottomleft", unique(dignm), fill = unique(kCols(digCluster)))

