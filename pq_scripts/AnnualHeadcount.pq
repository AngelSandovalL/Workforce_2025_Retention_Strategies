// AnnualHeadcount
let
    source = Staging,
    // Remove unnecessary columns
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
    // Add a day column to include only annual headcount data
    #"addedDay" = Table.AddColumn(#"removedColumns", "Day", each Date.Day([recorddate_key])),
    #"excludeDay1" = Table.SelectRows(#"addedDay", each ([Day] = 31)),
    // Retrieve id' from dimension tables
    #"leftOuterJoin TermMotive" = Table.NestedJoin(
        #"excludeDay1", {"termreason_desc"}, TermMotive, {"termreason_desc"}, "TermMotive", JoinKind.LeftOuter
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