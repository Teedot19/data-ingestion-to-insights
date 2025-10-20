
    -- models/users_unique.sql
{{ config(
    materialized='table'  
) }}

WITH raw_hits AS (
    SELECT *
    FROM {{ ref('int_ga_hits') }}
)

SELECT
    user_id,
    MIN(country) AS country,
    MIN(subcontinent) AS subcontinent,
    MIN(continent) AS continent,
    MIN(devicecategory) AS devicecategory
FROM raw_hits
GROUP BY user_id