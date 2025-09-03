// EmployeeStatus
let
    source = YearlySnapshots,
    // Data ordered by EmployeeID and STATUS_YEAR to keep only the most recent record per employee
    #"sortedRows" = Table.Sort(source, {{"EmployeeID", Order.Ascending}, {"STATUS_YEAR", Order.Descending}}),
    #"removedDuplicates" = Table.Distinct(#"sortedRows", {"EmployeeID"})
in
    #"removedDuplicates"
