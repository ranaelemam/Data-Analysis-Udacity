SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;
SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

SELECT MIN(occurred_at) 
FROM orders;
SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;
SELECT MAX(occurred_at)
FROM web_events;
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
