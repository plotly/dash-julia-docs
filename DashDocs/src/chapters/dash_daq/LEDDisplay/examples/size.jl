using Dash
using DashDaq


app = dash()

app.layout = daq_leddisplay(
  label="Large",
    value="9:34",
    size=64,
)  

run_server(app, "0.0.0.0", debug=true)