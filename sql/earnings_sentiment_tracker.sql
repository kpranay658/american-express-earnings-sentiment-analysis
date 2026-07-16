1] Which quarter had the highest negative sentiment?
SELECT quarter, negative, dominant_topic
FROM quarterly_summary
ORDER BY negative DESC
LIMIT 1;

2] What was the overall sentiment trend across all quarters?
SELECT quarter, positive, negative, neutral, sentiment_label
FROM quarterly_summary
ORDER BY quarter;

3] Which quarters had negative sentiment AND what topics dominated then?
SELECT qs.quarter, qs.negative, qs.sentiment_label,
       td.topic_label, COUNT(td.topic_label) AS topic_mentions
FROM quarterly_summary qs
JOIN topic_distribution td ON qs.quarter = td.quarter
WHERE qs.negative > 0.04
GROUP BY qs.quarter, qs.negative, qs.sentiment_label, td.topic_label
ORDER BY qs.negative DESC, topic_mentions DESC;

4] What was the average positive sentiment in 2022 vs 2023?
SELECT 
    CASE WHEN quarter LIKE '2022%' THEN '2022' ELSE '2023' END AS year,
    ROUND(AVG(positive)::numeric, 3) AS avg_positive,
    ROUND(AVG(negative)::numeric, 3) AS avg_negative
FROM quarterly_summary
GROUP BY CASE WHEN quarter LIKE '2022%' THEN '2022' ELSE '2023' END
ORDER BY year;


5] Which quarter had the biggest stock price jump?
SELECT quarter, stock_change_pct, sentiment_label, dominant_topic
FROM quarterly_summary
ORDER BY stock_change_pct DESC
LIMIT 1;

6] When did sentiment and stock price move in the same direction?
SELECT quarter, positive, stock_change_pct,
CASE WHEN positive > 0.4 AND stock_change_pct > 0 THEN 'Both Positive'
     WHEN positive < 0.4 AND stock_change_pct < 0 THEN 'Both Negative'
     ELSE 'Diverged'
END AS alignment
FROM quarterly_summary
ORDER BY quarter;

7] Which topics appeared most during positive sentiment quarters?
SELECT qs.quarter, qs.sentiment_label, qs.positive,
       td.topic_label, COUNT(td.topic_label) AS mentions
FROM quarterly_summary qs
JOIN topic_distribution td ON qs.quarter = td.quarter
WHERE qs.sentiment_label = 'Positive'
GROUP BY qs.quarter, qs.sentiment_label, qs.positive, td.topic_label
ORDER BY mentions DESC;

8] How many sentences per quarter were classified under each topic?
SELECT quarter, topic_label, COUNT(*) AS sentence_count
FROM topic_distribution
GROUP BY quarter, topic_label
ORDER BY quarter, sentence_count DESC;


9] Which quarters had above average positive sentiment and how did their stock perform?
WITH avg_sentiment AS (
    SELECT AVG(positive) AS avg_positive
    FROM quarterly_summary
),
above_average_quarters AS (
    SELECT qs.quarter, qs.positive, qs.stock_change_pct, 
           qs.sentiment_label, qs.dominant_topic
    FROM quarterly_summary qs, avg_sentiment
    WHERE qs.positive > avg_sentiment.avg_positive
)
SELECT aaq.quarter, aaq.positive, aaq.stock_change_pct,
       aaq.dominant_topic, td.topic_label,
       COUNT(td.topic_label) AS topic_mentions
FROM above_average_quarters aaq
JOIN topic_distribution td ON aaq.quarter = td.quarter
GROUP BY aaq.quarter, aaq.positive, aaq.stock_change_pct, 
         aaq.dominant_topic, td.topic_label
ORDER BY aaq.positive DESC, topic_mentions DESC;

10] Full executive summary — all key metrics in one view?
SELECT quarter, sentiment_label, dominant_topic, positive, negative,
       ROUND("Close"::numeric, 2) AS stock_price,
       stock_change_pct
FROM quarterly_summary
ORDER BY quarter;
