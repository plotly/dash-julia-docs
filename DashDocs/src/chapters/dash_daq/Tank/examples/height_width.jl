using Dash
using DashDaq


app = dash()

app.layout = daq_tank(
  height=75,
  width=200,
  value=6,
  style=Dict("margin-left" => "50px")
)  
run_server(app, "0.0.0.0", debug=true)