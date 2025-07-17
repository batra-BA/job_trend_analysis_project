/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* ============================================================================
   📊 FOOTNOTE: Most In-Demand Skills for Business Analyst Roles (2023)
   ============================================================================

   🔍 DATA SUMMARY
   ----------------
   This section outlines the **top 5 most frequently required skills** 
   across all business analyst-related job postings in 2023.

   📌 These counts reflect how often a skill was mentioned in job listings, 
      helping to gauge real-world market demand.

   ============================================================================
   
   💡 TOP 5 SKILLS BY DEMAND COUNT
   --------------------------------

   | Skill      | Demand Count |
   |------------|--------------|
   | 🟦 SQL      | 1266         |
   | 📊 Excel    |  983         |
   | 📉 Tableau  |  728         |
   | 📈 Power BI |  555         |
   | 🐍 Python   |  546         |

   ============================================================================
   
   📈 INTERPRETATION & INSIGHTS
   -----------------------------
   • 🔹 **SQL** is the #1 must-have skill for business analysts in 2023.
   • 🔸 **Excel** remains a fundamental, core tool for data manipulation.
   • 🟢 **Tableau** and **Power BI** dominate the data visualization space.
   • 🟣 **Python** is increasingly valued, especially in analytical or hybrid roles.

   ✅ Ideal Skill Combo for a Modern Business Analyst:
      → SQL + Excel + Tableau or Power BI + Python

   ============================================================================
*/
