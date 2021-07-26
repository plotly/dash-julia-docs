using Dash
using DashDaq


app = dash()

app.layout = daq_thermometer(
  value=5,
  label="Current temperature",
  labelPosition="top"
)    

run_server(app, "0.0.0.0", debug=true)