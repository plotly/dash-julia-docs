using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_numericinput(
      id="my-numeric-input",
      value=0
  ),
  html_div(id="numeric-input-output")
])


callback!(app,
  Output("numeric-input-output", "children"),
  [Input("my-numeric-input", "value")]) do value
  return "The value is $value."
end
run_server(app, "0.0.0.0", debug=true)