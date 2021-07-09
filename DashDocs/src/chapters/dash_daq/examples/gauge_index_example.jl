using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_gauge(
  id="my-daq-gauge",
  min=0,
  max=10,
  value=6
)  

run_server(app, "0.0.0.0", debug=true)