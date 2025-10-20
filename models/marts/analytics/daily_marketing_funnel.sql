with hits as (
    select *,
           TO_DATE(TO_VARCHAR(date), 'YYYYMMDD') AS event_date
    from {{ ref('int_ga_hits') }}
),
b AS (
    SELECT
        user_id,
        session_id,
        session_start_time,
        hitnumber,
        hit_type,
        hit_timestamp,
        event_date,
        devicecategory,
        event_action_type,
        CASE
            WHEN event_action_type = 1 THEN 'Click through of product lists'
            WHEN event_action_type = 2 THEN 'Product detail views'
            WHEN event_action_type = 3 THEN 'Add product(s) to cart'
            WHEN event_action_type = 4 THEN 'Remove product(s) from cart'
            WHEN event_action_type = 5 THEN 'Check out'
            WHEN event_action_type = 6 THEN 'Completed purchase'
            WHEN event_action_type = 7 THEN 'Refund of purchase'
            WHEN event_action_type = 8 THEN 'Checkout options'
            ELSE 'Unknown'
        END AS event_action_type_label
    FROM hits
    WHERE event_action_type > 0 AND event_action_type != 4
    GROUP BY ALL
    ),
funnel AS (
    SELECT
        event_date,
        event_action_type,
        event_action_type_label,
        devicecategory,
        COUNT(DISTINCT session_id) AS event_count
    FROM b
    GROUP BY event_date, event_action_type, event_action_type_label,devicecategory
)
SELECT
    event_date,
    devicecategory,
    event_action_type,
    event_action_type_label,
    event_count
FROM funnel
ORDER BY event_date, event_action_type
