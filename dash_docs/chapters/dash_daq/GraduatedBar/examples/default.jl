using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_graduatedbar(
      id="my-graduated-bar",
      label="Default",
      value=6
  ),
  dcc_slider(
      id="my-graduated-bar-slider",
      min=0,
      max=10,
      step=1,
      value=5
  ),
])


callback!(app,
  Output("my-graduated-bar", "value"),
  [Input("my-graduated-bar-slider", "value")]
) do value
  return value
end

run_server(app, "0.0.0.0", debug=true)