using Dash
using DashDaq


app = dash()

app.layout = daq_stopbutton(
  size=120,
)    
run_server(app, "0.0.0.0", debug=true)