using Dash
using DashDaq

app = dash()

app.layout = daq_indicator(
  label="Purple",
  color="#551A8B",
  value=true
)  

run_server(app, "0.0.0.0", debug=true)