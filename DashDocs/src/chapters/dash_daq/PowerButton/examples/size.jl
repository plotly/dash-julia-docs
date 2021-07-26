using Dash
using DashDaq


app = dash()

app.layout = daq_powerbutton(
  on=true,
  size=100
)  

run_server(app, "0.0.0.0", debug=true)