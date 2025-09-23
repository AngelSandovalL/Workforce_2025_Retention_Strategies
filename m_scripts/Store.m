// Store
let
    source = Staging,
    // Exclude non store-related columns
    #"removedColumns" = Table.SelectColumns(source, {"store_id", "city_name", "BUSINESS_UNIT"}),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    // Removed duplicate stores (id 35)
    #"removedId35" = Table.Distinct(removedDuplicates, {"store_id", "city_name"})
in
    #"removedId35"