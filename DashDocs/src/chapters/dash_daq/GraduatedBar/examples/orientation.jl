using Dash
using DashDaq


app = dash()

app.layout = daq_graduatedbar(
  vertical=true,
  value=10
)  


run_server(app, "0.0.0.0", debug=true)