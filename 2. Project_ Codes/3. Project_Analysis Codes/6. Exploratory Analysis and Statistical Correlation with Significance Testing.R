# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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

