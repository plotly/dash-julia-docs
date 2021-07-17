using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_slider(
      id="my-daq-slider-ex",
      value=17
  ),
  html_div(id="slider-output")
])


callback!(app,
  Output("slider-output", "children"),
  [Input("my-daq-slider-ex", "value")]) do value
  return "The slider is currently at $value."
end

run_server(app, "0.0.0.0", debug=true)