using Dash
using DashDaq

app = dash()

app.layout = daq_indicator(
  label="Square",
  width=16,
  height=16
)   

run_server(app, "0.0.0.0", debug=true)