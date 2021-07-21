using Dash
using DashDaq


app = dash()

app.layout = daq_leddisplay(
  label="Label",
  labelPosition="bottom",
  value="12:34"
)  

run_server(app, "0.0.0.0", debug=true)