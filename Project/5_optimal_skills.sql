/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Business Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
  offering strategic insights for career development in business analysis
*/

-- Identifies skills in high demand for Business Analyst roles
-- Use Query #3
WITH skills_demand AS (
  SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_title_short = 'Business Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
  GROUP BY
    skills_dim.skill_id
), 
-- Skills with high average salaries for Business Analyst roles
-- Use Query #4
average_salary AS (
  SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
  GROUP BY
    skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
  skills_demand.skill_id,
  skills_demand.skills,
  demand_count,
  avg_salary
FROM
  skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
  demand_count > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC
LIMIT 25;

-- rewriting this same query more concisely
SELECT 
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count,
  ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Business Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = True 
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC

/* ============================================================================
   🔍 OPTIMAL SKILLS TO LEARN — High Demand + High Salary (2023)
   ============================================================================

   ❓ QUESTION:
   What are the most optimal skills to learn for Business Analyst roles?

   📌 CRITERIA:
   • High demand (i.e., requested frequently in job listings)
   • High average salary (i.e., financially rewarding)
   • Focused on **remote roles** with specified salary data

   🎯 WHY IT MATTERS:
   These skills offer the best combination of 💼 job security and 💰 financial benefit,
   helping Business Analysts make smart choices when planning their upskilling roadmap.

   ============================================================================

   📊 RESULTS — Sorted by Average Salary:
   --------------------------------------

   | 🔢 Rank | 🛠️ Skill      | 📈 Demand Count | 💵 Avg Salary (USD) |
   |--------:|----------------|----------------:|--------------------:|
   |   1     | 🐍 Python       | 20              | $116,516            |
   |   2     | 📊 Tableau      | 27              | $104,233            |
   |   3     | 🛢️ SQL          | 42              | $99,120             |
   |   4     | 📉 Excel        | 31              | $94,132             |
   |   5     | ⚡ Power BI     | 12              | $90,448             |

   🧠 Insight:
   ------------------------------------------------------------------
   - **Python** ranks #1 for salary — a must-have for advanced analysts.
   - **SQL** and **Excel** remain in **very high demand**, offering job stability.
   - **Tableau** balances both strong demand and good pay — great for dashboarding skills.
   - **Power BI** is emerging fast, though with slightly lower average salary.

   ✅ Conclusion:
   A mix of **technical (Python, SQL)** and **visual (Tableau, Power BI)** skills
   positions you perfectly for both high-salary roles and long-term relevance
   in the Business Analytics job market.

============================================================================ */
