using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_precisioninput(
      id="my-precision",
      label="Default",
      precision=4,
      value=1234
  ),
  html_div(id="precision-output")
])


callback!(app,
  Output("precision-output", "children"),
  [Input("my-precision", "value")]) do value
  return "The current value is $value."
end
run_server(app, "0.0.0.0", debug=true)