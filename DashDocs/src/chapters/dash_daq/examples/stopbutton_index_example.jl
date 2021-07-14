using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_stopbutton(
  id="my-daq-stopbutton"
)  

run_server(app, "0.0.0.0", debug=true)