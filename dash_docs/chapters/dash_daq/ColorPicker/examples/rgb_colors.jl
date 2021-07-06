using Dash
using DashDaq

app = dash()

app.layout = daq_colorpicker(
  label="Color Picker",
  value=Dict("rgb"=>(r=255, g=0, b=0, a=0))
  )  
run_server(app, "0.0.0.0", debug=true)