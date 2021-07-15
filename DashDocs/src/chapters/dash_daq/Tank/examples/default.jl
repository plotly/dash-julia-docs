using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_tank(
      id="my-tank",
      value=5,
      min=0,
      max=10,
      style=Dict("margin-left" => "50px")
  ),
  dcc_slider(
      id="tank-slider",
      value=5,
      min=0,
      max=10,
  ),
])


callback!(app,
  Output("my-tank", "value"),
  [Input("tank-slider", "value")]) do value
  return value
end

run_server(app, "0.0.0.0", debug=true)