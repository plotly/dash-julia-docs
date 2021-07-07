using Dash
using DashDaq


app = dash()

app.layout = daq_thermometer(
  value=5,
  height=150,
  width=5
)   
run_server(app, "0.0.0.0", debug=true)