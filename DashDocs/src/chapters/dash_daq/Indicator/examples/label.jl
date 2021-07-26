using Dash
using DashDaq

app = dash()

app.layout = daq_indicator(
  label="Label",
  labelPosition="bottom",
  value=true
)  

run_server(app, "0.0.0.0", debug=true)