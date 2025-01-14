# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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

