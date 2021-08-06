using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

app.layout =  DashTable.dash_datatable(
    data=Dict.(pairs.(eachrow(df))),
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    tooltip_data=[
      Dict(
          column =>  Dict("value" =>  string(value), "type" =>  "markdown")
          for (column, value) in row
      ) for row in Dict.(pairs.(eachrow(df)))
  ],
  css=[Dict(
      "selector" =>  ".dash-table-tooltip",
      "rule" =>  "background-color =>  white; font-family =>  monospace;"
  )],

  tooltip_delay=0,
  tooltip_duration=nothing
)
 
run_server(app, "0.0.0.0", debug=true)
