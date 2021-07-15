using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_leddisplay(
      id="my-LED-display",
      label="Default",
      value=6
  ),
  dcc_slider(
      id="my-LED-display-slider",
      min=0,
      max=10,
      step=1,
      value=5
  ),
])


callback!(app,
  Output("my-LED-display", "value"),
  [Input("my-LED-display-slider", "value")]
) do value
  return string(value)
end
run_server(app, "0.0.0.0", debug=true)