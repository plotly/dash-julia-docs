using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/nz_weather.csv"), DataFrame)

nme = names(df)
app = dash()

app.layout = DashTable.dash_datatable(
    data=Dict.(pairs.(eachrow(df))),
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    tooltip_data=[
        Dict(
          [n =>  Dict("value" =>  string(df[row,n]), "type" =>  "markdown")
            for n in nme]
        ) for row in 1:nrow(df)
    ],

    # Overflow into ellipsis
    style_cell=Dict(
        "overflow" =>  "hidden",
        "textOverflow" =>  "ellipsis",
        "maxWidth" =>  0,
    ),
    tooltip_delay=0,
    tooltip_duration = nothing
)

run_server(app, "0.0.0.0", debug=true)