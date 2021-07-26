using Dash
using DashDaq


app = dash()

app.layout = daq_knob(
  size=140,
  value=3
)  

run_server(app, "0.0.0.0", debug=true)