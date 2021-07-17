using Dash
using DashDaq

app = dash()

app.layout = daq_indicator(
  label="Off",
  value=false
)  

run_server(app, "0.0.0.0", debug=true)