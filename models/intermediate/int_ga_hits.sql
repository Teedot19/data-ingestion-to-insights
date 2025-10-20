{{ config(
    materialized='table'
) }}

    select
       *
    from {{ ref('stg_ga_hits') }}
