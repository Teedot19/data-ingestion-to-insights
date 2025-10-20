-- models/dim_date.sql
{{ config(
    materialized='table'
) }}

WITH date_source AS (
    SELECT DISTINCT
        TO_DATE(TO_VARCHAR(date), 'YYYYMMDD') AS date
        -- If your number is like 20251017, this converts it to a proper DATE
    FROM {{ ref('int_ga_hits') }}
)

SELECT
    date,
    DAY(date) AS day,
    MONTH(date) AS month,
    QUARTER(date) AS quarter,
    YEAR(date) AS year,
    DAYNAME(date) AS day_name,
    WEEK(date) AS week_of_year,
    CASE WHEN DAYOFWEEK(date) IN (1,7) THEN 1 ELSE 0 END AS is_weekend
FROM date_source
ORDER BY date