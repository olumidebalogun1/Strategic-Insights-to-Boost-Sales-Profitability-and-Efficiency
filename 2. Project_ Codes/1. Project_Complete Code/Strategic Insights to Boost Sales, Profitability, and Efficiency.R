# ---------------------------------------------------------------------------------

# Script Title: Strategic Insights to Boost Sales, Profitability, and Efficiency.
# # Author: Olumide Balogun
# Date: 2024-10-12
# Purpose: To leverage sales data from 2020 to 2023, transforming raw data into 
#          actionable insights through meticulous cleaning, exploratory data analysis (EDA),
#          and dynamic visualizations. To identifies patterns, uncovers trends, 
#          explores customer behavior, and reveals the factors driving sales and profitability.
#          The goal is to optimize business strategy, resource allocation, and decisions related to product,
#          inventory, and pricing. By enabling data-driven decisions, the analysis helps maximize sales,
#          increase profitability, improve customer satisfaction, enhance operational efficiency, 
#          and uncover investment opportunities for long-term success.
# ---------------------------------------------------------------------------------

#######   Loading necessary libraries   #######

library(tidyverse)
library(dplyr)
library(ggplot2)
library(readxl)
library(lubridate)
library(scales)
library(pastecs)
library(ggpubr)
library(ggrepel)


####### Importing datasets  #######

Customers <- read_excel("Sales Dataset/Customers.xlsx")
View(Customers)        # Viewing the table

Location <- read_excel("Sales Dataset/Location.xlsx")
View(Location)        # Viewing the table

Orders <- read_excel("Sales Dataset/Orders.xlsx")
View(Orders)           # Viewing the table

Products <- read_excel("Sales Dataset/Products.xlsx")
View(Products)


#######   Joining the tables  #######

sales_data <- Orders %>%
  left_join(Customers, by = "Customer_ID") %>%
  left_join(Location, by = "Postal_Code") %>%
  left_join(Products, by = "Product_ID")        # Performing simultaneous left joins 

View(sales_data)        # Viewing the joined table


#######   Wrangling   #######

# Checking for Missing Data
total_missing_values <- sum(is.na(sales_data))
print(paste("Total missing values in the dataset:", total_missing_values))

# Removing duplicate rows
sales_data <- sales_data %>% 
  distinct()

# Checking the structure of the dataset
str(sales_data)        # Displaying columns, data types, and sample values

# -----  Converting order_date to date format and extract year/month.  -----
sales_data$Order_Date <- as.Date(sales_data$Order_Date, format = "%Y-%m-%d")      # Converting order_date to Date format
sales_data$year <- format(sales_data$Order_Date, "%Y")              # Extracting Year
sales_data$month <- format(sales_data$Order_Date, "%Y-%m")          # Extracting Year and Month

# Displaying columns, data types, and sample values
str(sales_data)    

# -----  Calculating and displaying the number of rows and columns in sales_data.  ----- 
# Number of Rows
num_rows <- nrow(sales_data)
print(paste("Number of rows:", num_rows))

# Number of Columns
num_columns <- ncol(sales_data)
print(paste("Number of columns:", num_columns))


#######  Exploratory Data Analysis 1 (EDA) - statistical summary.  ####### 

# -----  Generating a statistical summary for specific columns in sales_data.  -----
# Columns to Summarize
selected_columns <- c("Sales", "Quantity", "Discount", "Profit")

# Viewing Summary of Selected Columns
sales_data %>%
  select(all_of(selected_columns)) %>%
  summary()


# ==================================================================================================================== 

#######   1. Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth   #######

# ---------------------------------------------------------------------------------------------------------------------
#  TASK/QUESTION: Were there any years that experienced negative or stagnant growth?
#                 Moreover, are there significant differences within the data?

#  PURPOSE: To analyze historical trends to identify periods of under- performance
#           or stagnation and evaluate the significance of variations in key metrics,
#           such as sales, profit, and quantity.This analysis aims to uncover potential 
#           issues that may require further investigation or strategic interventions.
# ---------------------------------------------------------------------------------------------------------------------

