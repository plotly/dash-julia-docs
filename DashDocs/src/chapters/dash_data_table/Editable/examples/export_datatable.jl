using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

app.layout = DashTable.dash_datatable(
    columns=[
        Dict("name" =>  ["", "Year"], "id" =>  "year" ),
        Dict("name" =>  ["City", "Montreal"], "id" =>  "montreal", "deletable" =>  [false, true]),
        Dict("name" =>  ["City", "Toronto"], "id" =>  "toronto", "renamable" =>  true ),
        Dict("name" =>  ["City", "Ottawa"], "id" =>  "ottawa", "hideable" =>  "last"),
        Dict("name" =>  ["City", "Vancouver"], "id" =>  "vancouver"),
        Dict("name" =>  ["Climate", "Temperature"], "id" =>  "temp"),
        Dict("name" =>  ["Climate", "Humidity"], "id" =>  "humidity"),
    ],
    data=[
        Dict(
            "year" =>  i,
            "montreal" =>  i * 10,
            "toronto" =>  i * 100,
            "ottawa" =>  i * -1,
            "vancouver" =>  i * -10,
            "temp" =>  i * -100,
            "humidity" =>  i * 5,
        )
        for i in 1:10
    ],
    export_format="xlsx",
    export_headers="display",
    merge_duplicate_headers=true
)

run_server(app, "0.0.0.0", debug=true)
