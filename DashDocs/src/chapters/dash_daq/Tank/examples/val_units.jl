using Dash
using DashDaq


app = dash()

app.layout = daq_tank(
  value=6,
  showCurrentValue=true,
  units="gallons",
  style=Dict("margin-left" => "50px")
)   
run_server(app, "0.0.0.0", debug=true)