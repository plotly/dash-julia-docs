using Dash
using DashDaq


app = dash()

app.layout = daq_powerbutton(
  on=true,
  color="#FF5E5E"
) 

run_server(app, "0.0.0.0", debug=true)