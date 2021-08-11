using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

app.layout = DashTable.dash_datatable(
    columns=[
        Dict("name" =>  ["", "Year"], "id" =>  "year", "clearable" =>  "first" ),
        Dict("name" =>  ["City", "Montreal"], "id" =>  "montreal", "deletable" =>  [false, true]),
        Dict("name" =>  ["City", "Toronto"], "id" =>  "toronto", "renamable" =>  true ),
        Dict("name" =>  ["City", "Ottawa"], "id" =>  "ottawa", "hideable" =>  "last"),
        Dict("name" =>  ["City", "Vancouver"], "id" =>  "vancouver", "clearable" =>  true, "renamable" =>  true, "hideable" =>  true, "deletable" =>  true ),
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
    css=[
        Dict("selector" =>  ".column-header--delete svg", "rule" =>  "display:  none"),
        Dict("selector" =>  ".column-header--delete::before", "rule" =>  "content: X")
    ]
)

run_server(app, "0.0.0.0", debug=true)
