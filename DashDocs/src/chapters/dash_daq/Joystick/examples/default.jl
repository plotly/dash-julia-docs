using Dash, DashHtmlComponents, DashCoreComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  daq_joystick(
      id="my-joystick",
      label="Default",
      angle=0
  ),
  html_div(id="joystick-output")
])


callback!(app,
  Output("joystick-output", "children"),
  [Input("my-joystick", "angle"),
   Input("my-joystick", "force")]) do angle, force 
  return ["Angle is $angle",
          html_br(),
          "Force is $force"]
end
run_server(app, "0.0.0.0", debug=true)