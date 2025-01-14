# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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
