with hits as (
    select *,TO_DATE(TO_VARCHAR(date), 'YYYYMMDD') AS event_date
    from {{ ref('int_ga_hits') }}
),

b as (
SELECT
    s.session_id,
    h.user_id,
    d.date AS event_date,
     TO_VARCHAR(h.session_start_time, 'HH24:MI:SS') AS event_time,
    h.devicecategory,
    h.source,
    h.medium,
    h.campaign,
    h.country,
    h.session_pageviews AS session_pvs,
    h.session_hits AS session_hits
from hits h
left join {{ ref('dim_date') }} d
    on h.event_date = d.date
left join {{ ref('dim_user') }} u
    on h.user_id = u.user_id
left join {{ ref('dim_session') }} s
    on h.session_id = s.session_id

group by
   all
order by s.session_id)

    select * from b
group by all