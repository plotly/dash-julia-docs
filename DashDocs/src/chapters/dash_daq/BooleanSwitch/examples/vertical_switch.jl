using Dash
using DashDaq

app = dash()

app.layout = daq_booleanswitch(
  on=true,
  label="Vertical",
  vertical=true
)  

run_server(app, "0.0.0.0", debug=true)