# ---------------------------------------------------------------------------------

# Script Title: "Turning Data to Dollars: Strategic Insights to Drive Sales, Boost Profitability, and Improve Efficiency.
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

