using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_data_conditional=[
        Dict(
            "if" =>  Dict(
                "filter_query" =>  "{Humidity} > 19 && {Humidity} < 41",
                "column_id" =>  "Humidity"
            ),
            "color" =>  "tomato",
            "fontWeight" =>  "bold"
        ),
        Dict(
            "if" =>  Dict(
                "filter_query" =>  "{Pressure} > 19",
                "column_id" =>  "Pressure"
            ),
            "textDecoration" =>  "underline"
        )
    ]
    
)

run_server(app, "0.0.0.0", debug=true)