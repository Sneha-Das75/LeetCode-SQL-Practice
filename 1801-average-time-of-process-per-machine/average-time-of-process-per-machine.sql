# Write your MySQL query statement below
WITH cte AS (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
)
select machine_id, round(avg(end_time-start_time),3) as processing_time from cte group by machine_id;