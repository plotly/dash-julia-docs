using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames 

app = dash()

df = DataFrame([
        (City = "NYC", Neighborhood = "Brooklyn", Temperature  =70),
        (City = "Montreal", Neighborhood = "Mile End", Temperature  =60),
        (City = "Los-Angeles", Neighborhood = "Venice", Temperature  =90)
])

app.layout = html_div([
    DashTable.dash_datatable(
        id="dropdown_per_row",
        data=Dict.(pairs.(eachrow(df))),
        columns=[
            Dict("id"=> "City", "name"=> "City"),
            Dict("id"=> "Neighborhood", "name"=> "Neighborhood", "presentation"=> "dropdown"),
            Dict("id"=> "Temperature", "name"=> "Temperature")
        ],
        editable=true,
        dropdown_conditional =
        [
            Dict(
                "if"=> Dict(
                    "column_id"=> "Neighborhood",
                    "filter_query"=> "{City} eq $(string("NYC"))"
                ),
                "options"=> [
                    Dict("label"=> i, "value"=> i)
                    for i in [
                        "Brooklyn",
                        "Queens",
                        "Staten Island"
                    ]
                ]
            ), 
            Dict(
                "if"=> Dict(
                    "column_id"=> "Neighborhood",
                    "filter_query"=> "{City} eq $(string("Montreal"))"
                ),
                "options"=> [
                    Dict("label"=> i, "value"=> i)
                    for i in [
                        "Mile End",
                        "Plateau",
                        "Hochelaga"
                    ]
                ] 
            ),
            Dict(
                "if"=> Dict(
                    "column_id"=> "Neighborhood",
                    "filter_query"=> "{City} eq $(string("Los-Angeles"))"
                ),
                "options"=> [
                    Dict("label"=> i, "value"=> i)
                    for i in [
                        "Venice",
                        "Hollywood",
                        "Los Feliz"
                    ]
                ] 
            )
        ]
    ),
    html_div(id="dropdown_per_row_container")
])

run_server(app, "0.0.0.0", debug=true)
