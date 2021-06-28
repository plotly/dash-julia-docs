using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_graduatedbar(
  id="my-daq-graduatedbar",
  value=4
)  

run_server(app, "0.0.0.0", debug=true)