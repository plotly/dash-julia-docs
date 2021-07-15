using Dash
using DashDaq


app = dash()

app.layout = daq_precisioninput(
  precision=2,
  value=15,
  max=20,
  min=10
)   
run_server(app, "0.0.0.0", debug=true)