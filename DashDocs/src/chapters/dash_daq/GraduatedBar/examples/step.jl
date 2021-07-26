using Dash
using DashDaq


app = dash()

app.layout = daq_graduatedbar(
  step=2,
  max=100,
  value=50
) 


run_server(app, "0.0.0.0", debug=true)