using Dash
using DashDaq


app = dash()

app.layout = daq_tank(
  value=3,
  scale=Dict("interval" => 2, "labelInterval" => 2,
          "custom" => Dict("5" => "Set point")),
  style=Dict("margin-left" => "50px")
)  
run_server(app, "0.0.0.0", debug=true)