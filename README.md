# Customer Segmentation using R Programming

## Project Overview
This project aims to perform customer segmentation using clustering techniques in R. Customer segmentation is one of the most important applications of unsupervised learning. Using clustering techniques, companies can identify several segments of customers, allowing them to target the potential user base effectively. In this project, we implement customer segmentation using the k-means clustering algorithm.

## Importance of Customer Segmentation

Companies recognize that each customer has unique requirements and behaviors. By segmenting customers based on various factors such as gender, age, interests, and spending habits, companies can tailor their marketing efforts to meet the specific needs of each group. This personalized approach not only enhances customer satisfaction but also maximizes profitability.

## Project Goals

The primary goals of this Customer Segmentation project are:
- To analyze and segment the customer base into distinct groups based on relevant data.
- To gain insights into customer preferences and behaviors within each segment.
- To develop targeted marketing strategies for each customer segment.
- To optimize marketing efforts and maximize profitability by focusing on high-value segments.
- To minimize investment risks by ensuring marketing resources are used efficiently.

## Dataset

The project uses the `Mall_Customers(1).csv` dataset, which contains information about customers such as:
- CustomerID
- Gender
- Age
- Annual Income
- Spending Score


## Installation Instructions

### Prerequisites

## Project Specifications
- **Software**: R Studio version 1.2.5033
- **Hardware**:
  - Microsoft® Windows® 7/8/10 (32- or 64-bit)
  - Minimum 3 GB RAM (8 GB RAM recommended)
  - Minimum 2 GB of available disk space
  - Core processor of i3 or above

Ensure you have the following software installed on your system:
- R (version 3.6 or later)
- Git

### Steps

1. **Clone the repository:**
    ```bash
    git clone https://github.com/nsafiyyah2401/KT24602-Software-Engineering-Project-Customer-Segmentation
    cd KT24602-Software-Engineering-Project-Customer-Segmentation
    ```

2. **Install the required R packages:**
    Open R or RStudio and run the following commands:
    ```R
    install.packages(c("plotrix", "purrr", "cluster", "gridExtra", "grid", "NbClust", "factoextra", "ggplot2", "dplyr"))
    ```

3. **Download the dataset:**
    Ensure the dataset `Mall_Customers(1).csv` is in the project directory.


## Usage Guidelines
1. Prepare the dataset:
    - Place the `Mall_Customers(1).csv` file in the `data/` directory.
2. Run the R script for data preprocessing:
    ```R
    source("scripts/data_preprocessing.R")
    ```
3. Perform clustering analysis:
    ```R
    source("scripts/customer_segmentation.R")
    ```
4. Visualize the clusters:
    ```R
    source("scripts/visualize_clusters.R")
    ```

## Contribution Guidelines
Guidelines for contributing to the project:

1. **Fork the Repository:**
    Click the "Fork" button on the top right of the repository page to create a copy of the repository under your own GitHub account.

2. **Clone Your Fork:**
    ```bash
    git clone https://github.com/yourusername/KT24602-Software-Engineering-Project-Customer-Segmentation
    cd KT24602-Software-Engineering-Project-Customer-Segmentation
    ```

3. **Create a Branch:**
    ```bash
    git checkout -b feature/YourFeatureName
    ```

4. **Make Your Changes:**
    Implement your changes and commit them with a meaningful commit message.

    ```bash
    git commit -m "Add feature description"
    ```

5. **Push Your Changes:**
    ```bash
    git push origin feature/YourFeatureName
    ```

6. **Open a Pull Request:**
    Go to the original repository on GitHub and open a pull request to merge your changes.


## Project Link

[https://github.com/nsafiyyah2401/KT24602-Software-Engineering-Project-Customer-Segmentation](https://github.com/nsafiyyah2401/KT24602-Software-Engineering-Project-Customer-Segmentation)


## Conclusion
In this project, we developed a customer segmentation model using unsupervised learning, specifically the k-means clustering algorithm. We analyzed and visualized the data to implement the model effectively. This approach helps companies understand their customers better and strategize their marketing techniques more efficiently.
```

