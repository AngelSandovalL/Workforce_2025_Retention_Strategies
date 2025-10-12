// Staging
let
    source = Csv.Document(
        File.Contents(pPath & "MFG10YearTerminationData.csv"),
        [
            Delimiter = ",",
            Columns = 18,
            Encoding = 1252,
            QuoteStyle = QuoteStyle.None
        ]
    ),
    #"promotedHeaders" = Table.PromoteHeaders(source, [PromoteAllScalars = true]),
    //Fixed types and added 9 years to dates
    #"fixedTypes" = Table.TransformColumns(
        #"promotedHeaders",
        {
            {"birthdate_key", each Date.AddYears(Date.From(_), 9), type date},
            {"orighiredate_key", each Date.AddYears(Date.From(_), 9), type date},
            {"terminationdate_key", each Date.AddYears(Date.From(_), 9), type date},
            {"recorddate_key", each Date.AddYears(DateTime.Date(DateTime.From(_)), 9), type date},
            {"age", each Number.From(_), Int64.Type},
            {"length_of_service", each Number.From(_), Int64.Type},
            {"store_name", each Number.From(_), Int64.Type},
            {"STATUS_YEAR", each Number.From(_) + 9, Int64.Type}
        }
    ),
    #"renamedColumns" = Table.RenameColumns(fixedTypes, {{"store_name", "store_id"}})
in
    #"renamedColumns"