    /*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Business Analysts, offering insights into employment options and location flexibility.
- Note: This query is adapted for the year 2024, reflecting the latest data.
*/

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Business Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;


/* ============================================================================
   📊 PROJECT FOOTNOTE: Job Trend Analysis – Business Analyst Roles (2023)
   ============================================================================

   🔍 SUMMARY OF FINDINGS
   -----------------------
   • Top 10 business analyst-related roles identified based on **highest average salaries**.
   • 💸 Salary Range: $134,550 to $220,000 per year.
   • 💼 All roles are FULL-TIME and REMOTE (job_location = 'Anywhere').

   🧑‍💼 TOP EMPLOYERS & ROLES
   ---------------------------
   1. 🟢 Noom – Lead Business Intelligence Engineer – $220,000
   2. 🟣 Uber – Manager II, Applied Science – $214,500
   3. 🔵 Multicoin Capital – Analyst – $200,000 (x2 listings)
   4. 🟠 Harnham – Senior Economy Designer – $190,000
   5. 🟡 Gladly – Staff Revenue Operations Analyst – $170,500
   6. 🔴 CyberCoders – BI Analyst (Leadership Role, GCP) – $162,500
   7. 🟤 CyberCoders – Manager Analytics and Reporting – $145,000
   8. ⚫ USAA – Business Strategy Analyst Senior – $138,640
   9. ⚪ Get It Recruit – Marketing Analytics Manager – $134,550

   🧠 TRENDS & INSIGHTS
   ---------------------
   • 📌 Roles are **not limited** to the classic "Business Analyst" title.
     → Includes: Economy Designer, Revenue Operations Analyst, Applied Scientist, etc.

   • 🏢 Companies span multiple industries:
     - Tech (Uber), Digital Health (Noom), Finance (USAA), Startups (Multicoin Capital), 
       Marketing (Get It Recruit), and Consulting (CyberCoders).

   • 🌍 100% Remote roles → Highlights the post-pandemic shift to remote-friendly analytics positions.

   • 📈 Roles suggest demand for:
     - Data expertise (SQL, BI tools, Python)
     - Strategic thinking
     - Cross-functional collaboration
     - Leadership capabilities

   ✅ IMPLICATIONS FOR ANALYSTS
   -----------------------------
   • Business analytics roles are evolving into **hybrid strategic-technical** profiles.
   • High compensation and remote access make these roles more accessible across geographies.
   • Learning SQL and analytics tools remains **highly relevant** across sectors.

   ============================================================================

   🗂️ RAW QUERY RESULTS (Top 10 Jobs by Avg Salary)
   -------------------------------------------------

   | job_id  | job_title                                                  | job_location | schedule  | salary     | company_name       |
   |---------|-------------------------------------------------------------|--------------|-----------|------------|--------------------|
   | 502610  | Lead Business Intelligence Engineer                         | Anywhere     | Full-time | $220,000   | Noom               |
   | 112859  | Manager II, Applied Science - Marketplace Dynamics          | Anywhere     | Full-time | $214,500   | Uber               |
   | 1069582 | Analyst                                                     | Anywhere     | Full-time | $200,000   | Multicoin Capital  |
   | 998056  | Analyst                                                     | Anywhere     | Full-time | $200,000   | Multicoin Capital  |
   | 17458   | Senior Economy Designer                                     | Anywhere     | Full-time | $190,000   | Harnham            |
   | 416185  | Staff Revenue Operations Analyst                            | Anywhere     | Full-time | $170,500   | Gladly             |
   | 1099753 | REMOTE - Business Intelligence Analyst (Leadership Role)    | Anywhere     | Full-time | $162,500   | CyberCoders        |
   | 1313937 | Manager Analytics and Reporting                             | Anywhere     | Full-time | $145,000   | CyberCoders        |
   | 106225  | Business Strategy Analyst Senior (Hybrid)                   | Anywhere     | Full-time | $138,640   | USAA               |
   | 661103  | Marketing Analytics Manager                                 | Anywhere     | Full-time | $134,550   | Get It Recruit     |

   ============================================================================
*/
