using Dash
using DashDaq


app = dash()

app.layout = daq_slider(
  min=0,
  max=100,
  value=50,
  handleLabel=Dict("showCurrentValue" =>  true,"label" => "VALUE"),
  step=10
)     
run_server(app, "0.0.0.0", debug=true)