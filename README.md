# **💻 Turning Data into Dollars 💰: Strategic Insights to Boost Sales, Profitability, and Efficiency**

## **Introduction**
Welcome to the **Turning Data into Dollars** project repository—where raw data transforms into actionable insights that drive business growth, profitability, and operational efficiency!

In today’s fast-paced business environment, data is more than just numbers; it’s the key to unlocking sustainable success. This project goes beyond surface-level analytics to deliver a comprehensive, multi-dimensional performance analysis using diagnostic, predictive, and prescriptive approaches. **The goal**? To empower businesses with insights that fuel smart, strategic decision-making and ensure long-term growth.

By leveraging cutting-edge analytical techniques, this project uncovers hidden patterns, identifies critical performance drivers, and reveals actionable opportunities to optimize sales, profitability, and operational efficiency. But this isn’t just about numbers—it’s about telling a story that guides the business forward with clarity and confidence.


🔍 R codes for this project? Check them out here: [Project_codes](https://github.com/olumidebalogun1/Strategic-Insights-to-Boost-Sales-Profitability-and-Efficiency/blob/main/2.%20Project_%20Codes/1.%20Project_Complete%20Code/Strategic%20Insights%20to%20Boost%20Sales%2C%20Profitability%2C%20and%20Efficiency.R)


## **The Business Challenge – Why This Project Matters.**: 
The company behind this analysis is experiencing significant **growth**—sales, profits, and order volumes are all on the rise, signalling a robust and expanding business. However, beneath this impressive upward trajectory lies a **fragmented performance landscape** that presents both **hidden risks** and **untapped opportunities**. Leadership has observed significant **inconsistencies and inefficiencies** across multiple dimensions. Key metrics such as **profit margins, sales volumes**, and **customer retention rates** vary widely by **year, region, product category**, and **customer segment**. This variability indicates that while overall revenue is increasing, the growth is not **uniform** or **sustainable** across all areas of the business.

These discrepancies suggest that some segments are **outperforming** while others are **underperforming**, leading to a **misalignment in resource allocation** and **strategic focus. In essence, the company's success is diluted by internal inefficiencies—ranging from **pricing** and **operational challenges** to **inconsistent customer engagement**—which, if left unaddressed, could hinder long-term **stability** and **profitability**.

To secure **sustainable, long-term success**, the company recognized the need for a **comprehensive, data-driven approach** to address these inconsistencies. This project was initiated with a clear objective: to **empower the business with actionable insights** that optimize **revenue** and **efficiency**. By systematically exploring historical trends, analysing **key performance indicators (KPIs)**, and leveraging **predictive models**, the analysis reveals both **growth opportunities** and **operational bottlenecks**.


## **The Action Plan**
The foundation of this project is a comprehensive, multi-dimensional performance analysis designed to:

-  Segment performance across years, regions, product categories, and customer types.
-  Identify key revenue and profit drivers.
-  Uncover operational inefficiencies and misaligned strategies.
-  Deliver clear, actionable recommendations to address pressing business challenges.

By breaking down the data into digestible insights, this analysis provides stakeholders with the intelligence needed to make informed, confident decisions that drive measurable improvements

### **❓ Key Business Questions**
The primary questions I sought to answer through my **R script** were:
1.	Were there any years that experienced **negative** or **stagnant growth**? Moreover, are there significant differences within the data?
2.	How do **sales** and **profit performance** vary across different **segments** within each **region**?
3.	How do **sales** and **profit performance** vary across different **product categories** within each region?
4.	How do **sales** and **profit performance** vary across different **sub-categories**?
5.	Can a distinct **upward** or **downward trend** in sales performance be identified over time?
6.	How do the variables **correlate** with each other, and what is the **strength** and **direction** of these relationships?
7.	What are the **key drivers** that significantly contribute to **sales performance** and **profitability**?
8.	What are the **predicted sales trends** for the next **36 months**, and how can these insights be leveraged to drive **favourable business decisions**?
9.	Which **customers** account for **80% of the business’s total sales**?
10.	Which **products** contribute to **80% of the business’s total sales**?
11.	Which **customer segments**, based on **clustering**, contribute the most to overall **sales** and **quantity**?
12.	What are the most common **patterns** and **associations** in customer purchases (e.g., frequently bought items together)?


## **Tools I Used**
This analysis was powered by a suite of tools and techniques, including:
-  **R Programming Language**: The backbone of my analysis, empowering me to clean and format data, conduct advanced analyses and modeling, create visualizations, and uncover critical insights. I relied on libraries such as dplyr, ggplot2, readr, lubridate, forecast, randomForest, psych, …
-  **Tableau**: A powerful data visualization tool I utilized to create interactive and dynamic dashboards, enabling stakeholders to explore sales trends effortlessly, monitor key performance indicators (KPIs), and evaluate geographic performance with clarity and precision.
-  **PowerPoint**: Essential for presenting complex findings, insights, and recommendations in a visually engaging and easily understandable way for stakeholders and decision-makers.
-  **R Programming Language**: Vital for version control, sharing R scripts, and facilitating seamless collaboration and project tracking throughout the analysis process.


## **Data Preparation and Cleanup**
This section details the data preparation steps undertaken to ensure its accuracy and readiness for analysis.

### **Import, Load & Clean Up Data**
I begin by importing the necessary libraries and loading the dataset, then proceed with initial data cleaning to ensure its accuracy and consistency.

### **Data Importation**
![#1  Importing Data   Joining Tables](https://github.com/user-attachments/assets/6eef5c19-f8de-4428-870f-02fbd1ecb02a)
![#1 1 Importing Data   Joining Tables](https://github.com/user-attachments/assets/2241df28-bffb-4d3b-87b3-337d2656ebe6)

### **🧹Data Cleaning**
![#2  Data Clearning   Formating](https://github.com/user-attachments/assets/fea9de96-23a3-4bb6-b48b-1cb431df3b39)


## **📈 The Analysis**
Each piece of code in this project was designed for a **comprehensive analysis**, leveraging **sales data from 2020 to 2023** to **identify patterns, uncover trends, explore customer behaviour**, and reveal the **key factors driving sales and profitability**. The goal is to **optimize business strategies, allocate resources effectively**, and enhance **decision-making related to products, inventory, and pricing**.

By enabling **data-driven decision-making**, this analysis aims to **maximize sales, increase profitability, improve customer satisfaction, enhance operational efficiency, and uncover investment opportunities for long-term success**.

Here’s how I approached each **business challenge**:

## **1. Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth**
### **I.	Project Overview** 
**💡 Business Challenge**: The company seeks to understand the financial patterns driving its performance over time. While overall revenue, sales volume, and profit may show an upward trend, leadership needs to identify years of negative or stagnant growth and determine if variations in key metrics are statistically or practically significant. This insight is critical to uncovering hidden risks and opportunities.

**🎯 Project Goal**: This project aims to conduct a yearly breakdown of sales, quantities, profits, and percentage growth to detect trends, periods of underperformance, or stagnation. The insights gained will support strategic decisions to improve revenue, profit margins, and overall business stability.

### **II. Key Business Question** 
**🔍 Business Question**: 
Were there any years that experienced negative or stagnant growth? Moreover, are there significant differences within the data that might indicate potential areas for corrective action?

**🛠️ Approach**:
-  Write R Script to calculate year-over-year (YoY) percentage changes in revenue, sales volume, and profit.
-  Identify years of negative or stagnant growth and analyze the extent of such occurrences.
-  Pinpoint problem areas and periods of underperformance for further investigation.
-  Create a visualization to illustrate the trends.
-  Provide actionable, data-driven recommendations to mitigate risks and optimize business performance.

![1  Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth](https://github.com/user-attachments/assets/4e170950-d252-4b95-b33e-d79dbe998624)
![1 1 Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth](https://github.com/user-attachments/assets/8e3efa85-01bf-4941-aa90-c53a5c0a28ae)

![1  Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth](https://github.com/user-attachments/assets/c1024bdd-ae31-4d7e-9a04-cfda5e892050)

### **Insights**:
-   **2023: A Year of Exceptional Growth**
In 2023, remarkable growth underscored effective scaling fueled by heightened demand, expanded market reach, and successful marketing or distribution strategies. This year emerged as the standout performer, achieving **total sales of $767.37 million and a total profit of $98.08 million**.
-	**2021: Mixed Performance Amid Challenges** 
Despite a slight decline in sales **($0.02 million)**, 2021 saw an increase in both profit and quantity sold. The **dip in sales could be attributed to factors such as intensified competition, supply chain disruptions, or decreased demand**.


## **2. Total Sales and Profit by Segment for Each Region**
### **I. Project Overview** 
**💡 Business Challenge**: 
The company wants to understand how sales and profit performances vary across different segments within each region. By identifying patterns, trends, and discrepancies, leadership can uncover opportunities for improvement, highlight high-performing segments and regions, and address potential inefficiencies.

**🎯 Project Goal**: This project aims to evaluate sales and profit performance across various segments within different regions. The insights gained will support strategic decisions to optimize sales efforts, improve profitability, and guide targeted business growth initiatives.

### **II. Key Business Question** 
**🔍 Business Question**:
How do sales and profit performances vary across different segments within each region.

**🛠️ Approach**:
-  Write R Script to calculate sales and profit metrics for each segment within each region.
-  Identify high-performing segments and regions, as well as those with underperformance or significant discrepancies.
-  Perform statistical significance tests to assess variations in key metrics.
-  Create visualizations to clearly illustrate regional and segment-based trends.
-  Provide actionable, data-driven recommendations to capitalize on strengths and address inefficiencies, supporting regional and segment-level strategic decision-making.
  
![2  Analysis of Sales and Profit Performance by Segment Across Regions](https://github.com/user-attachments/assets/4979cd02-da42-45c6-aac5-99f577ed83d3)
![2 1 Analysis of Sales and Profit Performance by Segment Across Regions](https://github.com/user-attachments/assets/59d39ddf-98ac-42b0-9e74-5dcb3fb244d2)
![2 2 Analysis of Sales and Profit Performance by Segment Across Regions](https://github.com/user-attachments/assets/9d215842-7b10-4377-a1d1-75d7bfa11814)

### **2a. Total Sales by Segment for Each Region**:
![2a  Total Sales by Segment for Each Region](https://github.com/user-attachments/assets/bce78a68-c034-467c-96e3-6bebc963f11f)

### **Hypothesis**: 
There are significant differences in sales by segment across regions, suggesting that segments and regions vary substantially in their sales performance. From a **business perspective**, this provides strong evidence that **sales strategies differ considerably between segments and regions.**

### **Insights**:
-	The **West is the top-performing region**, achieving **Total Sales of $778.3 million**, while the **South lags** with approximately **$411.2 million** in Sales. Additionally, the **Consumer Segment excels** with Total Sales of  approx. **$1.22 million**, whereas **Home Office**  is the least performing category, **totaling $451.3 thousand** in Sales. **In all, Consumer from the West is the most performing with Total Sales of $392.4 thousand**.

### **2b.  Total Profit by Segment for Each Region**:
![2b  Total Profit by Segment for Each Region](https://github.com/user-attachments/assets/f5679a5c-66f9-4738-af4d-628f80546a8e)

### **Hypothesis**:
 There are significant differences in profit by segment across regions, suggesting that segments and regions vary substantially in their sales performance. From a **business perspective**, this provides strong evidence that **profit strategies differ considerably between segments and regions**.

### **Insights**:
-	The **West is the top-performing region**, achieving **Total Profit of $117.7 thousand**, while the **Central lags** with approximately **$40.5 thousand** in Profit. Additionally, **the Consumer Segment excels** with Total Profit of **$141.9 thousand**, whereas **Home Office** is the least performing category, **totaling $64.0 thousand** in  profit. **In all, Consumer from the West is the most performing with Total Profit of $62.8 thousand**.


## **3. Total Sales and Profit by Category for Each Region**:
### **I. Project Overview**
**💡 Business Challenge**: The company wants to understand how sales and profit performances vary across different product categories within each region. By identifying key trends, variations, and underperforming categories or regions, leadership can uncover opportunities for improvement, highlight high-performing categories and regions, and address potential inefficiencies.

**🎯 Project Goal**: This project aims to evaluate sales and profit performance across various product categories within different regions. The insights gained will support strategic decisions to optimize sales efforts, improve profitability, and guide targeted business growth initiatives.

### **II. Key Business Question**
**🔍 Business Question**: How do sales and profit performances vary across different product categories within each region?

**🛠️ Approach**:
-  Write R Script to calculate sales and profit metrics for each product category within each region.
-  Identify high-performing product categories and regions, as well as those with underperformance or significant discrepancies.
-  Perform statistical significance tests to assess variations in key metrics.
-  Create visualizations to clearly illustrate regional and category-based trends.
-  Provide actionable, data-driven recommendations to capitalize on strengths and address inefficiencies, supporting regional and category-level strategic decision-making.

![3  Sales and Profit Performance Analysis by Category Across Regions ](https://github.com/user-attachments/assets/9ff4e918-01b1-46ff-a9aa-6b49538dec1d)
![3 1 Sales and Profit Performance Analysis by Category Across Regions ](https://github.com/user-attachments/assets/dcbbd75c-8406-4b68-9d15-da337df5d6f1)

### **3a. Total Sales by Category for Each Region**:
![3a  Total Sales by  Category for Each Region](https://github.com/user-attachments/assets/635553d6-c514-493f-9607-059c340373f8)

### **Hypothesis**: 
There are significant differences in sales by category across regions, suggesting that categories and regions vary substantially in their sales performance. From a **business perspective**, this provides strong evidence that **sales strategies differ considerably between categories and regions**.

### **Insights**:
-	The **West is the top-performing region**, achieving **Total Sales of $778.3 million**, while the **South lags** with approximately **$411.2 million in Sales**. Additionally, the **Technology Category excels** with Total Sales of **$896.8 thousand**, whereas **Office Supplies** is the least performing category, **totaling $737.7 thousand** in Sales. **In all, Technology from the West is the most performing with Total Sales of $285.3 thousand**

### **3b.  Total Profit by Category for Each Region**:
![3b  Total Profit by  Category for Each Region](https://github.com/user-attachments/assets/fa0a186c-64d5-47f4-a257-de348891e251)

### **Hypothesis**:
 Profit varies significantly by category across regions, indicating substantial differences in profit performance. From a **business perspective**, this provides strong evidence that **profit strategies differ considerably between categories and regions**.

### **Insights**:
-	The **West is the top-performing region**, achieving **Total Profit of $117.7 thousand**, while the **Central lags** with approximately **$40.5 thousand in profit**. Additionally, the **Technology Category excels** with Total Profit of **$153.8 thousand**, whereas **Office Supplies** is the least performing category, **totaling $20.3thousand** in  Profit. **In all, Office Supplies  from the West is the most performing with Total Profit of $55.3 thousand**.


## **4. Total Sales and Profit by Sub-Category**:
### **I. Project Overview**
💡 Business Challenge:
The company seeks to understand how sales and profit performances vary across different sub-categories. By identifying high-performing and underperforming sub-categories, leadership can uncover opportunities to refine product strategies, optimize inventory management, adjust pricing, and make data-driven investment decisions.

**🎯 Project Goal**:
This project aims to evaluate sales and profit performance across various sub-categories. The insights gained will support strategic decision-making, helping to enhance product offerings, improve profitability, and drive business growth through informed resource allocation and targeted optimizations.

### **II. Key Business Question**
**🔍 Business Question**:
How do sales and profit performances vary across different sub-categories?

**🛠️ Approach**:
-  Write R Script to calculate sales and profit metrics for each sub-category.
-  Identify high-performing and underperforming sub-categories, as well as significant trends and discrepancies.
-  Perform statistical significance tests to assess variations in key metrics.
-  Create visualizations to clearly illustrate sub-category performance trends.
-  Provide actionable, data-driven recommendations to refine product strategies, optimize inventory and pricing, and highlight areas for improvement or investment opportunities.

![4  Sales and Profit Performance Analysis by Sub-Category](https://github.com/user-attachments/assets/7c60ed86-5249-4ed5-abb0-a7f35e658732)
![4 1 Sales and Profit Performance Analysis by Sub-Category](https://github.com/user-attachments/assets/9e4bc547-4bca-409c-8fab-b2c95efb570a)

### **4a. Total Sales by Sub-Category**:
![4a  Bar plot of Total Sales by Sub-Category](https://github.com/user-attachments/assets/43e9a547-9369-47a0-9f8c-5bbef2a52eb3)

### **Hypothesis**:
 Sales show significant variation across sub-categories, reflecting substantial differences in performance. From a **business perspective**, this strongly suggests that **sales strategies vary significantly across sub-categories**.

### **Insights**:
-	**Phones and Chairs** led the sub-categories in revenue generation, contributing **$357.8K and $333K, respectively**. Meanwhile, **Storage, Binders, Tables, Machines, and Accessories** also exhibit strong and promising revenue potential. In contrast, **Art ($27.5K in sales), Envelopes ($18.5K in sales), Labels ($12.5K in sales), and Fasteners ($3.0K in sales) rank as the underperforming sub-categories**.

### **4b.  Total Profit by Sub-Category**:
![4b  Bar plot of Total Profit by Sub-Category](https://github.com/user-attachments/assets/23567a19-15bc-4b55-a94d-aba577d05ec9)

### **Hypothesis**: 
Profit exhibits notable variation across sub-categories, highlighting substantial differences in performance. This indicates that **profit strategies differ significantly across these sub-categories** from a **business perspective**.

### **Insights**:
-	**Copiers, Accessories, and Phones** are the top three most profitable sub-categories, with **Copiers** generating **$56K** in profit, **Accessories $48.6K**, and **Phones $47K**. Additionally, **Paper, Binders, and Chairs** demonstrate strong profit potential. However, **Bookcases and Tables are underperforming**, with both **generating negative profit**.


## **5. Total Monthly Sales: Cyclical Patterns and Month-over-Month Sales Comparison**
### **I. Project Overview**
**💡 Business Challenge**:
The company seeks to determine whether a distinct upward or downward trend in sales performance can be identified over time. By analyzing long-term trends, leadership can assess whether the business is experiencing growth or decline and evaluate the sustainability of its sales stream. Detecting early warning signs of potential decline will enable proactive strategies to optimize future performance and guide business direction effectively.

**🎯 Project Goal**:
This project aims to analyze total monthly sales data to identify distinct trends, cyclical patterns, and month-over-month variations. The insights gained will support strategic decisions that enhance business sustainability, drive growth, and mitigate potential risks associated with declining sales performance.

### **II. Key Business Question**
**🔍 Business Question**:
Can a distinct upward or downward trend in sales performance be identified over time?

**🛠️ Approach**:
-  Write R Script to calculate total monthly sales metrics and analyze performance over time.
-  Identify long-term trends and cyclical patterns to determine whether sales are increasing, stable, or declining.
-  Conduct statistical analyses to detect significant upward or downward trends.
-  Create visualizations to illustrate month-over-month and year-over-year sales performance.
-  Provide actionable, data-driven recommendations to optimize future performance, address declining trends, and ensure the sustainability of the sales stream.

![5  Analyzing Sales Performance Trends Over Time](https://github.com/user-attachments/assets/f1f1adfb-4621-4b6b-930f-b6dabf65aa0c)
![5 1 Analyzing Sales Performance Trends Over Time](https://github.com/user-attachments/assets/8a42c1f3-f494-40ba-98d2-d9d69d7b8837)
![5 2 Analyzing Sales Performance Trends Over Time](https://github.com/user-attachments/assets/8e699d9d-daff-438c-86d8-f0d62e0119e4)

![5a  Monthly Sales Cyclical Patterns](https://github.com/user-attachments/assets/b29a2fea-861a-4056-9248-97e452387c70)
### **Monthly Sales Trends**
![5b  Time Series Analysis of Overall Sales Performance and Trends](https://github.com/user-attachments/assets/da1a737e-0fac-47c0-83a4-f098fc98dbb8)

### **Hypothesis**: 
The p-values indicate statistically significant differences in monthly and yearly sales performance. This demonstrates that sales trends vary substantially throughout the year, and these variations are driven by a variety of factors.

### **Insights**:
-	**CYCLICAL PATTERNS**: **December, November, and Septembe**r emerged as **the top-performing months**, with **March and October** also showing **strong sales results**. In contrast, **January and February** were the **lowest-performing months**.
-	**MONTH-OVER-MONTH**: Although **overall growth has been flat**, **2023 **data show **improved sales performance** with higher highs and higher lows. The **average sales have consistently exceeded $50,000**, reflecting a positive upward trend.


## **6.  Correlation among Sales, Profit, Quantity, and Discount**
### **I. Project Overview**
**💡 Business Challenge**:
The company wants to explore and quantify the relationships between key variables such as sales, profit, quantity, and discount. By assessing the strength and direction of these correlations, leadership can uncover valuable insights into how these factors interact and influence one another. This will enable the company to optimize pricing strategies, inventory management, and overall sales performance.

**🎯 Project Goal**:
This project aims to evaluate the correlation among sales, profit, quantity, and discount variables. The insights gained will provide a deeper understanding of the relationships between these key factors, helping to inform strategic decisions that optimize business operations, pricing strategies, and profitability.

### **II. Key Business Question**
**🔍 Business Question**:
How do the variables (sales, profit, quantity, and discount) correlate with each other, and what is the strength and direction of these relationships?

**🛠️ Approach**:
-  Write R Script to calculate the correlation coefficients between sales, profit, quantity, and discount.
-  Assess the strength and direction of each relationship to determine how variables interact with each other.
-  Perform significance testing to validate the correlations and apply confidence intervals for more robust insights.
-  Create a visualizations to clearly illustrate the correlations and their implications for business operations.
-  Provide actionable, data-driven recommendations to optimize pricing, inventory management, and sales strategies based on the identified relationships between key variables.

![6  Exploratory Analysis and Statistical Correlation with Significance Testing](https://github.com/user-attachments/assets/b03616b7-0e79-4f37-9a66-8794064873cf)
![6 1 Exploratory Analysis and Statistical Correlation with Significance Testing](https://github.com/user-attachments/assets/849a3d05-aef1-4831-b45f-4f572262d896)

![6  Correlation Matrix with corrplot](https://github.com/user-attachments/assets/4ade1c32-a109-4daa-a60f-4ca7182e90d7)
### **Insights**
-	**Sales and Profit** show the **strongest and significant positive relationship (r = 0.48)**. Drive sales to boost profits.
-	**Discount and Profit** have a weak but significant **negative relationship (r = -0.22)**, indicating that **excessive discounts might reduce profitability**. **Discount strategies need to be re-evaluated**. 
-	The relationship between **Quantity and Discount** is not significant, suggesting **discounts do not strongly influence the number of items sold**. **Focus on Increasing Quantity Sold Strategically**.

## **7.  Key Drivers of Sales Performance and Profitability**
### **I. Project Overview**
**💡 Business Challenge**: The company seeks to identify the key factors that significantly influence sales performance and profitability. Understanding these drivers will enable leadership to optimize business strategies, improve decision-making, and allocate resources more effectively. By analysing various factors such as pricing, discounting, product categories, customer segments, and regional performance, the company can refine its approach to maximize revenue and profit.

**🎯 Project Goal**: This project aims to uncover the key drivers of sales performance and profitability by leveraging feature importance analysis and regression modelling. The insights gained will help businesses optimize pricing strategies, improve product offerings, enhance marketing efforts, and drive overall profitability.

### **II. Key Business Question**
**🔍 Business Question**: 
What are the key drivers that significantly contribute to sales performance and profitability?

**🛠️ Approach**:
-	Write R Script to analyse sales and profit data across multiple factors (e.g., pricing, discounting, product categories, customer segments, and regions).
-	Use regression analysis and feature importance techniques to identify the most influential variables impacting sales and profitability.
-	Assess the statistical significance of each factor to ensure reliable insights.
-	Create visualizations to illustrate key drivers and their impact on sales performance.
-	Provide actionable, data-driven recommendations to optimize business strategies, enhance profitability, and improve overall sales performance

![7  Identifying Key Drivers of Sales Performance and Profitability](https://github.com/user-attachments/assets/9785cfbd-c09b-4839-8d08-50ad22550fb6)

### **Key Drivers of Sales**
![7a  Key Sales Performance Drivers](https://github.com/user-attachments/assets/1ca6f515-ab99-4beb-8d14-db0de5f96315)

### **Key Drivers of Profitability**
![7b  Key Drivers of Profitability](https://github.com/user-attachments/assets/228f088f-b17c-4f64-8f1a-990becb46219)
### **Insights from Feature Importance and Regression Analysis**:
**Sales Performance Drivers**: **Profit, specific subcategories (such as Copiers, Machines, and Tables), and Quantity** are the main drivers of Sales. While **Discount** also has a **positive effect** on Sales, it’s **important to be cautious, as excessive discounts could negatively impact profitability**.

**Profit Performance Drivers**: **Sales, Discount, and key subcategories like Binders, Bookcases, Chairs, and Copiers drive Profit**. While **Discounts positively impact Profit**, **excessive discounting** could **reduce profitability**. Quantity negatively affects Profit, suggesting that **higher sales volumes may come with lower margins or increased costs**, like production or shipping. 


## **8.  Projection of sales for the next thirty-six months – using the ARIMA model**
### **I. Project Overview**
**💡 Business Challenge**: The company wants to predict sales trends for the next 36 months to support strategic planning and decision-making. By leveraging time series forecasting, leadership can anticipate future sales performance, identify potential growth opportunities, and mitigate risks. Accurate forecasting enables better resource allocation, pricing optimization, and marketing strategy development, ensuring sustainable business growth.

**🎯 Project Goal**: This project aims to forecast sales trends for the next 36 months using the ARIMA model. The insights gained will help businesses make data-driven decisions in areas such as pricing, marketing, inventory management, and resource allocation, ultimately improving financial performance and long-term business sustainability.

### **II. Key Business Question**
**🔍 Business Question**: 
What are the predicted sales trends for the next 36 months, and how can these insights be leveraged to drive favourable business decisions?

**🛠️ Approach**:
-  Write R Script to preprocess historical sales data and apply time series forecasting techniques.
-  Utilize the ARIMA model to generate accurate sales projections for the next 36 months.
-  Create a visualization to illustrate projected sales trends and potential seasonal patterns.
-	 Provide actionable, data-driven recommendations to optimize pricing, marketing, and resource allocation based on forecasted sales trends.
 
![8  Predicting Future Sales Trends with Time Series Analysis](https://github.com/user-attachments/assets/d4bbc802-ad1b-4442-a93b-c500ec8d429c)

![8  Sales Trend Forecast using ARIMA Model](https://github.com/user-attachments/assets/ce322607-28d4-406e-8fe1-ce4b346ebe17)
### **Insights**:
-	Sales are expected to consistently grow from **2024 to 2026**, with monthly increases. For instance, **January sales rise from 47.56** in 2024 to **63.59** in 2026, and **December sales** increase from **109.28 to 125.31**. Seasonal peaks are evident, particularly in **September and November,** where **September 2024 starts at 103.11 and grows to 119.15** by 2026. Overall, the forecast shows steady growth with some seasonal spikes, indicating a strong year-on-year upward trend.

**Business Actionable Insight**:
The company should plan for higher demand during **peak months (e.g., September, November)** and adjust inventory and production. They should also investigate the factors driving seasonal sales increases to optimize operations.


## **9.  Top Customers and Products Driving 80% of Total Sales**
### **I. Project Overview**
**💡 Business Challenge**: The company wants to identify the top customers that drive 80% of total sales. Understanding which customers contribute the most revenue allows leadership to develop targeted engagement strategies, optimize resource allocation, and enhance customer retention efforts. This insight will help maximize revenue and sustain long-term business growth.

**🎯 Project Goal**: This project aims to analyse sales data to determine the key customers that contribute significantly (80%) to total sales. The findings will enable the business to implement data-driven marketing, customer relationship management, and inventory optimization strategies, ultimately improving profitability and customer satisfaction.

### **II. Key Business Question**
**🔍 Business Question**: 
Which customers account for 80% of the business’s total sales?

**🛠️ Approach**:
-	 Write an R Script to calculate cumulative sales contributions for customers.
-	 Apply the Pareto Principle (80/20 rule) to identify high-value customers.
-	 Create a visualization—Pareto chart to highlight the key contributors to revenue. 
-	 Provide actionable recommendations for customer retention, targeted marketing, and inventory management strategies based on the findings.

![9  Identifying Top Customers Driving 80% of Total Sales](https://github.com/user-attachments/assets/f917132a-f03d-4680-826b-ace31f35b5aa)
![9 1 Identifying Top Customers Driving 80% of Total Sales](https://github.com/user-attachments/assets/eefb18d0-59c5-453c-8ee4-22d5c62c22f2)
  
![9  Top 10 Customers Who Make Up 80% of Total Sales](https://github.com/user-attachments/assets/5db34ae9-19b7-4d14-8a2e-d4e67e92c053)

Note: The chart above displays only the top 10 customers among the 392 customers driving 80% of total sales.

### **Insights**:
-	Out of **793** total customers, **392 customers contribute to 80%** of the total sales, meaning approximately **49.4%** of the customers account for 80% of the sales.
**The top 10 customers within this group of 392 driving 80% of the total sales are: Sean Miller, Tamara Chand, Greg Tran, and others**.

**Business Actionable Insight**: The **392 customers driving 80%** of total sales are the core revenue generators. **Prioritizing these customers with targeted relationship management, personalized marketing, and optimized service can strengthen loyalty and drive further growth**. For customers outside this top 80%, alternative strategies like promotions, upselling, or outreach campaigns could help boost their engagement and sales contribution
  

## **10. Top Products Driving 80% of Total Sales**
### **I. Project Overview** 
**💡 Business Challenge**: The company wants to identify the top products that contribute to 80% of total sales. Understanding which products generate the most revenue enables leadership to refine marketing strategies, optimize inventory management, and improve supply chain efficiency. By focusing on these high-value products, the business can drive sustainable growth and maximize profitability.

**🎯 Project Goal**: This project aims to analyse sales data to determine the key products responsible for 80% of total sales. The findings will help the business optimize resource allocation, improve demand forecasting, and implement targeted sales strategies that enhance revenue generation and customer satisfaction.

### **II. Key Business Question** 
🔍 Business Question: Which products contribute to 80% of the business’s total sales?

**🛠️ Approach**:
-	 Write R Script to calculate the cumulative sales contribution of each product.
-	 Apply the Pareto Principle (80/20 rule) to identify top-performing products.
-	 Create a visualization—Pareto chart to highlight the most impactful products.
-	 Provide actionable recommendations for optimizing inventory management, marketing efforts, and sales strategies to maximize profitability.

![10  Identifying Top Products Driving 80% of Total Sales ](https://github.com/user-attachments/assets/c62f8af0-6474-4aae-a885-6066bfcfac6d)
![10 1 Identifying Top Products Driving 80% of Total Sales ](https://github.com/user-attachments/assets/a04beb4d-2979-4e52-bda0-87a2efe44cf9)

![10  Top 10 Products Who Make Up 80% of Total Sales](https://github.com/user-attachments/assets/df5f7651-effc-46ff-95ca-218b21ac7b23)

Note: The chart above displays only the top 10 products among the 422 products driving 80% of total sales

### **Insights**:
-	Out of **1,894** products, **422 products contribute to 80%** of the total sales, meaning approximately **22.3%** of the products account for 80% of the sales.

**Business Actionable Insight**: The **422 products driving 80%** of total sales are the core revenue generators. **Prioritizing these products with targeted relationship management, personalized marketing, and optimized service can strengthen loyalty and drive further growth**.
Products outside this top 80% may represent lower-priority opportunities for growth or could benefit from alternative strategies aimed at increasing their contributions, such as promotions, upselling, or outreach campaigns to boost engagement and spending.


## **11.  Customer Segmentation and Clustering**
### **I. Project Overview**
**💡 Business Challenge**:
The company wants to identify distinct customer segments that contribute the most to overall sales and quantity. By leveraging clustering techniques, leadership can gain deeper insights into purchasing behaviors, optimize resource allocation, and refine customer engagement strategies. Understanding these segments will help in personalizing marketing efforts and improving profitability.

**🎯 Project Goal**:
This project aims to segment customers based on sales and purchase quantity patterns, using clustering techniques to identify high-value segments. The insights gained will enable data-driven decision-making to optimize marketing campaigns, improve customer retention, and maximize sales performance.

### **II. Key Business Question**
**🔍 Business Question**:
Which customer segments, based on clustering, contribute the most to overall sales and quantity?

**🛠️ Approach**:
-  Use clustering techniques (e.g., K-means, hierarchical clustering) to segment customers based on sales and quantity data.
-  Identify key customer segments that generate the highest sales and order volumes.
-  Analyze customer characteristics within each segment to uncover trends and behavioral patterns.
-  Create a visualization to illustrate the segmentation and its impact on sales.
-  Provide actionable recommendations to optimize marketing, pricing, and customer engagement strategies for high-value segments.

![11  Customer Segmentation and Clustering for Sales and Quantity Analysis](https://github.com/user-attachments/assets/0572468b-0bea-437d-81a5-16298c89767e)

![11  Clustering Model for Customer Segmentation](https://github.com/user-attachments/assets/890ee7f8-8c4c-4663-ac53-5afa4244ea40)

### **Insights**:
Three distinct customer clusters are identified:
-	**1st Cluster (blue)**: Low sales quantity and low sales, representing **occasional or low-spending customers**.
-	**2nd Cluster (green)**: Moderate sales quantity and sales, indicating **middle-tier customers with more frequent purchases and moderate spending**.
-	**3rd Cluster (pink)**: High sales quantity and high sales, representing the **most valuable, high-loyalty customers contributing most of the revenue and sales volume**.
  
**Top three Customers**:
-	**Sean Miller** leads with **$25.07K** in sales and **0.05K units** sold
-	**Tamara Chand** follows with **$19.11K** in sales and **0.05K units** sold. 
-	**Greg Tran** ranks third with **$15.98K** in sales and **0.12K units** sold.


## **12.  Market Basket Analysis: Uncovering Customer Purchase Patterns**
### **I. Project Overview**
**💡 Business Challenge**:
The company seeks to identify the most common patterns and associations in customer purchases. By uncovering frequently bought items together, leadership can optimize product placement, improve promotional strategies, and refine sales tactics. Understanding these purchase relationships will help drive more effective cross-selling and up-selling initiatives, ultimately enhancing customer satisfaction and boosting revenue.

**🎯 Project Goal**:
This project aims to conduct market basket analysis to uncover hidden patterns in customer purchasing behaviors. The insights gained will enable businesses to refine sales strategies, enhance product recommendations, and make data-driven decisions to increase revenue, customer satisfaction, and operational efficiency.

### **II. Key Business Question**
🔍 Business Question:
What are the most common patterns and associations in customer purchases (e.g., frequently bought items together)?

**🛠️ Approach**:
-  Use market basket analysis techniques (e.g., association rule mining, Apriori algorithm) to identify frequently purchased items together.
-  Calculate metrics such as support, confidence, and lift to quantify the strength of item associations.
-  Create a visualization to illustrate product relationships and highlight high-value associations.
-  Provide actionable insights to enhance product placement, cross-sell opportunities, and targeted promotions.
-  Offer recommendations for refining sales strategies, improving customer satisfaction, and maximizing revenue through effective product bundling and marketing.

![12  Market Basket Analysis](https://github.com/user-attachments/assets/58d91cbd-e5d0-4167-921a-dd28d7fade41)

![12  Market Basket Analysis - Uncovering (Top 20) Customer Purchase Patterns](https://github.com/user-attachments/assets/576aa0cd-f6d1-46b0-ac5d-55878835be58)

Note: The print out above displays only the top 20 Customer Purchase Patterns for Strategic Sales Optimization

### **Insights**:
**Strong Associations**:
Certain products demonstrate strong pairwise associations with 100% confidence, indicating they are always purchased together. Examples include:
•	Aastra 6757i CT Wireless VoIP Phone and Samsung Galaxy Note 2.
•	Memorex Blu-Ray Recordable Discs and Maxell DVD-RW.
•	Eldon Desk Accessories and Howard Miller Wall Clocks.

These patterns highlight complementary relationships between these items.

**Mutual Dependencies**:
Several product pairs exhibit bidirectional dependencies, where purchasing one item guarantees the purchase of the other **(e.g., Samsung Galaxy Note 2 and Aastra VoIP Phone)**. Such relationships can be effectively utilized for reciprocal product recommendations.


## **Actionable Insights, Key Expected Results and Estimated Business Impact**
### **1.	Yearly Breakdown of Sales, Quantities, Profits, and Percentage Growth**

**Action Plan**: Investigate the drivers behind the exceptional growth in 2023 to replicate success. Address challenges from 2021 (e.g., supply chain or competition) by optimizing operations and revising strategies to sustain profitability and sales growth.

**Expected Impact**: 
-	**Revenue Growth**: 10-15% annual improvement by replicating successful strategies from 2023.                   
-	**Profitability**: 8-10% increase in profit margins by addressing operational inefficiencies.                     
- **Operational Stabilit**y: 15% reduction in disruptions from supply chain or competitive challenges

### **2.  Sales and Profit by Segment for Each Region**

**Action Plan**: Leverage insights into high-performing regions and segments:
-	**West & Consumer Segment**: Enhance marketing strategies and allocate resources to sustain leadership.
-	**South Region & Home Office Segmen**t: Reevaluate strategies to uplift sales and profit in these areas. Consider targeted promotions and improved service offerings.

**Expected Impact**: 
-	 **Regional Sales Growth**: **12-18% increase** in South region sales through targeted interventions
-	**Profitability**: **10% rise** in overall regional profit margins.
-	**Segment Leadership**: **15% growth** in Consumer segment sales across all regions

### **3.  Sales and Profit by Category for Each Region**

**Action Plan**: Focus on investments in:
-	Technology Category for maximizing sales and profitability.
-	Address performance gaps in Office Supplies by reviewing pricing and inventory management.

**Expected Impact**: 
-	**Category Revenue Growth**: **20% increase** in Technology category sales through focused strategies.
-	**Profitability**: **12-15% boost** in margins for Office Supplies by optimizing pricing and reducing costs.
-	**Market Share**: **5% gain** in target regions
 
### **4.  Sales and Profit by Sub-Category**

**Action Plan**: Prioritize high-performing sub-categories like Phones, Chairs, and Copiers. Optimize pricing and inventory for underperforming sub-categories such as Art, Labels, and Tables to boost their contribution.

**Expected Impact**: 
-	**Sub-Category Growth**: **25% revenue boost** 
-	**Profitability**: **10% rise** in profit margins.
-	**Inventory Optimization**: **15% reduction** in costs from better stock management of slow-moving items.

### **5.  Total Monthly Sales**: Cyclical Patterns and Trends
    
**Action Plan**: Prepare for peak months (e.g., September, November) by adjusting inventory and staffing. Develop strategies to address low-performing months (January, February) with targeted campaigns and promotions.

**Expected Impact**: 
-	**Revenue Growth**: **18-22% sales increase** during peak months and 10% increase during off - peak months. 
-	**Operational Efficienc**y: **15% improvement** in inventory turnover during peak and off-peak months.
 
### **6.  Correlation between Sales, Profit, Quantity, and Discount**

**Action Plan**: Boost profitability by increasing sales, optimizing discount strategies for long-term gains, and adopting volume-based approaches to enhance margins and reduce costs

**Expected Impact**: 
-	**Revenue Growth**: **12-15% increase** by optimizing discount structures to boost sales. 
-	**Profitability**: **10% margin improvemen**t through controlled discount strategies.
-	**Sales Volume**: **8% increase** in quantity sold through strategic sales campaigns.

### **7.  Key Drivers of Sales and Profitability**

**Action Plan**: Focus on profit, quantity, and key sub-categories like copiers and machines by optimizing discount strategies, maintaining margins, and enhancing operational efficiencies to manage high-volume costs.

**Expected Impact**: 
-	**Sales Growth**: **20% improvement** by focusing on high-performing sub-categories (e.g., Copiers, Machines).
-	**Profitability**: **10% margin increase** through refined discounting strategies.
-	**Operational Cost Efficiency**: **15% cost reduction** through optimized high-volume sales processes.

### **8.  Sales Projection for the Next 36 Month**

**Action Plan**: Prepare for consistent sales growth by scaling inventory and marketing during peak months and allocating resources to sustain forecasted upward trends.

**Expected Impact**: 
-	**Revenue Growth**: **20-25% **year-over-year increase through 2026.
-	**Profitability**: **10% rise** in profit margins due to better seasonal planning.
-	**Market Shar**e: **8% increase** driven by alignment with projected demand trends.

### **9.  Top Customers Driving 80% of Sales**

**Action Plan**: Enhance customer engagement by creating loyalty programs and personalized marketing for top customers while designing campaigns to increase contributions from lower-tier customers.

**Expected Impact**: 
-	**Customer Retention**: **25% increase** in repeat business from the top 392 customers.
-	**Revenue Growth**: **10% uplift** from targeted campaigns for non-core customers.
-	**Customer Loyalty**: **20% improvement** through personalized engagement strategies.

### **10.  Top Products Driving 80% of Sales**

**Action Plan**: Focus on high-value products with targeted marketing and inventory planning while improving low-performing products' contributions through bundling, discounts, or promotions.

**Expected Impact**: 
-	**Revenue Growth**: **15% increase** from prioritized high-value products.
-	**Profitability**: **12% margin improvemen**t through optimized product mix.
-	**Market Share**: **5% rise** in targeted categories driven by high-performing products. 

### **11.   Customer Segments Based on Clustering**

**Action Plan**: Retain high-value customers with exclusive offers, encourage increased spending from moderate-tier customers, and attract low-spending customers with affordable products or promotions to boost loyalty and frequency.

**Expected Impact**: 
-	**Customer Retention**: **30% improvement** among high-loyalty customers (Cluster 3).
-	**Sales Volume**: **20% increase** from moderate-tier customers (Cluster 2).
-	**Revenue Growth**: **15% uplift** from strategies targeting occasional buyers (Cluster 1).

### **12.   Market Basket Analysis: Customer Purchase Patterns**

**Action Plan**: Focus Leverage product pairings for cross-selling and upselling by creating bundled offers for frequently purchased items.

**Expected Impact**: 
-	**Revenue Growth**: **12-18% increase** through cross-selling and bundling strategies.
-	**Customer Satisfaction**: **20% improvement** from personalized product recommendations.
-	**Profitability**: **10% margin boost** by leveraging complementary product pairings.


## **What I Learned**
-	**Data cleaning and preparation** are critical for robust analysis.
-	**Machine learning models** can uncover trends and drivers that traditional methods might miss.
-	**Visualizations** are essential to bridge the gap between technical analysis and decision-making.
-	**Customer segmentation and market basket analysis** provide deep insights for personalized strategies.


## **Conclusion**
 By combining descriptive, diagnostic, predictive, and prescriptive analytics, this project delivered actionable insights. With strategic implementation of these findings, businesses can: 
- Achieve **15-20% revenue growth**. 
- Enhance **profit margins by 10%**. 
- Improve customer engagement and operational efficiency.


## **Closing Thought**
"**Data has the power to reshape the future**." This project is a testament to the impact of combining data analytics with business strategy. Whether you're exploring new market opportunities, refining your product offerings, or optimizing operations.

**Ready to explore the dashboards? Check out the** [Tableau Dashboard]( https://public.tableau.com/app/profile/olumide.balogun1/viz/SmithRobbinsSuperstore-SalesPerformanceDashboards/SalesDashbord) for dynamic visualizations.

Feel free to explore, share, and connect! Let's transform data into decisions that drive measurable impact.

### **Connect with Me**
- **📞 +234-8065060691**
- **📧 Email: Olumide Balogun**
- **🔗 LinkedIn**: [Connect with me on LinkedIn](https://www.linkedin.com/in/olumide-balogun1/)
- **🔗 Medium**: [Explore my Data Storytelling articles](https://medium.com/@Olumide-Balogun)

