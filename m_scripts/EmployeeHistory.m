// EmployeeHistory
let
    source = Staging,
    // Remove unnecesary columns
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
            "length_of_service"
        }
    ),
    // Add a day column to exclude anual headcount snapshot data
    #"addedDay" = Table.AddColumn(#"removedColumns", "Day", each Date.Day([recorddate_key])),
    #"excludeDay31" = Table.SelectRows(#"addedDay", each ([Day] = 1)),
    // Retrieve id's from dimension tables
    #"leftOuterJoin TermMotive" = Table.NestedJoin(
        #"excludeDay31", {"termreason_desc"}, TermMotive, {"termreason_desc"}, "TermMotive", JoinKind.LeftOuter
    ),
    #"leftOuterJoin Job" = Table.NestedJoin(
        #"leftOuterJoin TermMotive", {"job_title"}, Job, {"job_title"}, "Job", JoinKind.LeftOuter
    ),
    #"expandedTermMotive" = Table.ExpandTableColumn(#"leftOuterJoin Job", "TermMotive", {"id"}, {"termination_id"}),
    #"expandedJob" = Table.ExpandTableColumn(#"expandedTermMotive", "Job", {"id"}, {"job_id"}),
    // Remove day column since it's not necesary anymore
    #"removedDay" = Table.RemoveColumns(#"expandedJob", {"job_title", "termreason_desc", "Day"})
in
    #"removedDay"