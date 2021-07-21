using Dash
using DashDaq


app = dash()

app.layout = daq_gauge(
  showCurrentValue=true,
  units="MPH",
  value=5,
  label="Default",
  max=10,
  min=0,
)  


run_server(app, "0.0.0.0", debug=true)