# loading necessary libraries
library(RColorBrewer)
library(gtExtras)

# ---- Summarizing Annual Performance Metrics ----
Annual_Summary <- sales_data %>%
  group_by(year) %>%      # Grouping the dataset by the 'year' column
  summarise(
    Total_Sales = paste0(round(sum(Sales) / 1e6, 2), "M"),          # Calculating total sales in millions ($M) and appending "M"
    Total_Profit = paste0(round(sum(Profit) / 1e6, 2), "M"),        # Calculating total profit in millions ($M) and appending "M"
    Total_Quantity = paste0(round(sum(Quantity) / 1e3, 2), "K")     # Calculating total quantity in thousands (K) and appending "K"
  )

# ---- Analyzing Annual Performance with Growth Trends ----
Annual_Summary <- Annual_Summary %>%
  mutate(
    Total_Sales_Numeric = as.numeric(sub("M", "", Total_Sales)),            # Converting sales to numeric for calculations
    Total_Profit_Numeric = as.numeric(sub("M", "", Total_Profit)),          # Converting profit to numeric for calculations
    Total_Quantity_Numeric = as.numeric(sub("K", "", Total_Quantity))       # Converting quantity to numeric for calculations
  ) %>%
  arrange(year) %>%
  mutate(
    Pct_diff_Sales = paste0(round((Total_Sales_Numeric - lag(Total_Sales_Numeric)) / lag(Total_Sales_Numeric) * 100, 2), "%"),
    Pct_diff_Profit = paste0(round((Total_Profit_Numeric - lag(Total_Profit_Numeric)) / lag(Total_Profit_Numeric) * 100, 2), "%"),
    Pct_diff_Quantity = paste0(round((Total_Quantity_Numeric - lag(Total_Quantity_Numeric)) / lag(Total_Quantity_Numeric) * 100, 2), "%")
  )

# Removing the numeric columns before creating the visual
Annual_Summary <- Annual_Summary %>%
  select(year, Total_Sales, Total_Profit, Total_Quantity, Pct_diff_Sales, Pct_diff_Profit, Pct_diff_Quantity)

