using Dash
using DashDaq


app = dash()

app.layout = daq_gauge(
  value=5,
  label="Default",
  max=20,
  min=0,
)  


run_server(app, "0.0.0.0", debug=true)