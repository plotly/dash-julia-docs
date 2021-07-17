using Dash
using DashDaq

app = dash()

app.layout = daq_booleanswitch(
  on=true,
  color="#9B51E0",
)  

run_server(app, "0.0.0.0", debug=true)