# ---- Visualizing Annual Performance with Growth Trends ----
Plot_Annual_Summary <- Annual_Summary %>% 
  gt() %>% 
  tab_header(title = "Annual Performance: Sales ($ Million), Profit ($ Million), 
             and Quantity (Thousand) with Percentage Growth") %>%        # Adding descriptive title to the table
  cols_align(align = "left")                                             # Aligning all columns to the left for better readability

# ---- Enhancing Table with Conditional Formatting ----
plot_annual_performance <- Plot_Annual_Summary %>% 
  gt_theme_pff() %>%                                                        # Applying professional theme for consistent styling
  gt_highlight_rows(column = Total_Sales, fill="lightpink") %>%             # Highlighting cells in the "Total Sales" column with light pink
  gt_highlight_rows(column = Total_Profit, fill="lightblue") %>%            # Highlighting cells in the "Total Profit" column with light blue
  gt_highlight_rows(column = Pct_diff_Sales, fill="lightpink") %>%          # Highlighting cells in "Sales Growth %" column with light pink
  gt_highlight_rows(column = Pct_diff_Profit, fill="lightblue") %>%         # Highlighting cells in "Profit Growth %" column with light blue
  gt_highlight_rows(rows = Pct_diff_Sales < 0, fill="steelblue")            # Highlighting rows where sales growth is negative with steel blue

plot_annual_performance         # Displaying the enhanced table


# ========================================================================================= 

#######   2. Analysis of Sales and Profit Performance by Segment Across Regions   #######

# -----------------------------------------------------------------------------------------
#  TASK/QUESTION: How do sales and profit performance vary across 
#                 different segments within each region?

#  PURPOSE: To evaluate the performance of sales and profit across
#           various segments within different regions.
#           By identifying patterns, trends, and discrepancies,
#           the analysis aims to uncover opportunities for improvement,
#           highlight high-performing segments and regions,
#           and provide actionable insights to guide strategic decision-making.  
# -----------------------------------------------------------------------------------------

# loading necessary libraries
library(forcats)      # for reordering factors
library(ggsci)

# Representing Million as M and Thousand as K
df_sales <- sales_data %>% 
  mutate(Sales_K = round(Sales / 1e3, 2)) %>% 
  mutate(Profit_K = round(Profit / 1e3, 2)) %>% 
  mutate(Quantity_K = round(Quantity / 1e3, 3))

view(df_sales)

# ----- 2a. Total Sales by Segment for Each Region  -----
# Grouping by Region
df_sales_S_R <- df_sales %>% 
  group_by( Segment, Region) %>% 
  summarise(Regional_Sales = sum(Sales_K))
view(df_sales_S_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_sales_S_R$Region <- fct_reorder(df_sales_S_R$Region, df_sales_S_R$Regional_Sales, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Sales by Segment Across Each Region  -----
ggplot(df_sales_S_R, aes(x = reorder(Segment, -Regional_Sales), y = Regional_Sales, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Sales, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.2, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Sales by Segment for Each Region", 
       x = "Region", 
       y = " Total Sales ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# ----- Kruskal-Wallis test  -----
# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_sales_2 <- df %>%
  mutate(Region_Segment = interaction(Region, Segment))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Sales ~ Region_Segment, data = data_sales_2)
print(kruskal_test)

# ----- 2b. Total Profit by Segment for Each Region  -----
# Grouping by Region
df_profit_S_R <- df_sales %>% 
  group_by( Segment, Region) %>% 
  summarise(Regional_Profit = sum(Profit_K))
view(df_profit_S_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_profit_S_R$Region <- fct_reorder(df_profit_S_R$Region, df_profit_S_R$Regional_Profit, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Profit by Segment Across Each Region  -----
ggplot(df_profit_S_R, aes(x = reorder(Segment, -Regional_Profit), y = Regional_Profit, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Profit, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.2, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Profit by Segment for Each Region", 
       x = "Region", 
       y = " Total Profit ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# ----- Kruskal-Wallis test  -----
# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_profit_2 <- df %>%
  mutate(Region_Segment = interaction(Region, Segment))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Profit ~ Region_Segment, data = data_profit_2)
print(kruskal_test)


# ======================================================================================= 

#######   3. Sales and Profit Performance Analysis by Category Across Regions   #######

# ---------------------------------------------------------------------------------------
#  TASK/QUESTION: How do sales and profit performance vary across different
#                 product categories within each region?

#  PURPOSE: To examine the sales and profit performance across various product
#           categories and regions. By identifying key trends, variations,
#           and under- performing categories or regions, this analysis seeks
#           to uncover insights that can drive business strategy,
#           optimize resource allocation, and highlight areas for
#           targeted improvements or further investigation.  
# --------------------------------------------------------------------------------------

# ----- 3a. Total Sales by  Category for Each Region  -----
# Grouping by Region
df_sales_C_R <- df_sales %>% 
  group_by( Category, Region) %>% 
  summarise(Regional_Sales = sum(Sales_K))
view(df_sales_C_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_sales_C_R$Region <- fct_reorder(df_sales_C_R$Region, df_sales_C_R$Regional_Sales, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Sales by Category Across Each Region  -----
ggplot(df_sales_C_R, aes(x = reorder(Category, -Regional_Sales), y = Regional_Sales, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Sales, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.1, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Sales by Category for Each Region", 
       x = "Region", 
       y = " Total Sales ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_sales_1 <- df %>%
  mutate(Region_Category = interaction(Region, Category))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Sales ~ Region_Category, data = data_sales_1)
print(kruskal_test)

# ----- 3b. Total Profit by  Category for Each Region  -----
# Grouping by Region
df_profit_C_R <- df_sales %>% 
  group_by( Category, Region) %>% 
  summarise(Regional_Profit = sum(Profit_K))
view(df_profit_C_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_profit_C_R$Region <- fct_reorder(df_profit_C_R$Region, df_profit_C_R$Regional_Profit, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Profit by Category Across Each Region  -----
ggplot(df_profit_C_R, aes(x = reorder(Category, -Regional_Profit), y = Regional_Profit, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Profit, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.1, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Profit by Category for Each Region", 
       x = "Region", 
       y = " Total Profit ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_profit_1 <- df %>%
  mutate(Region_Category = interaction(Region, Category))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Profit ~ Region_Category, data = data_profit_1)
print(kruskal_test)


# =============================================================================================== 

#######   4. Sales and Profit Performance Analysis by Sub-Category   #######

# -----------------------------------------------------------------------------------------------
#  TASK/QUESTION: How do sales and profit performance vary across different sub-categories?

#  PURPOSE: To explore the sales and profit performance across various sub-categories.
#           By identifying high-performing and under-performing sub-categories, 
#           the analysis aims to uncover valuable insights that can inform product strategies, 
#           optimize inventory and pricing decisions, and highlight areas for improvement 
#           or investment opportunities within the business.
# ----------------------------------------------------------------------------------------------

# Calculating Total Sales and Total Profit
SubCat <- sales_data %>% 
  group_by(`Sub_Category`) %>% 
  summarise(Sales_Sum = sum(Sales),
            Profit_Sum = sum(Profit), .groups = "drop") %>% 
  mutate(Sales_K = round(Sales_Sum / 1e3, 2)) %>% 
  mutate(Profit_K = round(Profit_Sum / 1e3, 2)) %>% 
  arrange(desc(Sales_K)) 

view(SubCat)

# ----- 4a. Bar plot of Total Sales by Sub-Category  -----  
ggplot(SubCat, aes(x= reorder(`Sub_Category`, Sales_K), y= Sales_K)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9),fill = "tomato") +
  geom_text(aes(label = round(Sales_K, 1)), 
            position = position_dodge(width = 0.9), 
            hjust = -0.3, size = 3, fontface = "bold") +        # Adjusting the size and position of the text and making it bold
  labs(title = "Total Sales by Sub-Category", 
       x = "Sub_Category", 
       y = "Sales ($ thousand)") +
  theme_classic2() +
  coord_flip() +  # Flips the coordinates for a horizontal bar chart
  theme(axis.text.x = element_text(angle = 45, vjust = 1))

# Performing the Kruskal-Wallis test on Sales by Sub-Category  
kruskal_test_Sales_Subcategory <- kruskal.test( Sales ~ `Sub_Category`, data=sales_data)
kruskal_test_Sales_Subcategory

# ----- 4b. Bar plot of Total Profit by Sub-Category  -----
ggplot(SubCat, aes(x= reorder(`Sub_Category`, Profit_K), y= Profit_K)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9), fill = "lightblue") +
  geom_text(aes(label = round(Profit_K, 1)), 
            position = position_dodge(width = 0.9), 
            hjust = -0.6, size = 3, fontface = "bold") +      # Adjusting the size and position of the text and making it bold
  labs(title = "Total Sales by Sub_Category", 
       x = "Sub_Category", 
       y = "Profit ($ thousand)") +
  theme_classic2() +
  coord_flip() +  # Flips the coordinates for a horizontal bar chart
  theme(axis.text.x = element_text(angle = 45, vjust = 1))

# Performing the Kruskal-Wallis test on Profit by Sub-Category  
kruskal_test_Profit_Subcategory <- kruskal.test( Profit ~ `Sub_Category`, data=sales_data)
kruskal_test_Profit_Subcategory


# ========================================================================================= 

#######   5. Analyzing Sales Performance Trends Over Time  #######

# --------------------------------------------------------------------------------------------
#  TASK/QUESTION: Can a distinct upward or downward trend in sales performance
#                 be identified over time?

#  PURPOSE: To examine sales performance over time in order to identify
#           long-term trends, assess whether the business is experiencing
#           growth or decline and evaluate the sustainability of its sales stream.
#           The insights derived from this analysis aim to detect early warning signs
#           of potential decline and inform strategic decisions that can optimize
#           future performance and business direction.
# -------------------------------------------------------------------------------------------

# ----- 5a. Monthly Sales Cyclical Patterns  ------
# Adding month column for cyclical pattern analysis
sales_data_cyclical <- sales_data %>%
  mutate(month = format(Order_Date, "%b"))      # Abbreviating month names
view(sales_data_cyclical)

# Reordering months to ensure proper chronological order in the plot
sales_data_cyclical <- sales_data_cyclical %>%
  mutate(month = factor(month, levels = month.abb))

# Grouping data into year and month
df_OD <- sales_data_cyclical %>% 
  group_by(year, month) %>% 
  summarise(Monthly_Sales = sum(Sales), .groups = "drop") %>%
  mutate(Monthly_Sales_K = round(Monthly_Sales / 1e3, 2)) %>%       # Converting sales to thousands
  arrange(year, match(month, month.abb))             # Ensuring months are sorted chronologically
view(df_OD)

#Preparing data for the box plot
df_bp <- df_OD %>% 
  mutate(Month = as.factor(month)) %>%        # Ensuring Month is a factor
  mutate(Year = as.factor(year))              # Ensuring Year is a factor

class(df_bp$Month)         # Checking the class of the Month column

# Creating a box plot to visualize the monthly sales distribution
ggplot(df_bp, aes(Month, Monthly_Sales_K, fill = Month)) +
  geom_boxplot(outliers=FALSE, alpha=0.7) +          # Adjusting alpha and removing outliers
  theme_minimal() +
  labs(title= "Monthly Sales Cyclical Patterns",
       x = "Month",
       y = "Total Sales ($ thousand)") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none" )          # Removing legend
 
# ----- Statistical Analysis of Monthly Sales ------
# Performing the Kruskal-Wallis test on Monthly Sales 
kruskal_MonthlySales <- kruskal.test(Monthly_Sales_K ~ Month, data=df_bp)
kruskal_MonthlySales        # Displaying the results of the Kruskal-Wallis test

# ----- 5b. Time Series Analysis of Overall Sales Performance and Trends  -----
# Creating the time series object
Sales_ts <- ts(df_OD$Monthly_Sales_K, start = c(2020,1), frequency = 12)

# Time series plot without the x-axis (xaxt = "n")
plot(Sales_ts, xaxt = "n", xlab = "Month_Year", ylab = "Sales ($ thousand)", type = "l",
     lwd=2, main = "Sales per Month", col ="red")
abline(h = mean(Sales_ts), col = "blue", lty = 2)  
points(Sales_ts, pch = 16, col = "steelblue", cex = 0.7)
grid(col = "gray", lty = "dotted")

# Extracting the time points from the time series and format them as month-year
time_labels <- time(Sales_ts)
month_year_labels <- format(as.Date(paste(floor(time_labels), (time_labels - floor(time_labels)) * 12 + 1, "01", sep="-")), "%b-%Y")

# Adding the x-axis with formatted month-year labels
axis(1, at = time(Sales_ts), labels = month_year_labels, las = 2, cex.axis = 0.8)


# ========================================================================================= 

#######   6. Exploratory Analysis and Statistical Correlation with Significance Testing  #######

# --------------------------------------------------------------------------------------------
# TASK/QUESTION: How do the variables correlate with each other, and what is 
#                the strength and direction of these relationships?

# PURPOSE: To explore and quantify the relationships between variables,
#          assessing the strength and direction of these correlations.
#          By applying significance testing and confidence intervals,
#          the analysis ensures statistical rigor, providing reliable
#          insights and enabling informed interpretations of the data.  
# -------------------------------------------------------------------------------------------

# Loading necessary libraries
library(corrplot)
library(psych)
library(ggstatsplot)

# -------  6a. Correlation Matrix with corrplot.  -------
# Preparing the data for correlation analysis
cor_data <- sales_data %>%
  select(Sales, Quantity, Discount, Profit) 

# Visualizing the correlation matrix with values in bold black font
corrplot(
  corr = cor(cor_data),
  addCoef.col = "black",         
  number.cex = 0.9,              
  number.digits = 1,             
  diag = FALSE,                  
  bg = "lightgray",              
  outline = "black",             
  addgrid.col = "white",         
  mar = c(1, 1, 1, 1),           
  main = "Correlation Matrix: Sales, Quantity, Discount, and Profit",
  font.labels = 2 )                 # Making the text bold

# ------  6b. Correlation Matrix with psych.   -------
# Selecting only the numeric columns
numerical_data <- sales_data %>%
  select(Sales, Quantity, Discount, Profit)

# Computing the correlation matrix
correlation_results <- psych::corr.test(
  numerical_data,            # Dataset containing numeric variables
  method = "pearson",        # Method for correlation (default is Pearson)
  adjust = "none" )          # Adjustment method for p-values (e.g., none, Holm)

# Viewing the correlation matrix
print(correlation_results$r)       # Correlation coefficients (r-values)

# ----- The p-values for assessing the significance of correlations  -----
# Viewing the p-values to test significance of correlations
print(correlation_results$p)       # P-values


# ========================================================================================= 

#######  7. Identifying Key Drivers of Sales Performance and Profitability: Insights from Feature Importance and Regression Analysis  #######

# --------------------------------------------------------------------------------
#  TASK/QUESTION: What are the key drivers that significantly contribute
#                 to sales performance and profitability?

#  PURPOSE: To identify the key factors that significantly influence sales performance
#           and profitability. By using feature importance and regression analysis, 
#           the goal is to provide businesses with actionable insights that help 
#           optimize strategies and make informed decisions to improve overall 
#           sales performance and profitability. 
# --------------------------------------------------------------------------------

# Loading necessary library
library(randomForest)

# ----- 7a. Key Sales Performance Drivers  -----
# Determining which variables have the greatest influence on profit using Random Forest
Sales_rf_model <- randomForest(Sales ~ Quantity + Discount + Profit + Sub_Category + Segment + Region , data = sales_data)
importance_rf <- importance(Sales_rf_model)
varImpPlot(Sales_rf_model, main = "Feature Importance Plot")

# The Key Drivers of Sales using Regression Model  
Sales_model <- lm(Sales ~ Quantity + Discount + Profit + Sub_Category + Segment + Region , data = sales_data)
summary(Sales_model)

# NOTE: Coefficients help identify the strength and direction of influence of each variable on sales.

# ----- 7b. Key Drivers of Profitability  ------
# Determining which variables have the greatest influence on profit using Random Forest
Profit_rf_model <- randomForest(Profit ~ Sales + Quantity + Discount + Sub_Category + Segment + Region , data = sales_data)
importance_rf <- importance(Profit_rf_model)
varImpPlot(Profit_rf_model, main = "Feature Importance Plot")

# The Key Drivers of Profit using Regression Model
Profit_model <- lm(Profit ~ Sales + Quantity + Discount + Sub_Category + Segment + Region , data = sales_data)
summary(Profit_model)

# NOTE: Coefficients help identify the strength and direction of influence of each variable on profit.


# ========================================================================================== 

#####  8. Predicting Future Sales Trends with Time Series Analysis    #####

# ------------------------------------------------------------------------------------------
#  TASK/QUESTION: What are the predicted sales trends for the next 36 months, and  
#                 how can these insights be leveraged to drive favorable business decisions?

#  PURPOSE: To forecast sales trends for the next 36 months using time series analysis.
#           These insights aim to support data-driven decision-making in key areas such
#           as pricing, marketing, and resource allocation, enabling businesses to
#           optimize strategies and achieve favorable financial outcomes. 
# ------------------------------------------------------------------------------------------

# loading necessary library
library(tseries)

# Recalling the time series object
Sales_ts<- ts(df_OD$Monthly_Sales_K, start = c(2020,1), end = c(2023,12), frequency = 12) 

# ----- Augmented Dickey Fuller Test for Stationarity  -----
# Checking stationarity 
adf_test <- adf.test(Sales_ts)
print(adf_test)

#  -----  Performing the difference of the series to make it stationary If the p-value > 0.05  -----
# Checking for stationarity again
adf_test_diff <- adf.test(diff(Sales_ts))
print(adf_test_diff)

# -----  Sales Trend Forecast using ARIMA Model  -----
# loading necessary library
library(forecast)         

# Fitting the ARIMA model with d=1 (first-order differencing) since the series is stationary
arima_model <- auto.arima(Sales_ts, d = 1)    # 'd=1' means first-order differencing
summary(arima_model)

# Forecasting Sales Trends using ARIMA Model
arima_model <- auto.arima(Sales_ts)
forecast_Sales <- forecast(arima_model, h=36)
plot(forecast_Sales, main = "Sales Forecast for the Next 3 Years",
     xlab = "Year_Month", ylab = "Sales Amount")

# Printing the forecasted numeric values
print(forecast_Sales$mean)


# ================================================================================

#####  9.  Identifying Top Customers Driving 80% of Total Sales  #####

# --------------------------------------------------------------------------------
#  TASK/QUESTION: Which customers account for 80% of the business’s total sales?

#  PURPOSE: To identify the key customers who contribute significantly (80%)
#           to total sales. By prioritizing these high-value customers, 
#           businesses can optimize engagement strategies, allocate marketing
#           resources efficiently, and implement retention plans to foster growth,
#           maximize revenue, and build long-term success.
# --------------------------------------------------------------------------------

# ------  Grouping by Customer Name and Calculating Total Sales ------
# This block aggregates total sales for each customer and calculates  
# additional metrics such as sales contribution percentage, and cumulative percentage.
Sales_clustering <- sales_data %>%
  group_by(Customer_Name  ) %>% 
  summarise(Total_Sales_in_K = round(sum(Sales)/1e3, 2),
            Total_Quantity_in_K = round(sum(Quantity)/1e3, 2), .groups = "drop") %>% 
  arrange(desc(Total_Sales_in_K)) %>% 
  mutate(Total_Sales_percent = round(Total_Sales_in_K *100/sum(Total_Sales_in_K), 2)) %>% 
  mutate(Cum_percent = round(cumsum(Total_Sales_percent), 2)) %>% 
  select(Customer_Name , Total_Sales_in_K, Total_Quantity_in_K , 
         Total_Sales_percent, Cum_percent) %>% 
  arrange(desc(Total_Sales_in_K))

view(Sales_clustering)    # Display the sales clustering data

# ------ Creating a Table for Customers Who Make Up 80% of Total Sales ------
# Filtering the customers contributing up to 80% of total sales.
top_80_customers <- Sales_clustering %>%
  filter(Cum_percent <= 80)

view(top_80_customers)        # Display the top 80% customers data

# ------  Creating a Table for Customers Who Make Up 80% of Total Sales. -------
# Identifying Top Customers Contributing 80% of Sales
# Plotting a Table for Top Customers 
plot <- top_80_customers  %>% 
  select(Customer_Name, Total_Sales_in_K, Total_Sales_percent, Cum_percent ) %>% 
  gt() %>% 
  tab_header(title = "Top Customers Who Make Up 80% of Total Sales ($ thousand)") %>% 
  cols_align(align = "left")

# Enhancing Table with Styling
plot <- plot %>% 
  gt_theme_pff() %>% 
  gt_highlight_rows(rows = Total_Sales_in_K >=10.00, fill="lightpink" ) %>% 
  gt_highlight_rows(rows = Total_Sales_in_K >=5.00 & Total_Sales_in_K <=10.00 , fill="lightblue" ) %>% 
  gt_plt_bar_pct(Total_Sales_percent, fill = "steelblue",height = 15, width = 100)

plot      # Displaying the styled table


# ================================================================================

#####  10.  Identifying Top Products Driving 80% of Total Sales  #####

# --------------------------------------------------------------------------------
#  TASK/QUESTION: Which products contribute to 80% of the business’s total sales?

#  PURPOSE: To identify the key products that contribute to 80% of total sales. 
#           By focusing on these high-value products, businesses can optimize engagement 
#           strategies, allocate marketing resources more effectively, and develop  
#           retention plans that drive growth, maximize revenue, and support long-term success.
# --------------------------------------------------------------------------------

# ------  Grouping by Product Name and Calculating Total Sales ------
# This block aggregates total sales for each product and calculates  
# additional metrics such as sales contribution percentage, and cumulative percentage.
Product_Sales_clustering <- sales_data %>%
  group_by(Product_Name  ) %>% 
  summarise(Total_Sales_in_K = round(sum(Sales)/1e3, 2),
            Total_Quantity_in_K = round(sum(Quantity)/1e3, 2), .groups = "drop") %>% 
  arrange(desc(Total_Sales_in_K)) %>% 
  mutate(Total_Sales_percent = round(Total_Sales_in_K *100/sum(Total_Sales_in_K), 2)) %>% 
  mutate(Cum_percent = round(cumsum(Total_Sales_percent), 2)) %>% 
  select(Product_Name , Total_Sales_in_K, Total_Quantity_in_K , 
         Total_Sales_percent, Cum_percent) %>% 
  arrange(desc(Total_Sales_in_K))

view(Product_Sales_clustering)    # Display the product clustering data

# ------ Creating a Table for Product Make Up 80% of Total Sales ------
# Filtering the Products contributing up to 80% of total sales.
top_80_products <- Product_Sales_clustering %>%
  filter(Cum_percent <= 80)

view(top_80_products)        # Display the top 80% products data

# ------  Creating a Table for products Who Make Up 80% of Total Sales. -------
# Identifying Top Products Contributing 80% of Sales
# Plotting a Table for Top Products 
plot <- top_80_products  %>% 
  select(Product_Name, Total_Sales_in_K, Total_Sales_percent, Cum_percent ) %>% 
  gt() %>% 
  tab_header(title = "Top Products Who Make Up 80% of Total Sales ($ thousand)") %>% 
  cols_align(align = "left")

# Enhancing Table with Styling
plot <- plot %>% 
  gt_theme_pff() %>% 
  gt_highlight_rows(rows = Total_Sales_in_K >=7.50, fill="lightblue" ) %>% 
  gt_highlight_rows(rows = Total_Sales_in_K >=2.50 & Total_Sales_in_K <=7.50 , fill="lightpink" ) %>% 
  gt_plt_bar_pct(Total_Sales_percent, fill = "steelblue",height = 15, width = 100)

plot    # Displaying the styled table


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
  theme(legend.position = "none")        # Removing the legend

# ---- Notes ----
# 1. K-Means clustering identifies patterns in customer data, grouping customers with similar revenue and volume characteristics.
# 2. This visualization helps in interpreting customer behavior and identifying high-value clusters.
# 3. The number of clusters (`centers = 3`) can be adjusted based on business requirements or results of Elbow Method analysis.


# ====================================================================================

#######  12. Market Basket Analysis: Uncovering Customer Purchase Patterns for Strategic Sales Optimization  #######

# -------------------------------------------------------------------------------------
#  TASK/QUESTION: What are the most common patterns and associations in 
#                 customer purchases (e.g. frequently bought items together)?

#  PURPOSE: To  uncover hidden relationships and patterns in customer purchases
#           using market basket analysis. By understanding which products are 
#           often bought together, businesses can optimize sales strategies, 
#           improve product recommendations, enhance promotions, and
#           make data-driven decisions to maximize revenue, improve customer 
#           satisfaction, and increase operational efficiency.
# -------------------------------------------------------------------------------------

# loading necessary library
library(arules)
library(arulesViz)

# Convert the sales data into transactions
transactions <- as(split(sales_data$Product_Name, sales_data$Customer_Name), "transactions")

# Generate association rules
rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))

# View the top rules
inspect(head(sort(rules, by = "lift"), 20))

# Visualize the rules
plot(rules, method = "graph", engine = "htmlwidget")

