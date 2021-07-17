using Dash
using DashDaq


app = dash()

app.layout = daq_tank(
  value=3,
  label="Tank label",
  labelPosition="bottom"
)  
run_server(app, "0.0.0.0", debug=true)