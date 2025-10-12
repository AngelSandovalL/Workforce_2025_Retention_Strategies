// Employee
let
    source = Staging,
    // Exclude non employee-related columns
    #"removedColumns" = Table.SelectColumns(
        source, {"EmployeeID", "birthdate_key", "orighiredate_key", "gender_short", "terminationdate_key"}
    ),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    #"addedAge" = Table.AddColumn(removedDuplicates, "age", each Date.Year(Date.From(DateTime.LocalNow())) - Date.Year([birthdate_key]))
in
    #"addedAge"