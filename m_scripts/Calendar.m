// Calendar
let
    startDate = List.Min(EmployeeHistory[recorddate_key]),
    endDate = List.Max(AnnualHeadcount[recorddate_key]),
    durationInDays = Duration.Days(endDate - startDate) + 1,
    dateList = List.Dates(startDate, durationInDays, #duration(1, 0, 0, 0)),
    tableFromList = Table.FromList(dateList, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    renamedColumns = Table.RenameColumns(tableFromList, {{"Column1", "date"}}),
    changedType = Table.TransformColumnTypes(renamedColumns, {{"date", type date}}),
    insertedYear = Table.AddColumn(changedType, "year", each Date.Year([date]), Int64.Type),
    insertedMonth = Table.AddColumn(insertedYear, "month_number", each Date.Month([date]), Int64.Type),
    insertedMonthName = Table.AddColumn(
        insertedMonth, "month_name", each Date.ToText([date], "MMMM", "en-US"), type text
    ),
    insertedDay = Table.AddColumn(insertedMonthName, "day_of_month", each Date.Day([date]), Int64.Type),
    insertedDayOfWeek = Table.AddColumn(
        insertedDay, "day_of_week", each Date.DayOfWeek([date], Day.Sunday), Int64.Type
    ),
    insertedDayName = Table.AddColumn(
        insertedDayOfWeek, "day_name", each Date.ToText([date], "dddd", "en-US"), type text
    ),
    insertedQuarter = Table.AddColumn(
        insertedDayName, "quarter", each "Q" & Text.From(Date.QuarterOfYear([date])), type text
    ),
    insertedYearMonthSort = Table.AddColumn(
        insertedQuarter, "year_month_sort", each [year] * 100 + [month_number], Int64.Type
    )
in
    insertedYearMonthSort
