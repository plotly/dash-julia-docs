using Dash
using DashDaq


app = dash()

app.layout = daq_precisioninput(
  disabled=true,
  precision=4,
  value=9999
)     
run_server(app, "0.0.0.0", debug=true)