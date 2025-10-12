```MERMAID
---
config:
  layout: elk
  theme: mc
---
erDiagram
	direction BT
    %% Tablas de Dimensión
    D_Employee {
        int EmployeeID PK
        int age
        int birthdate_key FK
        varchar gender_short
        int orighiredate_key FK
        int terminationdate_key FK
    }

    D_Job {
        int id PK
        varchar business_function
        varchar department_name
        varchar job_title
    }

    D_Store {
        int store_id PK
        varchar BUSINESS_UNIT
        varchar city_name
    }

    D_Calendar {
        date date PK
        varchar day_name
        int day_of_month
        int day_of_week
        varchar month_name
        int month_number
    }

    D_TermMotive {
        int id PK
        varchar termreason_desc
        varchar termtype_desc
    }

    %% Tablas de Hechos
    F_AnnualHeadcount {
        int EmployeeID FK
        int job_id FK
        int recorddate_key FK
        varchar STATUS
        int store_id FK
    }

    F_EmployeeHistory {
        int EmployeeID FK
        int job_id FK
        varchar STATUS
        int store_id FK
        int termination_id FK
        int terminationdate_key FK
    }

    %% Relaciones entre Dimensiones y Hechos
    D_Employee      ||--o{ F_AnnualHeadcount : "registra snapshot"
    D_Job           ||--o{ F_AnnualHeadcount : "tiene puesto"
    D_Store         ||--o{ F_AnnualHeadcount : "en tienda"
    D_Calendar      ||--o{ F_AnnualHeadcount : "en fecha de registro"

    D_Employee      ||--o{ F_EmployeeHistory : "registra baja"
    D_Job           ||--o{ F_EmployeeHistory : "tiene puesto"
    D_Store         ||--o{ F_EmployeeHistory : "en tienda"
    D_TermMotive    ||--o{ F_EmployeeHistory : "por motivo"
    D_Calendar      ||--o{ F_EmployeeHistory : "en fecha de baja"
	```