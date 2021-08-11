using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/long_col.csv", DataFrame)
app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    virtualization=true,
    fixed_rows=Dict("headers" => true),
    style_cell=Dict(
        "minWidth" =>  95, "maxWidth" =>  95, "width" =>  95
    ),
    style_table=Dict("height" => 300)  # default is 500
)

run_server(app, "0.0.0.0", debug=true)