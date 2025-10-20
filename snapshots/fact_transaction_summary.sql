{% snapshot fact_transaction_summary_snapshot %}

{{ config(
    target_schema='snapshots',
    unique_key='transactionid',
    strategy='check',
    check_cols=[
        'session_id',
        'user_id',
        'country',
        'source',
        'campaign',
        'transaction_revenue_actual',
        'total_quantity',
        'product_names'
    ]
) }}

SELECT *
FROM {{ ref('fact_transaction_summary') }}

{% endsnapshot %}
