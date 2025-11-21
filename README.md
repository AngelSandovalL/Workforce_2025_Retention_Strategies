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
## Technical Architecture & Methodology

This project moves beyond simple visualization by implementing a robust Business Intelligence architecture:

* **Data Modeling (Star Schema):**
    * Transformed raw flat CSV data into a normalized **Star Schema**.
    * **Fact Tables:** `F_Employee_History` (Transactions) and `F_Headcount` (Snapshots).
    * **Dimension Tables:** `D_Calendar`, `D_Job` (Org Structure), `D_Location`, and `D_Demographics`.
    
* **Advanced DAX Calculations:**
    * **Iterative Logic:** Used `AVERAGEX` for accurate annual Headcount calculations (`(Opening + Closing) / 2`) to handle multi-year context transitions.
    * **Dynamic Segmentation:** Implemented a **Risk Matrix** algorithm to classify departments into *Danger*, *Warning*, *Stable*, and *Safe* zones based on HC and Attrition Rate.
    * **Glossary Table:** Created a self-contained `DATATABLE` within the model to store definitions and business logic.

* **Visualization UX:**
    * Designed a 6-page interactive report with drill-through capabilities.
    * Implemented **Decomposition Trees** for root-cause analysis.
    * Used **Ribbon Charts** to visualize ranking volatility over the decade.

* **Version Control:** This repository is managed with Git and GitHub. The Power Query M and DAX scripts are versioned as source code, while the bin files like .docx, .pdf, .xlsx, .csv files are excluded via the `.gitignore` file.

---
## Key Insights & Findings

During the analysis of the 2015-2024 period, the project uncovered critical structural shifts in the workforce dynamics:

1.  **From Retention to Restructuring (The 2023 Shift):**
    * The analysis debunked the initial hypothesis of "natural attrition."
    * identified a massive spike in **Involuntary Terminations (Layoffs)** starting in 2023 (142 cases) and continuing into 2024, signaling a corporate restructuring strategy rather than a retention failure.

2.  **Demographic Bias in Exits:**
    * **Gender Disparity:** While the workforce is balanced (50/50), **79% of terminations are women**.
    * **Senior Talent Drain:** A critical loss of personnel with **10+ years of tenure** and **55+ years of age** was detected, predominantly affecting female employees.

3.  **Operational Impact:**
    * **"Danger Zone" Departments:** *Meats* and *Customer Service* were identified as critical operational hotspots. While *Customer Service* faces high volume turnover due to its size, *Meats* faces a loss of specialized technical roles (Meat Cutters).
    * **Geographic Focus:** The highest attrition volume is concentrated in **Vancouver** (Headoffice) and **Fort Nelson**, the latter showing the highest risk ratio (low headcount / high turnover).
---

## Repository Structure
├── assets/ # Contains all supporting assets like images, diagrams, etc.

│   └── images

│   └── docs

├── dataset/ # Folder ignored by Git, contains the data. 

│   └── MFG10YearTerminationData.csv

├── dax/ # Folder with .dax files 

├── m_scripts/  # Contains the M language source code for data transformation.

├── .gitignore # Configuration file to ignore the dataset folder. 

└── README.md # This file.

## Accessing Data and Deliverables
The raw dataset (.csv) and the final Power BI dashboard (.pbix file) are not stored in this repository to maintain its size and focus on source code. You can access them at the following secure link:
* https://drive.google.com/drive/folders/1Wl1ueGIWtsytB2WoQBot4RKdV7448Yqv?usp=sharing

