using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/multline_height_constrain.csv", DataFrame)


app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_cell=Dict(
        "overflow" => "hidden",
        "textOverflow" => "ellipsis",
        "maxWidth" => 0
    ),
    tooltip_data=map(eachrow(df)) do r
      Dict(names(r) .=> string.(values(r)))
    end,
    tooltip_duration=nothing
    
)

run_server(app, "0.0.0.0", debug=true)