// Employee
let
    source = Staging,
    // Exclude non employee-related columns
    #"removedColumns" = Table.SelectColumns(
        source, {"EmployeeID", "birthdate_key", "orighiredate_key", "gender_short"}
    ),
    #"removedDuplicates" = Table.Distinct(#"removedColumns")
in
    #"removedDuplicates"