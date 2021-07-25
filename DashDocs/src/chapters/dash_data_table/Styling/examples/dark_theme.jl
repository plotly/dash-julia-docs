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
    style_header=Dict("backgroundColor" =>  "rgb(30, 30, 30)"),
    style_cell=Dict(
        "backgroundColor" =>  "rgb(50, 50, 50)",
        "color" =>  "white"
    ),
    
)

run_server(app, "0.0.0.0", debug=true)