using Dash
using DashDaq


app = dash()

app.layout = daq_joystick(
  label="Label",
  labelPosition="bottom"
)  


run_server(app, "0.0.0.0", debug=true)