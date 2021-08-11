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
    fixed_rows=Dict("headers" => true),
    style_header=Dict(
      "overflow" => "hidden",
      "textOverflow" => "ellipsis",
      "maxWidth" => 0,
  )
)

run_server(app, "0.0.0.0", debug=true)