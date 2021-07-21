using Dash
using DashDaq

app = dash()

app.layout = daq_booleanswitch(
  disabled=true,
  label="Disabled",
  labelPosition="bottom"
)  
run_server(app, "0.0.0.0", debug=true)