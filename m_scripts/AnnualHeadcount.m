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
            "length_of_service",
            "terminationdate_key",
            "termreason_desc",
            "orighiredate_key"
        }
    ),
    // Add a day column to include only annual headcount data
    #"addedDay" = Table.AddColumn(#"removedColumns", "Day", each Date.Day([recorddate_key])),
    #"excludeDay1" = Table.SelectRows(#"addedDay", each ([Day] = 31)),
    #"leftOuterJoin Job" = Table.NestedJoin(
        excludeDay1, {"job_title"}, D_Job, {"job_title"}, "Job", JoinKind.LeftOuter
    ),
    #"expandedJob" = Table.ExpandTableColumn(#"leftOuterJoin Job", "Job", {"id"}, {"job_id"}),
    // Remove day column since it's not necesary anymore
    #"removedDay" = Table.RemoveColumns(#"expandedJob", {"job_title", "Day"})
in
    #"removedDay"