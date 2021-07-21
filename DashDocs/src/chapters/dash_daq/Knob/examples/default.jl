using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_knob(
      id="my-knob",
  ),
  html_div(id="knob-output")
])


callback!(app,
  Output("knob-output", "children"),
  [Input("my-knob", "value")]) do value
  return "The knob value is $value."
end
run_server(app, "0.0.0.0", debug=true)