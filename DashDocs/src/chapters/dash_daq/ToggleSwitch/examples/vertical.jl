using Dash
using DashDaq


app = dash()

app.layout = daq_toggleswitch(
  vertical=true
)  

run_server(app, "0.0.0.0", debug=true)