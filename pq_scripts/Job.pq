// Job 
let
    source = Staging,
    // Exclude non Job-related columns
    #"removedColumns" = Table.SelectColumns(source,{"job_title", "department_name"}),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    #"addedId" = Table.AddIndexColumn(#"removedDuplicates", "id", 1, 1, Int64.Type)
in
    addedId