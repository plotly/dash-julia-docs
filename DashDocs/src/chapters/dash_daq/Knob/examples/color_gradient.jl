using Dash
using DashDaq


app = dash()

app.layout = daq_knob(
  label="Gradient Ranges",
  value=7,
  color=Dict("gradient" => true,"ranges" => Dict("green" => [0,5],"yellow" => [5,9],"red" => [9,10]))
)  

run_server(app, "0.0.0.0", debug=true)