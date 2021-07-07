using Dash
using DashDaq


app = dash()

app.layout = daq_knob(
  max=100,
  value=3
)  

run_server(app, "0.0.0.0", debug=true)