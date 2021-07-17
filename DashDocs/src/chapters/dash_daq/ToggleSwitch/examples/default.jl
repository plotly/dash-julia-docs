using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_toggleswitch(
      id="my-toggle-switch",
      value=false
  ),
  html_div(id="toggle-switch-output")
])

callback!(app,
  Output("toggle-switch-output", "children"),
  [Input("my-toggle-switch", "value")]) do value
  return "The switch is $value."
end

run_server(app, "0.0.0.0", debug=true)