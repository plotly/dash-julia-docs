using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_powerbutton(
      id="my-power-button",
      on=false
  ),
  html_div(id="power-button-output")
])


callback!(app,
  Output("power-button-output", "children"),
  [Input("my-power-button", "on")]) do on
  return "The button is $on."
end
run_server(app, "0.0.0.0", debug=true)