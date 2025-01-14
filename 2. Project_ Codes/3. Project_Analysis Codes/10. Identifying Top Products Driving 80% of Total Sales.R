# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

# ================================================================================

#####  10.  Identifying Top Products Driving 80% of Total Sales  #####

# --------------------------------------------------------------------------------
#  TASK/QUESTION: Which products contribute to 80% of the business’s total sales?

#  PURPOSE: To  that contribute 80% of total sales. By focusing on these high-value
#           products, businesses can optimize engagement strategies, allocate
#           marketing resources more effectively, and develop retention plans 
#           that drive growth, maximize revenue, and support long-term success.
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

