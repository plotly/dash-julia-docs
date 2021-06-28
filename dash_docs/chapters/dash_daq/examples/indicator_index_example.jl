using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_indicator(
  id="my-daq-indicator",
  value=true,
  color="#00cc96"
)  

run_server(app, "0.0.0.0", debug=true)