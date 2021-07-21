using Dash
using DashDaq

app = dash()

app.layout = daq_colorpicker(
  label="Color Picker",
  value=(hex="#0000FF",),
)   
run_server(app, "0.0.0.0", debug=true)