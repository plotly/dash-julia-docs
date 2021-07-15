using Dash
using DashDaq


app = dash()

app.layout = daq_leddisplay(
  label="color",
    value="1.001",
    color="#FF5E5E"
)  

run_server(app, "0.0.0.0", debug=true)