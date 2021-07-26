using Dash
using DashDaq

app = dash()

app.layout = daq_gauge(
  color=Dict("gradient" => true,"ranges" => Dict("green" => [0,6],"yellow" => [6,8],"red" => [8,10])),
  value=2,
  label="Default",
  max=10,
  min=0,
)  

run_server(app, "0.0.0.0", debug=true)