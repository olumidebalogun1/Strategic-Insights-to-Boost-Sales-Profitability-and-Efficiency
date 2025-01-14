# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

# ========================================================================================= 

#######   5. Analyzing Sales Performance Trends Over Time  #######

# --------------------------------------------------------------------------------------------
#  TASK/QUESTION: Can a distinct upward or downward trend in sales performance
#                 be identified over time?

#  PURPOSE: To examine sales performance over time in order to identify
#           long-term trends, assess whether the business is experiencing
#           growth or decline, and evaluate the sustainability of its sales stream.
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

