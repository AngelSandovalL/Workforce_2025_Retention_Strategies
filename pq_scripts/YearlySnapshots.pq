// YearlySnapshots
let
    // Set a dynamic path to dataset file, requires a Named Range on your .xlsx use function 'CELL('filename') then add a name to it.
    fileLocation = Excel.CurrentWorkbook(){[Name = "pPath"]}[Content]{0}[Column1],
    folderLocation = Text.BeforeDelimiter(fileLocation, "\", {0, RelativePosition.FromEnd}) & "\",
    source = Csv.Document(
        Web.Contents(folderLocation & "MFG10YearTerminationData.csv"),
        [
            Delimiter = ",",
            Columns = 18,
            Encoding = 1252,
            QuoteStyle = QuoteStyle.None
        ]
    ),
    #"promotedHeaders" = Table.PromoteHeaders(source, [PromoteAllScalars = true]),
    #"fixedTypes" = Table.TransformColumnTypes(
        #"promotedHeaders",
        {
            {"birthdate_key", type date},
            {"orighiredate_key", type date},
            {"terminationdate_key", type date},
            {"recorddate_key", type datetime},
            {"age", Int64.Type},
            {"length_of_service", Int64.Type},
            {"store_name", Int64.Type},
            {"STATUS_YEAR", Int64.Type}
        }
    ),
    // Change datetime to date for "recorddate_key" due to PowerQuery limitations
    #"fixedTypes2" = Table.TransformColumnTypes(#"fixedTypes", {{"recorddate_key", type date}})
in
    #"fixedTypes2"
