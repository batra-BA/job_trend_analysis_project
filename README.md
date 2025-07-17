# Introduction

📊 Welcome to the Business Analyst Job Market Explorer! In this project, we dive deep into the landscape of **remote business analyst roles**, uncovering:

* 💰 Top-paying jobs
* 🛠️ Essential and lucrative skills
* 📈 High-demand and high-salary overlaps for strategic skill-building

🔍 Curious about the SQL powering this analysis? Browse the queries here: [project\_sql folder](/project_sql/)

# Background

Inspired by a desire to navigate the **business analyst job market** with data-driven precision, this project aims to spotlight the skills and roles that matter most. Whether you're upskilling or job hunting, the goal is to help identify the most valuable career moves.

The dataset was sourced from [Luke Barousse's SQL Course](https://lukebarousse.com/sql) and includes detailed job postings, salaries, company names, and skill requirements.

### Key Questions This Project Answers:

1. 💸 What are the top-paying business analyst jobs?
2. 🧠 What skills are needed for those high-paying roles?
3. 🔥 What are the most in-demand skills?
4. 💼 Which skills correlate with higher salaries?
5. 🚀 What are the most optimal skills to learn (high demand + high pay)?

# Tools I Used

* **SQL** for querying and analysis
* **PostgreSQL** as the database management system
* **Visual Studio Code** for SQL development
* **Git & GitHub** for version control and collaboration

# The Analysis

## 1. Top Paying Business Analyst Jobs

Using SQL, we queried remote jobs with specified salaries to find the **top-paying business analyst roles**:

```sql
SELECT job_id, job_title, job_location, salary_year_avg, name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Business Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### 💰 Top 5 Results:

* **Lead Business Intelligence Engineer** at **Noom** — 🤑 \$220,000
* **Manager II, Applied Science** at **Uber** — 💼 \$214,500
* **Senior Economy Designer** at **Harnham** — 💸 \$190,000
* **Staff Revenue Operations Analyst** at **Gladly** — 💵 \$170,500
* **BI Analyst (Leadership Role)** at **CyberCoders** — 📊 \$162,500

👉 These roles reflect the **earning potential** of specialized and leadership positions in business analytics.

## 2. Skills Required for Top Paying Jobs

To see what skills were listed in these high-paying roles, we joined the top job results with their associated skills.

```sql
-- SQL omitted for brevity; uses a CTE to filter top jobs and join on skills
```

### 📌 Top Skills in High-Paying Jobs:

| Skill   | Frequency |
| ------- | --------- |
| SQL     | ✅         |
| Python  | ✅         |
| Excel   | ✅         |
| Tableau | ✅         |
| Looker  | ✅         |
| Chef    | ✅         |

These skills appear across multiple roles and point to a trend: **Data querying, analytics tools, and BI platforms** are key!

## 3. Most In-Demand Skills for Business Analysts

We counted the number of postings each skill appeared in for remote business analyst roles.

```sql
SELECT skills, COUNT(*) AS demand_count
FROM ...
WHERE job_title_short = 'Business Analyst' AND job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

### 🔥 Most Demanded Skills:

| Skill    | Demand Count |
| -------- | ------------ |
| SQL      | 1266         |
| Excel    | 983          |
| Tableau  | 728          |
| Power BI | 555          |
| Python   | 546          |

These results show that **foundational tools** like SQL and Excel are non-negotiable, while **BI & programming** tools are highly advantageous.

## 4. Skills with Highest Average Salaries

To determine which skills correlate with higher salaries, we calculated the average salary per skill:

```sql
SELECT skills, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM ...
WHERE job_title_short = 'Business Analyst' AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
```

### 🧠 Top Paying Skills:

| Skill     | Avg Salary (\$) |
| --------- | --------------: |
| Chef      |         220,000 |
| Phoenix   |         135,990 |
| Looker    |         130,400 |
| MongoDB   |         120,000 |
| Python    |         116,516 |
| BigQuery  |         115,833 |
| GCP       |         115,833 |
| R         |         114,629 |
| Snowflake |         114,500 |
| DB2       |         114,500 |

🚨 **Specialized data engineering and analytics tools** (Chef, Phoenix, Looker) are associated with the highest salaries.

## 5. Most Optimal Skills (High Demand + High Salary)

To find skills that strike the best balance between **demand and high compensation**, we filtered for those that are both popular and well-paid:

```sql
SELECT skills_dim.skill_id, skills_dim.skills, COUNT(*) AS demand_count, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM ...
WHERE job_title_short = 'Business Analyst' AND job_work_from_home = True
GROUP BY skills_dim.skill_id
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;
```

### 🎯 Most Optimal Skills to Learn:

| Skill    | Demand | Avg Salary (\$) |
| -------- | ------ | --------------: |
| Python   | 20     |         116,516 |
| Tableau  | 27     |         104,233 |
| SQL      | 42     |          99,120 |
| Excel    | 31     |          94,132 |
| Power BI | 12     |          90,448 |

✅ These skills offer the best ROI in terms of **job availability and salary potential**.

# What I Learned

This project helped reinforce core SQL concepts and sharpen analytical thinking. Key takeaways:

* 🔄 **CTEs & Joins** for complex filtering
* 📉 **GROUP BY + Aggregates** to summarize demand and salary
* 🎯 Real-world decision-making through SQL logic

# Conclusions

### Strategic Insights for Business Analysts

1. **Top-paying roles** are often in leadership or engineering-heavy business intelligence roles.
2. **SQL, Python, and Tableau** are essential across both high pay and high demand.
3. **Emerging tools** like Looker, BigQuery, and Snowflake are excellent additions for boosting earning potential.
4. **Optimal upskilling** involves a balance of foundational tools and specialized BI/cloud platforms.

### Final Thoughts

This analysis shows how SQL can be a powerful ally in career planning. By using data to guide decisions, aspiring business analysts can prioritize **skills that lead to better jobs and higher salaries**.

🌟 **Keep learning. Keep querying. Keep growing.**
