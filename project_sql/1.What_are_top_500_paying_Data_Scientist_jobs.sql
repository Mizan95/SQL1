/* ❓What are the 500 top paying Data Scientist jobs in the UK and which companies are hiring for these roles?
Comments are visible to explain the logic.
*/


/*
1. This query consists of a single block and merges the Fact table (job_postings_fact) with the company Dimension table (company_dim) directly
without any intermediary CTE
2. The merge is an inner join with the primary key of company_dim being company_id. This matching with the foreign key of
job_postings_fact which is also company_id.
3. The query then selects the appropriate columns from both tables whilst filtering out NULL values selecting only Data Scientist jobs
4. This returns the top 500 Data Scientist jobs along with company names and yearly salaries
*/

SELECT 
    job_title_short AS job_title,
    company_dim.name AS company_name,
    job_country AS country,
    job_postings.salary_year_avg AS salary
FROM 
    job_postings_fact AS job_postings
-- Inner join with company_dim table to retrieve company name
INNER JOIN company_dim ON job_postings.company_id = company_dim.company_id
WHERE 
-- Filter out NULL value in salary and only choose Data Scientist jobs
    job_postings.salary_year_avg IS NOT NULL AND
    job_postings.job_title_short = 'Data Scientist'
-- Show results in descending order based on salaries
ORDER BY
    salary DESC
-- Limit result set to 500
LIMIT
    500

