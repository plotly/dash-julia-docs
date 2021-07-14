using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_precisioninput(
  id="my-daq-precisioninput",
  precision=4,
  value=299792458
) 

run_server(app, "0.0.0.0", debug=true)