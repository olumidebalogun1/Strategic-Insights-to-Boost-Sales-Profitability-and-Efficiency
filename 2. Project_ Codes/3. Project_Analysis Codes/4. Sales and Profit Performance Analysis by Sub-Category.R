# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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

