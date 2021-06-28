using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_joystick(
  id="my-daq-joystick"
)  

run_server(app, "0.0.0.0", debug=true)
