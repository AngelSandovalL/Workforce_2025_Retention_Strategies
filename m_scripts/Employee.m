// Employee
let
    source = Staging,
    // Exclude non employee-related columns
    #"removedColumns" = Table.SelectColumns(
        source, {"EmployeeID", "birthdate_key", "orighiredate_key", "gender_short", "terminationdate_key"}
    ),
    #"removedDuplicates" = Table.Distinct(#"removedColumns"),
    #"addedEventDate" = Table.AddColumn(#"removedDuplicates", "EventDate", each
        if [terminationdate_key] = #date(1909, 1, 1) then
            #date(2024, 12, 31)
        else
            [terminationdate_key]
    ),
    #"addedAgeAtEvent" = Table.AddColumn(#"addedEventDate", "AgeAtEvent_Raw", each
        Duration.Days([EventDate] - [birthdate_key]) / 365.25
    ),
    #"addedTenureAtEvent" = Table.AddColumn(#"addedAgeAtEvent", "TenureAtEvent_Raw", each
        Duration.Days([EventDate] - [orighiredate_key]) / 365.25
    ),
    #"addedAgeBand" = Table.AddColumn(#"addedTenureAtEvent", "Age_Bin", each
        if [AgeAtEvent_Raw] < 25 then "18-24"
        else if [AgeAtEvent_Raw] < 35 then "25-34"
        else if [AgeAtEvent_Raw] < 45 then "35-44"
        else if [AgeAtEvent_Raw] < 55 then "45-54"
        else if [AgeAtEvent_Raw] >= 55 then "55+"
        else "N/A"
    ),
    #"addedTenureBand" = Table.AddColumn(#"addedAgeBand", "Tenure_Bin (y)", each
        if [TenureAtEvent_Raw] < 1 then "< 1"
        else if [TenureAtEvent_Raw] < 3 then "1-3"
        else if [TenureAtEvent_Raw] < 5 then "3-5"
        else if [TenureAtEvent_Raw] < 10 then "5-10"
        else if [TenureAtEvent_Raw] >= 10 then "10+"
        else "N/A"
    ),
        #"finalColumns" = Table.SelectColumns(#"addedTenureBand", {
        "EmployeeID", "birthdate_key", "orighiredate_key", "gender_short", "terminationdate_key",
        "Age_Bin", "Tenure_Bin (y)"
    })
in
    #"finalColumns"