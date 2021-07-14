using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_knob(
  id="my-daq-knob",
  min=0,
  max=10,
  value=8
)  

run_server(app, "0.0.0.0", debug=true)