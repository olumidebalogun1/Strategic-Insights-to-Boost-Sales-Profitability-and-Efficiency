# ---- Note ----
# This is an Integrated (interdependent) code.
# The code is designed to function in coordination with other
# components, modules, or systems to fulfill its specified purpose.
# It relies on external elements, such as libraries, databases,
# or other parts of a code/script, for proper execution.

# ====================================================================================

#######  12. Market Basket Analysis: Uncovering Customer Purchase Patterns for Strategic Sales Optimization  #######

# -------------------------------------------------------------------------------------
#  TASK/QUESTION: What are the most common patterns and associations in 
#                 customer purchases (e.g. frequently bought items together)?

#  PURPOSE: To  uncover hidden relationships and patterns in customer purchases
#           using market basket analysis. By understanding which products are 
#           often bought together, businesses can optimize sales strategies, 
#           improve product recommendations, enhance promotions, and
#           make data-driven decisions to maximize revenue, improve customer 
#           satisfaction, and increase operational efficiency.
# -------------------------------------------------------------------------------------

# loading necessary library
library(arules)
library(arulesViz)

# Convert the sales data into transactions
transactions <- as(split(sales_data$Product_Name, sales_data$Customer_Name), "transactions")

# Generate association rules
rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))

# View the top rules
inspect(head(sort(rules, by = "lift"), 20))

# Visualize the rules
plot(rules, method = "graph", engine = "htmlwidget")

