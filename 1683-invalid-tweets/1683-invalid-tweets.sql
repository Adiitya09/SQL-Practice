# Write your MySQL query statement below

with invalid as (
    select tweet_id, char_length(content) as content 
    from Tweets 
)
select tweet_id from invalid where content >15;