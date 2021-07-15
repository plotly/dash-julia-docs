using Dash
using DashDaq


app = dash()

app.layout = daq_slider(
  min=0, max=100, value=30,
  marks=Dict("25" =>  "mark", "50" =>  "50")
)    
run_server(app, "0.0.0.0", debug=true)