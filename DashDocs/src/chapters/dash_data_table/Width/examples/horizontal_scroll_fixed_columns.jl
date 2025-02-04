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
    fixed_columns=Dict("headers" =>  true, "data" =>  1),
    style_table=Dict("minWidth" =>  "100%")
    
)

run_server(app, "0.0.0.0", debug=true)