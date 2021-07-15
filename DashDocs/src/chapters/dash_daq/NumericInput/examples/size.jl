
using Dash
using DashDaq


app = dash()

app.layout = daq_numericinput(
  value=10,
  size=120
)  

run_server(app, "0.0.0.0", debug=true)