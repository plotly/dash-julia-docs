using Dash
using DashDaq


app = dash()

app.layout = daq_gauge(
  label="Scale",
  scale=Dict("start" => 0, "interval" => 3, "labelInterval" => 2),
  value=3,
  min=0,
  max=24,
)  


run_server(app, "0.0.0.0", debug=true)