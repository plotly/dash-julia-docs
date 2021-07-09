using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_powerbutton(
  id="my-daq-powerbutton",
  on=true
) 

run_server(app, "0.0.0.0", debug=true)