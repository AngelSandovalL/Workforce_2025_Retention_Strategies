// EmployeeHistory 
let
    source = Staging,
    
    // 1. Eliminar columnas innecesarias
    #"removedColumns" = Table.RemoveColumns(
        source,
        {
            "birthdate_key",
            "gender_short",
            "gender_full",
            "age",
            "city_name",
            "BUSINESS_UNIT",
            "department_name",
            "termtype_desc",
            "STATUS_YEAR",
            "length_of_service",
            "recorddate_key",
            "orighiredate_key"
        }
    ),
    #"filterTerminations" = Table.SelectRows(
        #"removedColumns",
        each [terminationdate_key] <> #date(1909, 1, 1)
    ),
    #"leftOuterJoin TermMotive" = Table.NestedJoin(
        #"filterTerminations", {"termreason_desc"},
        D_TermMotive, {"termreason_desc"},
        "TermMotive", JoinKind.LeftOuter
    ),
    #"leftOuterJoin Job" = Table.NestedJoin(
        #"leftOuterJoin TermMotive", {"job_title"},
        D_Job, {"job_title"},
        "Job", JoinKind.LeftOuter
    ),
    #"expandedTermMotive" = Table.ExpandTableColumn(
        #"leftOuterJoin Job", "TermMotive",
        {"id"}, {"termination_id"}
    ),
    #"expandedJob" = Table.ExpandTableColumn(
        #"expandedTermMotive", "Job",
        {"id"}, {"job_id"}
    ),
    #"removedTextColumns" = Table.RemoveColumns(
        #"expandedJob", {"job_title", "termreason_desc"}
    )
in
    #"removedTextColumns"