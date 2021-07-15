using Dash
using DashDaq

app = dash()

app.layout = daq_gauge(
  color="#9B51E0",
  value=2,
  label="Default",
  max=5,
  min=0,
)  

run_server(app, "0.0.0.0", debug=true)