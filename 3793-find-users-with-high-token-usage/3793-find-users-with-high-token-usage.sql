# Write your MySQL query statement below
SELECT user_id,
       COUNT(prompt) AS prompt_count,
       ROUND(AVG(tokens), 2) AS avg_tokens
FROM prompts p
GROUP BY user_id
HAVING COUNT(prompt) > 2
   AND MAX(tokens) > (
       SELECT AVG(tokens)
       FROM prompts
       WHERE user_id = p.user_id
   )
ORDER BY avg_tokens DESC;