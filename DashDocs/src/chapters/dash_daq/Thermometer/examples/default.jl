using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_thermometer(
      id="my-thermometer",
      value=5,
      min=0,
      max=10,
      style=Dict(
          "margin-bottom" => "5%"
      )
  ),
  dcc_slider(
      id="thermometer-slider",
      value=5,
      min=0,
      max=10,

  ),
])


callback!(app,
  Output("my-thermometer", "value"),
  [Input("thermometer-slider", "value")]) do value
  return value
end

run_server(app, "0.0.0.0", debug=true)