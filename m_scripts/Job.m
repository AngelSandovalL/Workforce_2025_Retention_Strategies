// Job
let
    source = Staging,
    // Exclude non Job-related columns
    #"removedColumns" = Table.SelectColumns(source, {"job_title", "department_name"}),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    #"addedId" = Table.AddIndexColumn(#"removedDuplicates", "id", 1, 1, Int64.Type),
    #"addedBusinessFunction" = Table.AddColumn(
        addedId,
        "business_function",
        each
            if [department_name] = "Bakery" then
                "Operations"
            else if [department_name] = "Dairy" then
                "Operations"
            else if [department_name] = "Meats" then
                "Operations"
            else if [department_name] = "Processed Foods" then
                "Operations"
            else if [department_name] = "Produce" then
                "Operations"
            else if [department_name] = "Customer Service" then
                "Customer Facing"
            else if [department_name] = "Store Management" then
                "Customer Facing"
            else
                "Corporate"
    )
in
    #"addedBusinessFunction"