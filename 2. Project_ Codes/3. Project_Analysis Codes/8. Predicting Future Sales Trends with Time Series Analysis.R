# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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

