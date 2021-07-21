using Dash
using DashDaq

app = dash()

app.layout = daq_colorpicker(
  label="Small",
  size=164,
)  

run_server(app, "0.0.0.0", debug=true)