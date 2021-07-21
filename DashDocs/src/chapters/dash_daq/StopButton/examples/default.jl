using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  daq_stopbutton(
      id="my-stop-button",
      label="Default",
      n_clicks=0
  ),
  html_div(id="stop-button-output")
])


callback!(app,
  Output("stop-button-output", "children"),
  [Input("my-stop-button", "n_clicks")]) do n_clicks
  return "The stop button has been clicked $n_clicks times."
end

run_server(app, "0.0.0.0", debug=true)