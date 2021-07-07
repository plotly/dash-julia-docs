using Dash
using DashDaq


app = dash()

app.layout = daq_slider(
  id="my-daq-slider",
  value=17,
  handleLabel="Handle"
)     
run_server(app, "0.0.0.0", debug=true)