# Turning Raw Clicks into Actionable Insights

I recently managed an end-to-end analytics engineering project for Google Analytics event data, taking it from ingestion to insight.

## Workflow

### Ingestion
Pulled data using Airbyte into Snowflake, with incremental syncs for efficiency.

### Transformation
Cleaned and structured data in dbt, creating staging and mart layers for metrics like engagement rate, funnel drop-offs, and session value.  
Added dbt tests to validate data quality, checking for duplicates, null values, and consistency across sessions and users.

### Visualization
Built Tableau dashboards to track user behavior, campaign performance, and conversion paths.

## Key Learnings
- High-click campaigns weren’t always converting — landing pages needed optimization.  
- Engagement dropped sharply after a specific interaction, revealing friction points.  
- A small segment of users drove high-value sessions, showing potential for personalized targeting.

## Next Steps / Future Enhancements
- Add event-level anomaly detection to proactively flag unusual traffic or drop-offs.  
- Track multi-touch attribution to better understand campaign contributions.  
- Expand product-level insights to include revenue per product variant or category over time.

## Summary
As a data analyst with analytics engineering experience, this project reinforced that **clean, well-structured data**, combined with **automated tests**, enables teams to trust their metrics and turn data into actionable business decisions.
