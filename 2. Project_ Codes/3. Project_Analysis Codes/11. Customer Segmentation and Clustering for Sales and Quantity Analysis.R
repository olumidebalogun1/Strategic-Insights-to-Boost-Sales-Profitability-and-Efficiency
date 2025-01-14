# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

# ====================================================================================

#######  11. Customer Segmentation and Clustering for Sales and Quantity Analysis  #######

# -------------------------------------------------------------------------------------
#  TASK/QUESTION: Which customer segments, based on clustering, contribute
#                 the most to overall sales and quantity?

#  PURPOSE: To identify the customer segments that generate the highest sales
#           and quantities, using clustering techniques to uncover trends
#           and insights. This will enable businesses to optimize resource allocation,
#           target marketing efforts more effectively, and tailor customer engagement
#           strategies to drive profitability and growth.
# -------------------------------------------------------------------------------------

# loading necessary library
library(cluster)

# --------  Clustering Model for Customer Segmentation  -------
# K-Means Clustering 
kmeans_result <- kmeans(Sales_clustering[, c("Total_Sales_in_K", "Total_Quantity_in_K")], centers = 3)

# Assigning Cluster Labels
# Adding a new column to the dataset to indicate which cluster each customer belongs to.
Sales_clustering$cluster <- kmeans_result$cluster

# -------  Visualizing K-Means Clustering Results  -------
# Creating a scatter plot with ellipse to visualize customer segments based on sales and quantity.
# Points are colored according to their assigned cluster.
ggplot(Sales_clustering, aes(x = Total_Sales_in_K, y = Total_Quantity_in_K, color = as.factor(cluster))) +
  geom_point() +  # Scatter plot of the data points
  stat_ellipse(aes(color = as.factor(cluster)), type = "norm", level = 0.95) +  # Adding ellipses for each cluster
  labs(
    title = "Customer Segmentation using Clustering Model",  # Ploting title
    x = "Total Sales ($ Thousand)",            # X-axis label
    y = "Total Quantity (Thousand)",           # Y-axis label
  ) +
  theme_minimal() +       # Applying a minimal theme
  theme(legend.position = "none") 

# ---- Notes ----
# 1. K-Means clustering identifies patterns in customer data, grouping customers with similar revenue and volume characteristics.
# 2. This visualization helps in interpreting customer behavior and identifying high-value clusters.
# 3. The number of clusters (`centers = 3`) can be adjusted based on business requirements or results of Elbow Method analysis.

