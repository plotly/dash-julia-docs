using Dash
using DashDaq


app = dash()

app.layout = daq_powerbutton(
  on=true,
  label="Label",
  labelPosition="top"
)  

run_server(app, "0.0.0.0", debug=true)