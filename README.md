# Workforce_2025_Retention_Strategies
---
This project presents a comprehensive analysis of employee turnover (attrition) at a manufacturing company, using a dataset that spans a 10-year period (2006-2015).

You can find the original dataset at https://www.kaggle.com/datasets/HRAnalyticRepository/employee-attrition-data

---
## Project Objective
The main objective is to identify the key patterns and factors that influence employee terminations. Through this analysis, the goal is to generate **informed hypotheses** that can serve as a foundation for developing future talent retention strategies, helping the organization focus its efforts on the areas of greatest impact.

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
* **Data Source:** The analysis is based on the `MFG10YearTerminationData.csv` file.
* **Transformation Tool:** Data cleaning and transformation are performed using **Power Query** within Microsoft Excel. Final metrics and visualizations are created in Excel sheets.
* **Source Code:** The M language scripts for each Power Query transformation are stored in the `pq_scripts/` folder for review and version control.
* **Version Control:** This repository is managed with Git and GitHub. The Power Query M scripts are versioned as source code, while the main Excel data file is excluded via the `.gitignore` file.

---
## Repository Structure
├── assets/ # Contains all supporting assets like images, diagrams, etc.

│   └── images

├── dataset/ # Folder ignored by Git, contains the data. 

│   └── MFG10YearTerminationData.xlsx 

├── dax/ # Folder with .dax files 

├── pq_scripts/  # Contains the M language source code for data transformation.

├── .gitignore # Configuration file to ignore the dataset folder. 

└── README.md # This file.
## Download Processed Data
The final Excel workbook, which includes the raw data, all transformations, pivot tables, and charts, will be available for download at the following link: (Work in Progress)

--- 
## Findings and Conclusions 
*(This section will be updated with the key findings and hypotheses generated once the analysis is complete).*