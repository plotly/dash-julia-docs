using Dash
using DashDaq


app = dash()

app.layout = daq_knob(
  label="Scale",
  value=7,
  max=18,
  scale=Dict("start" => 0, "labelInterval" =>  3, "interval" =>  3)
)  

run_server(app, "0.0.0.0", debug=true)