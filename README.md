# Workforce_2025_Retention_Strategies
---
This project provides a strategic diagnosis of employee turnover (attrition) using a historical dataset from a manufacturing company, with an updated date range spanning from 2015 to 2024. The final deliverable will be an interactive Power BI dashboard designed for senior management.

You can find the original dataset at https://www.kaggle.com/datasets/HRAnalyticRepository/employee-attrition-data

---
## Project Objective
The main objective is to move beyond operational reporting and deliver actionable insights that inform the creation of targeted talent retention strategies. Through this analysis, the goal is to identify the key patterns and factors that influence employee terminations, allowing the organization to focus its efforts on the areas of greatest impact.

---
## Key Questions to Answer
The study will focus on answering the following questions:

1.  **Departmental Analysis:** Which departments or job titles show the highest turnover rate?
2.  **Demographic & Tenure Analysis:** Is there a correlation between an employee's age or length of service and their likelihood of leaving? At what point in their career is an employee most likely to leave?
3.  **Temporal Analysis:** How has the turnover rate evolved over the 10-year period?
4.  **Geographic Analysis:** Are there any geographic locations (city/store) that stand out with particularly high or low turnover?
5.  **Root Cause Analysis:** What are the most common termination reasons (`termreason_desc`), and how are they distributed across different employee segments?

---
## Methodology and Tools
* **Data Transformation (ETL):** Power Query (M Language).
* **Data Modeling & Visualization:** Power BI.
* **Metrics and KPIs:** DAX (Data Analysis Expressions).
* **Version Control:** This repository is managed with Git and GitHub. The Power Query M and DAX scripts are versioned as source code, while the bin files like .docx, .pdf, .xlsx, .csv files are excluded via the `.gitignore` file.

---
## Repository Structure
├── assets/ # Contains all supporting assets like images, diagrams, etc.

│   └── images

│   └── docs

├── dataset/ # Folder ignored by Git, contains the data. 

│   └── MFG10YearTerminationData.csv

├── dax/ # Folder with .dax files 

├── pq_scripts/  # Contains the M language source code for data transformation.

├── .gitignore # Configuration file to ignore the dataset folder. 

└── README.md # This file.

## Accessing Data and Deliverables
The raw dataset (.csv) and the final Power BI dashboard (.pbix file) are not stored in this repository to maintain its size and focus on source code. You can access them at the following secure link:
* https://drive.google.com/file/d/1RJPJRiBZ4nF_PRcHLzXSoldk2861oTPe/view?usp=sharing

