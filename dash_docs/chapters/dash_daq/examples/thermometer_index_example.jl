using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_thermometer(
  id="my-daq-thermometer",
  min=95,
  max=105,
  value=98.6
)  

run_server(app, "0.0.0.0", debug=true)