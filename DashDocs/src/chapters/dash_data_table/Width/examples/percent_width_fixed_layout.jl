using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    css=[Dict("selector" =>  "table", "rule" =>  "table-layout =>  fixed")],
    style_cell=Dict(
        "width" =>  "$(ncol(df))%",
        "textOverflow" =>  "ellipsis",
        "overflow" =>  "hidden"
    )
    
)

run_server(app, "0.0.0.0", debug=true)