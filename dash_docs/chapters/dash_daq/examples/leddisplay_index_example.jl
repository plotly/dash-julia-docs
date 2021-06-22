using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_leddisplay(
  id="my-daq-leddisplay",
  value="3.14159"
)

run_server(app, "0.0.0.0", debug=true)