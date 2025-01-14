# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

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

