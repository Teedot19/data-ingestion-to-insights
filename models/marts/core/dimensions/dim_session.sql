

WITH raw_hits AS (
    SELECT *
    FROM {{ ref('int_ga_hits') }}
)

,
 ranked AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY user_id, session_id
      ORDER BY session_start_time ASC
    ) AS rn
  FROM raw_hits
),
b as (
    select
   session_id,
    user_id,
     session_start_time,
    source,
    medium,
    campaign,
    coalesce(is_true_direct,false)is_true_direct
FROM ranked
WHERE rn = 1
GROUP BY user_id, session_id, session_start_time, source, medium, campaign, is_true_direct)

select * from b