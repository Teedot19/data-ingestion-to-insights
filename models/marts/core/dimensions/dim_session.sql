

WITH raw_hits AS (
    SELECT *
    FROM {{ ref('int_ga_hits') }}
)

SELECT
   session_id,
    user_id,
     min(session_start_time) as session_start_time,
    source,
    medium,
    campaign,
    coalesce(is_true_direct,false)is_true_direct
FROM raw_hits
GROUP BY user_id, session_id, session_start_time, source, medium, campaign, is_true_direct