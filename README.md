🍽️ Swiggy Restaurant Data Analysis Using SQL

Tools: MySQL | SQL | Data Analysis  
Dataset: 61,425 Restaurant Records | 534 City Labels | 107 Cuisine Categories  
SQL Queries: 25

📌 Project Overview

Analyzed 61,425 Swiggy restaurant records using SQL to identify restaurant distribution, popular cuisines, pricing trends, customer ratings, and business opportunities.

Applied SQL concepts including `GROUP BY`, `HAVING`, aggregate functions, subqueries, and `DENSE_RANK()` window functions.

📊 Key Business Insights

| Metric                              | Finding          |
|-------------------------------------|------------------|
| Total Restaurant Records            | 61,425           |
| City with Most Restaurants          | Bangalore (6,580)|
| Most Common Cuisine                 | North Indian     |
| Average Restaurant Cost             | ₹297.64          |
| Median Restaurant Cost              | ₹250             |
| Average Restaurant Rating           | 3.89 / 5         |
| Restaurants Rated Above 4.0         | 40.3%            |
| Restaurants Costing ₹300 or Less    | 73.1%            |
| Highest Total Rating Count          | Hyderabad        |

🌆 Top 5 Cities by Restaurant Count

| Rank | City        | Restaurants |
|------|-------------|-------------|
| 1    | Bangalore   | 6,580       |
| 2    | Chennai     | 4,849       |
| 3    | Delhi       | 4,592       |
| 4    | Hyderabad   | 4,489       |
| 5    | Pune        | 3,765       |

🍜 Top 5 Cuisine Categories

| Rank | Cuisine       | Restaurants |
|------|---------------|-------------|
| 1    | North Indian  | 10,485      |
| 2    | Chinese       | 6,465       |
| 3    | Indian        | 5,789       |
| 4    | Biryani       | 4,637       |
| 5    | South Indian  | 4,387       |

💡 Business Findings

- Market Distribution: Bangalore has the highest restaurant representation, accounting for 10.7% of the dataset.
- Cuisine Trends: North Indian and Chinese are the most represented cuisines, indicating substantial competition.
- Pricing: Approximately 73% of restaurants have listed costs of ₹300 or less.
- Customer Ratings: 40.3% of restaurants have ratings above 4.0.
- Rating Activity: Hyderabad leads in total recorded rating counts, despite having fewer restaurants than Bangalore.

🧹 Data Quality Findings

| Issue                    | Finding                    |
|--------------------------|----------------------------|
| Missing Cuisine Values   | 4 records                  |
| Geographic Inconsistency | City and locality mixing   |
| Potential Cost Outliers  | Minimum cost ₹1            |
| Rating Count Precision   | Only 7 distinct values     |

🛠️ SQL Skills Demonstrated

`SELECT` • `WHERE` • `GROUP BY` • `HAVING` • `ORDER BY` • `COUNT()` • `AVG()` • `SUM()` • `DISTINCT` • Subqueries • `DENSE_RANK()` • Window Functions

🎯 Conclusion

The analysis reveals that **Bangalore leads in restaurant availability, North Indian cuisine dominates listings, and affordable restaurants represent the majority of records**. Hyderabad shows the highest cumulative rating activity.

These findings provide insights into restaurant supply, pricing, and customer rating patterns while highlighting the importance of data quality in business analysis.

---

Project Type: SQL Data Analysis | Database: MySQL | Focus: Restaurant Market Insights
