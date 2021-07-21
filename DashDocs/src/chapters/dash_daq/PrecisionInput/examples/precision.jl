using Dash
using DashDaq


app = dash()

app.layout = daq_precisioninput(
    precision=2,
    value=125
)   
run_server(app, "0.0.0.0", debug=true)