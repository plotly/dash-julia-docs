using Dash
using DashDaq


app = dash()

app.layout = daq_graduatedbar(
  showCurrentValue=true,
  max=100,
  value=38
)  


run_server(app, "0.0.0.0", debug=true)