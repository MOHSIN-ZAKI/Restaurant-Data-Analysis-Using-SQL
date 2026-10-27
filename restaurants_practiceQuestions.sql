
USE swiggy;

-- =====================================================
-- BASIC SQL QUERIES
-- =====================================================

-- 1. Select all columns from the restaurant table.

SELECT * FROM restaurants;


-- 2. Display the names and cities of all restaurants.

SELECT name, city
FROM restaurants;


-- 3. Find all restaurants located in Bangalore.

SELECT *
FROM restaurants
WHERE city = 'Bangalore';


-- 4. List the names and ratings of restaurants with a rating greater than 4.0.

SELECT name, rating
FROM restaurants
WHERE rating > 4;


-- 5. Find restaurants where the cost is less than or equal to 300.

SELECT *
FROM restaurants
WHERE cost <= 300;


-- 6. Display all distinct cuisine types available in the dataset.

SELECT DISTINCT cuisine
FROM restaurants;


-- 7. Find all restaurants serving Biryani cuisine.

SELECT *
FROM restaurants
WHERE cuisine = 'Biryani';


-- 8. Show the top 5 restaurants with the highest ratings.

SELECT *
FROM restaurants
ORDER BY rating DESC
LIMIT 5;


-- 9. List restaurants with a rating count greater than 1000.

SELECT name
FROM restaurants
WHERE rating_count > 1000;


-- 10. Count the total number of restaurants in the dataset.

SELECT COUNT(*) AS total_restaurants
FROM restaurants;


-- 11. Find the average cost of all restaurants.

SELECT ROUND(AVG(cost), 2) AS average_cost
FROM restaurants;


-- 12. Display restaurant names and costs ordered by cost in ascending order.

SELECT name, cost
FROM restaurants
ORDER BY cost ASC;


-- =====================================================
-- AGGREGATION AND GROUPING
-- =====================================================

-- 13. Find the average rating of restaurants for each city.

SELECT city,
       ROUND(AVG(rating), 2) AS average_rating
FROM restaurants
GROUP BY city;


-- 14. Count the number of restaurants available in each city.

SELECT city,
       COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY city;


-- 15. Find the maximum and minimum cost of restaurants for each cuisine.

SELECT cuisine,
       MAX(cost) AS maximum_cost,
       MIN(cost) AS minimum_cost
FROM restaurants
GROUP BY cuisine;


-- 16. List cuisines that have more than 10 restaurants.

SELECT cuisine,
       COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY cuisine
HAVING COUNT(*) > 10;


-- 17. Find the top 3 cities with the highest number of restaurants.

SELECT city,
       COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 3;


-- 18. Display the average cost of restaurants for each cuisine.

SELECT cuisine,
       ROUND(AVG(cost), 2) AS average_cost
FROM restaurants
GROUP BY cuisine;


-- 19. Find cities where the average restaurant rating is greater than 4.0.

SELECT city,
       ROUND(AVG(rating), 2) AS average_rating
FROM restaurants
GROUP BY city
HAVING AVG(rating) > 4;


-- =====================================================
-- SUBQUERIES AND ADVANCED ANALYSIS
-- =====================================================

-- 20. List restaurants whose cost is higher than the average cost of all restaurants.

SELECT name, city, cost
FROM restaurants
WHERE cost > (
    SELECT AVG(cost)
    FROM restaurants
);


-- 21. Find the total number of ratings for each city, ranked from highest to lowest.

SELECT city,
       SUM(rating_count) AS total_ratings
FROM restaurants
GROUP BY city
ORDER BY total_ratings DESC;


-- 22. Display cuisines ordered by their average rating in descending order.

SELECT cuisine,
       ROUND(AVG(rating), 2) AS average_rating
FROM restaurants
GROUP BY cuisine
ORDER BY average_rating DESC;


-- 23. Find restaurants that have the highest rating within their city.

SELECT name, city, rating
FROM (
    SELECT name,
           city,
           rating,
           DENSE_RANK() OVER (
               PARTITION BY city
               ORDER BY rating DESC
           ) AS rnk
    FROM restaurants
) AS t
WHERE rnk = 1;


-- 24. List cities that have more than one distinct cuisine type available.

SELECT city,
       COUNT(DISTINCT cuisine) AS cuisine_count
FROM restaurants
GROUP BY city
HAVING COUNT(DISTINCT cuisine) > 1;


-- 25. Find the restaurant(s) with the maximum rating_count in the dataset.

SELECT name, rating_count
FROM restaurants
WHERE rating_count = (
    SELECT MAX(rating_count)
    FROM restaurants
);


-- =====================================================
-- BUSINESS INSIGHTS AND PERCENTAGE ANALYSIS
-- =====================================================

-- 26. Find the top 5 most represented cuisines.

SELECT cuisine,
       COUNT(*) AS total_restaurants
FROM restaurants
WHERE cuisine IS NOT NULL
GROUP BY cuisine
ORDER BY total_restaurants DESC
LIMIT 5;


-- 27. Calculate the percentage of restaurants in each city.

SELECT city,
       COUNT(*) AS total_restaurants,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM restaurants),
           2
       ) AS percentage
FROM restaurants
GROUP BY city
ORDER BY total_restaurants DESC;


-- 28. Calculate the percentage of restaurants rated above 4.0
--     and restaurants costing ₹300 or less.

SELECT
    COUNT(*) AS total_restaurants,

    SUM(CASE WHEN rating > 4 THEN 1 ELSE 0 END)
        AS highly_rated_restaurants,

    ROUND(
        SUM(CASE WHEN rating > 4 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS highly_rated_percentage,

    SUM(CASE WHEN cost <= 300 THEN 1 ELSE 0 END)
        AS affordable_restaurants,

    ROUND(
        SUM(CASE WHEN cost <= 300 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS affordable_percentage

FROM restaurants;
