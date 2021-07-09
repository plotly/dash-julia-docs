using Dash, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_colorpicker(
  id="my-daq-colorpicker",
  label="colorPicker"
)  
run_server(app, "0.0.0.0", debug=true)
