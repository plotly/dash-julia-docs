using Dash
using DashDaq


app = dash()

app.layout = daq_thermometer(
  min=95,
  max=105,
  value=100,
  showCurrentValue=true,
  units="C"
)  
run_server(app, "0.0.0.0", debug=true)