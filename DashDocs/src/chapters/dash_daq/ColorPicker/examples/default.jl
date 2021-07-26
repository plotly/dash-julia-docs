using Dash, DashHtmlComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_colorpicker(
      id="my-color-picker",
      label="Color Picker",
      value=(hex ="#119DFF",)
  ),
  html_div(id="color-picker-output")
])


callback!(app,
  Output("color-picker-output", "children"),
  [Input("my-color-picker", "value")]) do value
  return "The selected color is $value"
end
run_server(app, "0.0.0.0", debug=true)