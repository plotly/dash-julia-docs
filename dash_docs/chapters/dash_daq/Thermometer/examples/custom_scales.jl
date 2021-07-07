using Dash
using DashDaq


app = dash()

app.layout = daq_thermometer(
  value=5,
  scale=Dict("start" => 2, "interval" => 3,
  "labelInterval" => 2, "custom" => Dict(
      "2" => "ideal temperature",
      "5" => "projected temperature"
  ))
)  

run_server(app, "0.0.0.0", debug=true)