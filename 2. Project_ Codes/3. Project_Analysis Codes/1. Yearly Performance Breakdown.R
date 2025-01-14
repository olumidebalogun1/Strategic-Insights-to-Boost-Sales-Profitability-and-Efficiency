# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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