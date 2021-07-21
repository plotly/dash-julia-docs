using Dash
using DashDaq


app = dash()

app.layout = daq_joystick(
  size=250
)  

run_server(app, "0.0.0.0", debug=true)