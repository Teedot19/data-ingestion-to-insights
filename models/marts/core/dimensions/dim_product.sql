
    -- models/users_unique.sql
{{ config(
    materialized='table'  
) }}

WITH raw_hits AS (
    SELECT *
    FROM {{ ref('int_ga_hits') }}
)

SELECT
    UPPER(TRIM(PRODUCT_ID)) AS product_id,
    UPPER(TRIM(REPLACE(PRODUCT_NAME, '&quot;', '"'))) AS product_name,
    MAX(product_category) AS product_category
FROM raw_hits
GROUP BY product_id, product_name

