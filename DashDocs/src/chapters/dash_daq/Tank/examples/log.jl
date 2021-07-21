using Dash
using DashDaq


app = dash()

app.layout = daq_tank(
  min=0,
  max=10,
  value=300,
  logarithmic=true,
  base=3,
  style=Dict("margin-left" => "50px")
)  
run_server(app, "0.0.0.0", debug=true)