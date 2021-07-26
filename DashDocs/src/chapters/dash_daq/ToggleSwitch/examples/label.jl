using Dash
using DashDaq


app = dash()

app.layout = daq_toggleswitch(
  label="My toggle switch",
  labelPosition="bottom"
)  

run_server(app, "0.0.0.0", debug=true)