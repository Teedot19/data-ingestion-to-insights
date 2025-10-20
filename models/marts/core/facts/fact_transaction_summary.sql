with hits as (
    select *,
           TO_DATE(TO_VARCHAR(date), 'YYYYMMDD') AS event_date
    from {{ ref('int_ga_hits') }}
),


products_json AS (
    SELECT
        session_id,
        user_id,
        transactionid,
        ARRAY_AGG(distinct product_name) AS product_names
    FROM hits
    WHERE transactionid IS NOT NULL
    GROUP BY session_id, user_id, transactionid
),
b as (

SELECT
    s.session_id,
    u.user_id,
    h.transactionid,
    h.event_date,
    h.country,
    h.source,
    h.campaign,
    round(MAX(h.transaction_revenue_actual),2) AS transaction_revenue_actual,
    SUM(h.product_quantity) AS total_quantity,
    p.product_names AS product_names
FROM hits h
left join {{ ref('dim_date') }} d
    on h.event_date = d.date
left join {{ ref('dim_user') }} u
    on h.user_id = u.user_id
left join {{ ref('dim_session') }} s
    on h.session_id = s.session_id
LEFT JOIN products_json p
    ON h.transactionid = p.transactionid
WHERE h.transactionid IS NOT NULL
GROUP BY all
ORDER BY s.session_id, h.transactionid)

select * from b