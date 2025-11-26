/*
5. What are the top 20 optimal skills to learn?
Optimal meaning those skills that are High Demand and High Paying
This approach also uses two 'daisy-chained' CTEs as a clean maintainable solution. And thereafter a main query containing an inner join of both CTEs.
Comments are present to explain the logic.
*/

-- CTE 1: Maps Job IDs with Skill Dimension table
WITH skills_job_table AS (
    SELECT
        skills_to_job.job_id,
        skills_to_job.skill_id,
        skills_dim.skills AS skill_name
    FROM
        skills_job_dim AS skills_to_job
    LEFT OUTER JOIN skills_dim ON skills_to_job.skill_id = skills_dim.skill_id
),

-- CTE 2: Selects all job IDs for 'Data Scientist' roles based across entire data set
data_scientist_jobs AS (
    SELECT
    job_id,
    job_title_short AS job_title,
    salary_year_avg AS salary,
    job_country
    FROM job_postings_fact
    WHERE
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL
)

-- Main query: Sums salaries and Counts jobs and then, aggregates these results based on each skill
-- This is facilitated by an Inner Join between both CTEs 
SELECT
    ROUND(SUM(data_scientist_jobs.salary), 0) AS total_salary,
    COUNT(data_scientist_jobs.job_id) AS number_of_jobs,
    skill_name
FROM
    data_scientist_jobs
INNER JOIN
    skills_job_table ON data_scientist_jobs.job_id = skills_job_table.job_id
GROUP BY
  skill_name
ORDER BY 
  number_of_jobs DESC
LIMIT
    20

/*
Analysis
Python is the clear market leader, with the highest total combined salary (nearly $595 Million) and the highest number of job postings (4,312).
The overall trend shows a strong positive correlation: as the total number of job postings (green line) decreases across the top 10 skills, the total combined salary (orange bars) generally decreases as well.
The foundational languages, Python, SQL, and R, account for the vast majority of both the total salary and the job count in the top 10.
The combined total salary for a skill like Tableau ($\$168M$) is significantly higher than deep learning frameworks like TensorFlow ($\$92M$) and PyTorch ($\$82M$), primarily due to the higher volume of job postings for Tableau.
[
  {
    "total_salary": "595267752",
    "number_of_jobs": "4312",
    "skill_name": "python"
  },
  {
    "total_salary": "436194499",
    "number_of_jobs": "3151",
    "skill_name": "sql"
  },
  {
    "total_salary": "336021245",
    "number_of_jobs": "2486",
    "skill_name": "r"
  },
  {
    "total_salary": "168230566",
    "number_of_jobs": "1278",
    "skill_name": "tableau"
  },
  {
    "total_salary": "151178759",
    "number_of_jobs": "1230",
    "skill_name": "sas"
  },
  {
    "total_salary": "141083006",
    "number_of_jobs": "1016",
    "skill_name": "aws"
  },
  {
    "total_salary": "136601278",
    "number_of_jobs": "946",
    "skill_name": "spark"
  },
  {
    "total_salary": "91944925",
    "number_of_jobs": "641",
    "skill_name": "tensorflow"
  },
  {
    "total_salary": "82794849",
    "number_of_jobs": "623",
    "skill_name": "azure"
  },
  {
    "total_salary": "76873609",
    "number_of_jobs": "617",
    "skill_name": "excel"
  },
  {
    "total_salary": "82130354",
    "number_of_jobs": "602",
    "skill_name": "hadoop"
  },
  {
    "total_salary": "82337831",
    "number_of_jobs": "564",
    "skill_name": "pytorch"
  },
  {
    "total_salary": "72800375",
    "number_of_jobs": "557",
    "skill_name": "java"
  },
  {
    "total_salary": "57996955",
    "number_of_jobs": "489",
    "skill_name": "power bi"
  },
  {
    "total_salary": "66507257",
    "number_of_jobs": "481",
    "skill_name": "pandas"
  },
  {
    "total_salary": "55576609",
    "number_of_jobs": "392",
    "skill_name": "scikit-learn"
  },
  {
    "total_salary": "55266510",
    "number_of_jobs": "381",
    "skill_name": "scala"
  },
  {
    "total_salary": "46352108",
    "number_of_jobs": "376",
    "skill_name": "git"
  },
  {
    "total_salary": "46348237",
    "number_of_jobs": "339",
    "skill_name": "numpy"
  },
  {
    "total_salary": "46599159",
    "number_of_jobs": "316",
    "skill_name": "go"
  }
]
*/