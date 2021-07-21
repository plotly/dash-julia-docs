using Dash
using DashDaq


app = dash()

app.layout = daq_numericinput(
  disabled=true,
  min=0,
  max=10,
  value=2
)  

run_server(app, "0.0.0.0", debug=true)