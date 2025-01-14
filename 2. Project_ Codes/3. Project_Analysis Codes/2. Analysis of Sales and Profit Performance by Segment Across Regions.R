# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

# ========================================================================================= 

#######   2. Analysis of Sales and Profit Performance by Segment Across Regions   #######

# -----------------------------------------------------------------------------------------
#  TASK/QUESTION: How do sales and profit performance vary across 
#                 different segments within each region?

#  PURPOSE: To evaluate the performance of sales and profit across
#           various segments within different regions.
#           By identifying patterns, trends, and discrepancies,
#           the analysis aims to uncover opportunities for improvement,
#           highlight high-performing segments and regions,
#           and provide actionable insights to guide strategic decision-making.  
# -----------------------------------------------------------------------------------------

# loading necessary libraries
library(forcats)      # for reordering factors
library(ggsci)

# Representing Million as M and Thousand as K
df_sales <- sales_data %>% 
  mutate(Sales_K = round(Sales / 1e3, 2)) %>% 
  mutate(Profit_K = round(Profit / 1e3, 2)) %>% 
  mutate(Quantity_K = round(Quantity / 1e3, 3))

view(df_sales)

# ----- 2a. Total Sales by Segment for Each Region  -----
# Grouping by Region
df_sales_S_R <- df_sales %>% 
  group_by( Segment, Region) %>% 
  summarise(Regional_Sales = sum(Sales_K))
view(df_sales_S_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_sales_S_R$Region <- fct_reorder(df_sales_S_R$Region, df_sales_S_R$Regional_Sales, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Sales by Segment Across Each Region  -----
ggplot(df_sales_S_R, aes(x = reorder(Segment, -Regional_Sales), y = Regional_Sales, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Sales, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.2, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Sales by Segment for Each Region", 
       x = "Region", 
       y = " Total Sales ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# ----- Kruskal-Wallis test  -----
# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_sales_2 <- df %>%
  mutate(Region_Segment = interaction(Region, Segment))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Sales ~ Region_Segment, data = data_sales_2)
print(kruskal_test)

# ----- 2b. Total Profit by Segment for Each Region  -----
# Grouping by Region
df_profit_S_R <- df_sales %>% 
  group_by( Segment, Region) %>% 
  summarise(Regional_Profit = sum(Profit_K))
view(df_profit_S_R)

# Reordering the 'fill_group' in descending order based on the sum of 'value'
df_profit_S_R$Region <- fct_reorder(df_profit_S_R$Region, df_profit_S_R$Regional_Profit, .fun = sum, .desc = TRUE)

# ----- Bar Plot of Profit by Segment Across Each Region  -----
ggplot(df_profit_S_R, aes(x = reorder(Segment, -Regional_Profit), y = Regional_Profit, fill = Region)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(round(Regional_Profit, 1), "k")), 
            position = position_dodge(width = 0.9), 
            vjust = -0.2, size = 3, fontface = "bold") +       # Adjusting the size and position of the text and making it bold
  labs(title = "Total Profit by Segment for Each Region", 
       x = "Region", 
       y = " Total Profit ($ thousand)",
       fill= "Region") +
  theme_classic2() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(legend.position = "top") +
  theme_pubr() +
  scale_fill_npg()+
  facet_wrap(~ Region )

# ----- Kruskal-Wallis test  -----
# Creating a new variable combining Region and Category for Kruskal-Wallis test
data_profit_2 <- df %>%
  mutate(Region_Segment = interaction(Region, Segment))

# Kruskal-Wallis test for Sales by combined Region and Category
kruskal_test <- kruskal.test(Profit ~ Region_Segment, data = data_profit_2)
print(kruskal_test)

