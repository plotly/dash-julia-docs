using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_tank(
  id="my-daq-tank",
  min=0,
  max=10,
  value=5
)   

run_server(app, "0.0.0.0", debug=true)