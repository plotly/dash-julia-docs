using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

df = DataFrame([
        (climate = "Sunny", temperature = 13, city ="NYC"),
        (climate = "Snowy", temperature = 43, city ="Montreal"),
        (climate = "Sunny", temperature = 50, city ="Miami"),
        (climate = "Rainy", temperature = 30, city ="NYC")
])

app.layout = html_div([
    DashTable.dash_datatable(
        id="table-dropdown",
        data = Dict.(pairs.(eachrow(df))),
        columns=[Dict("name" =>  i, "id" =>  i, "presentation" =>  "dropdown") for i in names(df)],
        editable=true,
        dropdown=Dict(
            "climate" =>  Dict(
                "options" =>  [
                    Dict("label" =>  i, "value" =>  i)
                    for i in unique(df[!,"climate"])
                ]
            ),
            "city" =>  Dict(
                 "options" =>  [
                    Dict("label" =>  i, "value" =>  i)
                    for i in unique(df[!,"city"])
                ]
            )
        )
    ),
    html_div(id="table-dropdown-container")
])

run_server(app, "0.0.0.0", debug=true)
