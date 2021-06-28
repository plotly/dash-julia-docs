using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_booleanswitch(
  id="my-daq-booleanswitch",
  on=true
)  
run_server(app, "0.0.0.0", debug=true)