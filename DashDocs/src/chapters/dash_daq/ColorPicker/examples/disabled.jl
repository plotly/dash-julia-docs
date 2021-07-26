using Dash
using DashDaq

app = dash()

app.layout = daq_colorpicker(
  label="Color Picker",
  disabled=true,
)  
run_server(app, "0.0.0.0", debug=true)