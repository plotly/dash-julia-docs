using Dash
using DashDaq


app = dash()

app.layout = daq_precisioninput(
  label="Label",
  labelPosition="top",
  precision=2,
  value=12
)  
run_server(app, "0.0.0.0", debug=true)