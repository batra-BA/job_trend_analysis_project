/*
Question: What are the most in-demand skills for Business analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a Business analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/* ============================================================================
   📊 SKILL INSIGHTS FOOTNOTE: Business Analyst Job Skills in 2023
   ============================================================================

   🔍 PURPOSE
   ------------
   This section highlights the most in-demand **technical skills** observed 
   across top-paying business analyst roles in 2023.

   📌 Dataset includes job title, company, salary, and required skills.
   📌 Skills are extracted per job_id to reflect overlapping demand across roles.

   ============================================================================
   
   💡 TOP SKILLS REQUIRED ACROSS ROLES
   -------------------------------------
   • 🐍 Python
   • 📊 SQL
   • 📈 Excel
   • 📉 Tableau
   • 🔍 Looker
   • ☁️ GCP / BigQuery
   • 📎 Word, Sheets
   • 🧮 R, SAS
   • 🧑‍🍳 Chef
   • 🔧 Phoenix

   👉 Frequently required **combination of skills**:  
      → SQL + Python + Tableau  
      → Excel + Looker  
      → GCP + BigQuery + Sheets  
      → Python + R + SAS (for statistical analyst roles)

   ============================================================================
   
   🧑‍💼 ROLE-WISE SKILLS BREAKDOWN
   ----------------------------------

   | job_title                                                    | company         | salary     | skills                                     |
   |--------------------------------------------------------------|-----------------|------------|--------------------------------------------|
   | Lead Business Intelligence Engineer                          | Noom            | $220,000   | sql, python, excel, tableau, looker, chef  |
   | Manager II, Applied Science - Marketplace Dynamics           | Uber            | $214,500   | python                                     |
   | Senior Economy Designer                                      | Harnham         | $190,000   | sql, python, r                             |
   | Staff Revenue Operations Analyst                             | Gladly          | $170,500   | excel                                      |
   | Business Intelligence Analyst (Leadership Role) - GCP        | CyberCoders     | $162,500   | sql, python, bigquery, gcp, looker, word, sheets |
   | Manager Analytics and Reporting                              | CyberCoders     | $145,000   | sql, excel, tableau                         |
   | Business Strategy Analyst Senior (Hybrid)                    | USAA            | $138,640   | sql, python, r, sas, phoenix, excel, tableau |
   | Marketing Analytics Manager                                  | Get It Recruit  | $134,550   | tableau                                    |

   ============================================================================
   
   📈 KEY TAKEAWAYS
   -----------------
   • SQL and Python are near-universal essentials.  
   • Excel and Tableau are staple tools in almost every role.  
   • Looker and GCP tools are increasingly relevant for cloud-centric roles.  
   • Some roles demand R/SAS for advanced statistical analysis.  
   • Excel-based productivity tools (Word, Sheets) are still actively required.  
   • Visualization & cloud platforms now often go hand-in-hand with BI.

   ============================================================================
*/


 
