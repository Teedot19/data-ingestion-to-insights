# Turning Raw Clicks into Actionable Insights 🚀

This project showcases an **end-to-end analytics engineering workflow** for Google Analytics event data, transforming raw clickstream data into actionable business insights.

---

## Tech Stack
| Layer | Tool |
|-------|-----------------|
| Data Ingestion | Airbyte |
| Data Warehouse | Snowflake |
| Transformation | dbt (Data Build Tool) |
| Data Quality | dbt tests (duplicates, nulls, consistency) |
| Visualization | Tableau |

---

## Project Overview
I managed a full-stack analytics pipeline, covering **data ingestion, transformation, and visualization**, with the goal of understanding user behavior, optimizing campaigns, and uncovering actionable insights.

---

## Project DAG (Data Lineage Flow)


Below is the full **dbt project DAG (Directed Acyclic Graph)**, illustrating how raw event data flows through each transformation layer:

- ✅ **Source Tables** (green nodes)  
  Represent raw data ingested from Google Analytics into Snowflake. This is the single source of truth for all events.

- ✅ **Staging Models**  
  Clean, standardize, and prepare the raw data for downstream transformations. Includes validation for duplicates, nulls, and consistency.

- ✅ **Dimension and Fact Models**  
  Capture key business entities (dimensions) and metrics (facts), such as users, sessions, engagement, and conversions.

- ✅ **Aggregate Models**  
  Summarize metrics and KPIs to support efficient **Tableau dashboards** and analytics reporting.

**Summary:**  
The DAG reflects a **classic ETL workflow**: raw ingestion → clean staging → facts and dimensions → aggregates. This structure ensures reliable metrics, traceable transformations, and actionable insights for stakeholders.


## dbt Project DAG <img width="1420" height="861" alt="dbt-dag (1)" src="https://github.com/user-attachments/assets/296b0e3a-defa-4e75-9c31-dfbe155014db" />


---

## Workflow

### 1. Data Ingestion
- Pulled raw event data from Google Analytics using **Airbyte**.  
- Loaded data into **Snowflake** with **incremental syncs** for efficiency and scalability.

### 2. Data Transformation
- Processed and structured data in **dbt**, building **staging** and **mart layers** for key metrics such as engagement rate, funnel drop-offs, and session value.  
- Implemented **dbt tests** to ensure data quality, checking for duplicates, null values, and consistency across sessions and users.

### 3. Data Visualization
- Developed interactive **Tableau dashboards** to track user behavior, monitor campaign performance, and analyze conversion paths.  
- Enabled stakeholders to explore insights dynamically, supporting data-driven decision-making.
- 👉 [View the Published Tableau Dashboards](https://public.tableau.com/views/MarketingPerformance_17609641897590/WebTraffic?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Key Insights
- High-click campaigns didn’t always convert — indicating landing page optimization opportunities.  
- Engagement dropped sharply after specific interactions, highlighting friction points in the user journey.  
- A small segment of users contributed disproportionately to high-value sessions, presenting opportunities for **personalized targeting**.

---

## Next Steps / Future Enhancements
- Implement **event-level anomaly detection** to proactively flag unusual traffic patterns or drop-offs.  
- Track **multi-touch attribution** to better understand campaign contributions across the user journey.  
- Expand product-level insights to include **revenue per product variant or category over time**, supporting deeper business strategy.

---

## Takeaways
This project reinforced the importance of **clean, well-structured data** and **automated testing** in analytics engineering. By building a reliable data pipeline, teams can **trust metrics**, uncover actionable insights, and make **data-driven business decisions** with confidence.

---

## 📈 Outcome
The project successfully transformed raw clickstream data into a trusted analytics workflow, providing actionable insights for campaign optimization, user behavior analysis, and strategic decision-making.
