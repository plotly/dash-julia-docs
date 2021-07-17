using Dash
using DashDaq


app = dash()

app.layout = daq_gauge(
  size=200,
  value=2,
  label="Default",

) 


run_server(app, "0.0.0.0", debug=true)