/*
Analysis
The maximum salary found is $960,000.00, offered by East River Electric Power Cooperative, Inc.
The average salary for these top 500 roles is approximately $250,125.43, with a median salary of $228,000.00.
The minimum salary across this exclusive set of jobs is $205,000.00, setting a high floor for top-tier roles.
The large gap between the average and median salaries suggests a few extreme outliers significantly inflate the mean.
452 out of 500 of these highest-paying positions are located in the United States, demonstrating its dominance in the market for elite data science compensation.

[
  {
    "job_title": "Data Scientist",
    "company_name": "East River Electric Power Cooperative, Inc.",
    "country": "United States",
    "salary": "960000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ReServe",
    "country": "United States",
    "salary": "585000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Selby Jennings",
    "country": "United States",
    "salary": "550000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Selby Jennings",
    "country": "United States",
    "salary": "525000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Netflix",
    "country": "United States",
    "salary": "450000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Netflix",
    "country": "United States",
    "salary": "450000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Glocomms",
    "country": "United States",
    "salary": "425000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Asana",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CACI International",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lands End",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Big Lots",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "GM Financial",
    "country": "Sudan",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "YETI Coolers",
    "country": "Sudan",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "PayPal",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Linquest Corporation",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Linquest Corporation",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Truist Financial",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Rippling",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Analog Devices, Inc",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "FIS",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CACI International",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Linquest Corporation",
    "country": "United States",
    "salary": "375000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "361000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Demandbase",
    "country": "Sudan",
    "salary": "351500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Demandbase",
    "country": "United States",
    "salary": "351500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Nextdoor",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Gilead Sciences Inc",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Selby Jennings",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Mercury",
    "country": "Canada",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zoox.com",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Nextdoor",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zoox.com",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intuit Inc",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Visa Inc",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "UBS",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CodeStream, Inc.",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Waymo",
    "country": "United States",
    "salary": "350000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Glocomms",
    "country": "United States",
    "salary": "337500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Roblox",
    "country": "United States",
    "salary": "334720.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Demandbase",
    "country": "United States",
    "salary": "324000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Wells Fargo",
    "country": "United States",
    "salary": "320000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Teramind",
    "country": "Sudan",
    "salary": "320000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SWS",
    "country": "Russia",
    "salary": "320000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Figma",
    "country": "United States",
    "salary": "314000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Reddit",
    "country": "United States",
    "salary": "313000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "309152.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Grammarly",
    "country": "United States",
    "salary": "308500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "OpenAI",
    "country": "United States",
    "salary": "307500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Chime",
    "country": "United States",
    "salary": "301000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Storm5",
    "country": "United States",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lawrence Harvey",
    "country": "Sudan",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Storm4",
    "country": "United States",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Block",
    "country": "United States",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Coda Search",
    "country": "United States",
    "salary": "300000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Teradata",
    "country": "Sudan",
    "salary": "288000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "285500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SAP America",
    "country": "United States",
    "salary": "285000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snapchat",
    "country": "United States",
    "salary": "282500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "Sudan",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "Sudan",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stripe",
    "country": "United States",
    "salary": "281450.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Aerospace Corporation",
    "country": "United States",
    "salary": "281070.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot / THD",
    "country": "United States",
    "salary": "280000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Rippling",
    "country": "United States",
    "salary": "279000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Instagram",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Instagram",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "277500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Nord Group",
    "country": "United States",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Torc Robotics",
    "country": "Sudan",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "country": "United States",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "Sudan",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Glocomms",
    "country": "United States",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "country": "Sudan",
    "salary": "275000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ROBLOX Corporation",
    "country": "United States",
    "salary": "274675.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cash App",
    "country": "United States",
    "salary": "272500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Block",
    "country": "United States",
    "salary": "272500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Circle",
    "country": "United States",
    "salary": "272500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Block",
    "country": "United States",
    "salary": "272500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Uber",
    "country": "United States",
    "salary": "271500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Komodo Health",
    "country": "Sudan",
    "salary": "269000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Waymo",
    "country": "United States",
    "salary": "268500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "268000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "NVIDIA",
    "country": "United States",
    "salary": "267875.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "265500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "265500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "265500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "MediaMath",
    "country": "United States",
    "salary": "265500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "265500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Target",
    "country": "United States",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ZealoTech People",
    "country": "United States",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Storm6",
    "country": "Sudan",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cnam - Auditeurs - Accueil",
    "country": "United States",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "expand group",
    "country": "United States",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cnam - Auditeurs - Accueil",
    "country": "United States",
    "salary": "265000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stealth",
    "country": "United States",
    "salary": "262500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Movable Ink",
    "country": "United States",
    "salary": "262500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Grubhub",
    "country": "United States",
    "salary": "260500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart Global Tech",
    "country": "United States",
    "salary": "260000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Asana",
    "country": "United States",
    "salary": "259000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Asana",
    "country": "United States",
    "salary": "259000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Asana",
    "country": "United States",
    "salary": "259000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "258000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "258000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "NVIDIA",
    "country": "United States",
    "salary": "255000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "nitruc",
    "country": "Sudan",
    "salary": "255000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zoox",
    "country": "United States",
    "salary": "255000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zoox",
    "country": "United States",
    "salary": "255000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Genentech",
    "country": "United States",
    "salary": "254500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "WAL-MART",
    "country": "United States",
    "salary": "254000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Sam's Club",
    "country": "United States",
    "salary": "254000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "254000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart eCommerce",
    "country": "Sudan",
    "salary": "254000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart eCommerce",
    "country": "United States",
    "salary": "254000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stitch Fix",
    "country": "United States",
    "salary": "253500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "BCG X",
    "country": "United States",
    "salary": "253000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Boston Consulting Group",
    "country": "United States",
    "salary": "253000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "252844.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Strativ Group",
    "country": "United States",
    "salary": "252500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "252500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intercom",
    "country": "United States",
    "salary": "252000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "IBM",
    "country": "United States",
    "salary": "252000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intelletec",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Jobot",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Oakridge Staffing",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Kane Partners LLC",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Sumner & Scott",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "INgroovesMusicGroup",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "INgroovesMusicGroup",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "INgrooves Music Group",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Denim Health",
    "country": "Sudan",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lawrence Harvey",
    "country": "Sudan",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "INgroovesMusicGroup",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Smith Hanley Associates",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Skyrocket Ventures",
    "country": "United States",
    "salary": "250000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "United States",
    "salary": "247500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Reddit",
    "country": "United States",
    "salary": "247500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Block",
    "country": "United States",
    "salary": "247500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Reddit",
    "country": "United States",
    "salary": "247500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Aurora Innovation",
    "country": "United States",
    "salary": "245500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Databricks",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Wyatt Partners",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Peloton",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DoorDash",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DataBricks",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Sia Partners",
    "country": "United States",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Samsung",
    "country": "Sudan",
    "salary": "245000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Teradata",
    "country": "United States",
    "salary": "243500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Facebook",
    "country": "United States",
    "salary": "243000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Facebook",
    "country": "United States",
    "salary": "243000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "242500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "242500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "242500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "242500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "Sudan",
    "salary": "242500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Coupang",
    "country": "United States",
    "salary": "241500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Patreon",
    "country": "United States",
    "salary": "241000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Klaviyo",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot / THD",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot / THD",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Home Depot",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Home Depot",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "OpenX",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Home Depot",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot / THD",
    "country": "United States",
    "salary": "240000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "239777.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "239777.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lyft",
    "country": "United States",
    "salary": "237500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "237500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intelletec",
    "country": "United States",
    "salary": "237500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lawrence Harvey",
    "country": "United States",
    "salary": "237500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Glocomms",
    "country": "United States",
    "salary": "237500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "236666.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Arch Capital Group",
    "country": "United States",
    "salary": "236040.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Publicis Collective",
    "country": "United States",
    "salary": "236000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Reddit",
    "country": "United States",
    "salary": "235375.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Fairmarkit",
    "country": "Sudan",
    "salary": "235000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snap Inc.",
    "country": "United States",
    "salary": "234500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riot Games",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "234000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airtable",
    "country": "United States",
    "salary": "233500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airtable",
    "country": "United States",
    "salary": "233500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airtable",
    "country": "United States",
    "salary": "233500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta Inc.",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Meta",
    "country": "United States",
    "salary": "233000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Amadeus Search",
    "country": "United States",
    "salary": "232500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Two Sigma Investments",
    "country": "United States",
    "salary": "232500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Munich Re",
    "country": "United States",
    "salary": "232000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Munich Re",
    "country": "United States",
    "salary": "232000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Infineon Technologies",
    "country": "United States",
    "salary": "231657.296875"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "OKX",
    "country": "United States",
    "salary": "230000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Asana",
    "country": "United States",
    "salary": "230000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Parallel Consulting",
    "country": "United States",
    "salary": "230000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "230000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "230000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "U.S. Commodity Futures Trading Commission",
    "country": "United States",
    "salary": "229782.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Reddit",
    "country": "Sudan",
    "salary": "229500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Fivetran",
    "country": "United States",
    "salary": "229410.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cnam - Auditeurs - Accueil",
    "country": "United States",
    "salary": "229000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228222.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228222.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228222.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228222.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "228000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snowflake",
    "country": "United States",
    "salary": "228000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Snowflake",
    "country": "United States",
    "salary": "228000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "227500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lam Research",
    "country": "United States",
    "salary": "226500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Crunchbase",
    "country": "United States",
    "salary": "225000.03125"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "InVitro Cell Research, LLC",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Braintrust",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Hackensack Meridian Health",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Braintrust",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Kane Partners LLC",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ACT",
    "country": "Sudan",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "New Relic",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "JP Morgan Chase & Co.",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Hunter Bond",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ACT",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Yoh, A Day & Zimmermann Company",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "LyondellBasell Industries",
    "country": "Sudan",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Warner Media Group",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intelletec",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Phyton Talent Advisors",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Thomson Reuters",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ManTech International",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Selby Jennings",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Forsyth Barnes",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Braintrust",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "New Relic",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Radley James",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Thermo Fisher Scientific",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Selby Jennings",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Primis",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Teragonia",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Salt River Project",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "84.51",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "JP Morgan Chase & Co.",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Scorpion Therapeutics",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "FOURKITES",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zaddy Solutions",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riot Games",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Kane Partners LLC",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ANSER Corporation",
    "country": "United States",
    "salary": "225000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "ByteDance",
    "country": "United States",
    "salary": "224500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Course Hero",
    "country": "United States",
    "salary": "224000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Course Hero",
    "country": "Canada",
    "salary": "224000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riot Games",
    "country": "United States",
    "salary": "223000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riot Games",
    "country": "United States",
    "salary": "223000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "222500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "222093.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "222000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "222000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Nextdoor",
    "country": "United States",
    "salary": "222000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "84.51°",
    "country": "United States",
    "salary": "221875.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "84.51°",
    "country": "United States",
    "salary": "221875.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "USAA",
    "country": "United States",
    "salary": "221665.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "United Services Automobile Association",
    "country": "Sudan",
    "salary": "221665.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "United Services Automobile Association",
    "country": "United States",
    "salary": "221665.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "United Services Automobile Association",
    "country": "United States",
    "salary": "221665.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Vendelux",
    "country": "United States",
    "salary": "221000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Aurora Innovation",
    "country": "United States",
    "salary": "221000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Demandbase, Inc",
    "country": "United States",
    "salary": "220832.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Atlassian",
    "country": "Sudan",
    "salary": "220500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Yoh, A Day & Zimmermann Company",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Ridgeback Business Solutions",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Burtch Works",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Waymo",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Jobot",
    "country": "Sudan",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Jobot",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "220000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Atlassian",
    "country": "United States",
    "salary": "219500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Atlassian",
    "country": "United States",
    "salary": "219500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Atlassian",
    "country": "United States",
    "salary": "219500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Coinbase",
    "country": "Sudan",
    "salary": "219225.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Coinbase",
    "country": "United States",
    "salary": "219225.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Gopuff",
    "country": "United States",
    "salary": "219000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Travelers Insurance",
    "country": "United States",
    "salary": "218500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Pinterest",
    "country": "United States",
    "salary": "218500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Pinterest",
    "country": "United States",
    "salary": "218500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Pinterest",
    "country": "United States",
    "salary": "218500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Travelers Insurance Group Holdings",
    "country": "United States",
    "salary": "218500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Celonis",
    "country": "United States",
    "salary": "218000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Capital One",
    "country": "United States",
    "salary": "218000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Microsoft",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Vouch Insurance",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Worth Search",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Baldor Specialty Foods",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Google",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Vouch Insurance",
    "country": "United States",
    "salary": "217500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Chemours",
    "country": "United States",
    "salary": "216972.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Travelers Indemnity Company",
    "country": "United States",
    "salary": "216500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Travelers Insurance",
    "country": "United States",
    "salary": "216500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Travelers Insurance",
    "country": "United States",
    "salary": "216500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Travelers Insurance",
    "country": "United States",
    "salary": "216500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Travelers Indemnity Company",
    "country": "United States",
    "salary": "216500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart Global Tech",
    "country": "Sudan",
    "salary": "216000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cisco",
    "country": "United States",
    "salary": "216000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Cisco",
    "country": "United States",
    "salary": "216000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airtable",
    "country": "United States",
    "salary": "215500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox Inc.",
    "country": "United States",
    "salary": "215323.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Navient",
    "country": "United States",
    "salary": "215049.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airbnb",
    "country": "Sudan",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stabile Search",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Netflix",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stabile Search",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Jobot",
    "country": "Sudan",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Lawrence Harvey",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Averity",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Forsyth Barnes",
    "country": "United States",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TIFIN",
    "country": "Sudan",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Mavent Analytics",
    "country": "Sudan",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "Sudan",
    "salary": "215000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "AT&T",
    "country": "United States",
    "salary": "214379.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Costco",
    "country": "Sudan",
    "salary": "214000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Northrop Grumman Corp.",
    "country": "United States",
    "salary": "214000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "IBM",
    "country": "United States",
    "salary": "213500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "IBM",
    "country": "United States",
    "salary": "213500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Electronic Arts",
    "country": "Sudan",
    "salary": "212625.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Verizon",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Airbnb",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Public",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "212500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Robinhood",
    "country": "United States",
    "salary": "212000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "AT&T",
    "country": "United States",
    "salary": "212000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Guidehouse",
    "country": "United States",
    "salary": "212000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Visa",
    "country": "Japan",
    "salary": "212000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Form Energy",
    "country": "United States",
    "salary": "211255.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "eSmartloan",
    "country": "United States",
    "salary": "211000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Spring Health",
    "country": "United States",
    "salary": "211000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Capital One",
    "country": "United States",
    "salary": "211000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Capital One",
    "country": "United States",
    "salary": "211000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Federal Deposit Insurance Corporation",
    "country": "United States",
    "salary": "210389.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Kyndryl, Inc.",
    "country": "Sudan",
    "salary": "210360.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Mastercard, Inc.",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "Sudan",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Stabile Search",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Storm3",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "IBM",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Home Depot",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Irvine Technology Corporation",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Blend360",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "Sudan",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Interactive Resources - iR",
    "country": "Sudan",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CVS Health",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "CyberCoders",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Home Depot",
    "country": "United States",
    "salary": "210000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "209955.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "209955.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "209955.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Apple",
    "country": "United States",
    "salary": "209500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Pfizer",
    "country": "United States",
    "salary": "209500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Walmart",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Disney Media & Entertainment Distribution",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "WAL-MART",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "209000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zocdoc",
    "country": "United States",
    "salary": "208500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Toast",
    "country": "United States",
    "salary": "208000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Toast",
    "country": "United States",
    "salary": "208000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Toast Inc.",
    "country": "United States",
    "salary": "208000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "207560.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Gametime",
    "country": "United States",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Notion",
    "country": "United States",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Josef Group Inc.",
    "country": "United States",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "The Clorox Company",
    "country": "United States",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "MongoDB",
    "country": "Argentina",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "WarnerMedia",
    "country": "United States",
    "salary": "207500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Siemens Healthineers",
    "country": "United States",
    "salary": "207451.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Oski Technology",
    "country": "United States",
    "salary": "207125.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Oculus VR",
    "country": "United States",
    "salary": "207000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Best Buy",
    "country": "United States",
    "salary": "206800.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Pinterest",
    "country": "United States",
    "salary": "206575.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "206500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DropBox",
    "country": "United States",
    "salary": "206500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dropbox",
    "country": "United States",
    "salary": "206500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DropBox",
    "country": "United States",
    "salary": "206500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "DropBox",
    "country": "United States",
    "salary": "206500.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Uber",
    "country": "United States",
    "salary": "206000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Uber",
    "country": "United States",
    "salary": "206000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Liberty Mutual Insurance",
    "country": "United States",
    "salary": "206000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Uber",
    "country": "United States",
    "salary": "206000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Zscaler",
    "country": "United States",
    "salary": "206000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "TikTok",
    "country": "United States",
    "salary": "205655.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "US Federal Deposit Insurance Corporation",
    "country": "United States",
    "salary": "205328.5"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Dataworks",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "Sudan",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Harnham",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riverside Staffing, LLC",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Sanofi",
    "country": "United Kingdom",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Alldus",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Riverside Staffing, LLC",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Intelletec",
    "country": "Sudan",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "SoFi",
    "country": "United States",
    "salary": "205000.0"
  },
  {
    "job_title": "Data Scientist",
    "company_name": "Huckleberry Labs",
    "country": "United States",
    "salary": "205000.0"
  }
]
*/


