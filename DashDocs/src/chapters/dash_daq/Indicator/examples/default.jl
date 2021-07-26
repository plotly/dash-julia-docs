using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_indicator(
      id="my-indicator",
      label="Default",
  ),
  html_button(
      "On/Off",
      id="my-indicator-button",
      n_clicks=0
  ),
])


callback!(app,
  Output("my-indicator", "value"),
  [Input("my-indicator-button", "n_clicks")]
) do value
  if value % 2 == 0
      value = true
  else
      value = false
  end
  return value
end
run_server(app, "0.0.0.0", debug=true)