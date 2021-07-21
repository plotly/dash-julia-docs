using Dash, DashCoreComponents
using RDatasets

app = dash()


app.layout = dcc_graph(
  id="example-graph",
  figure=Dict(
      "data" => [
          Dict("x" => [1, 2, 3], "y" => [4, 1, 2], "type" => "bar", "name" => "SF"),
          Dict("x" => [1, 2, 3], "y" => [2, 4, 5], "type" => "bar", "name" => "Montréal"),
      ],
      "layout" => Dict(
          "title" => "Dash Data Visualization"
      )
  )
)

run_server(app, "0.0.0.0", debug=true)


