using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_toggleswitch(
  id="my-daq-toggleswitch"
)  

run_server(app, "0.0.0.0", debug=true)