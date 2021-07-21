using Dash
using DashDaq


app = dash()

app.layout = daq_slider(
  vertical=true
)     
run_server(app, "0.0.0.0", debug=true)