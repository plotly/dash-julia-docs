using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()

app.layout = daq_slider(
  id="my-daq-slider",
  value=17,
  min=0,
  max=100,
  targets=Dict("25" => Dict("label" => "TARGET"))
)  

run_server(app, "0.0.0.0", debug=true)