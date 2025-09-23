// TermMotive
let
    source = Staging,
    // Exclude non Temination-related columns
    #"removedColumns" = Table.SelectColumns(source,{"termtype_desc", "termreason_desc"}),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    #"addedId" = Table.AddIndexColumn(#"removedDuplicates", "id", 1, 1, Int64.Type)
in
    #"addedId"