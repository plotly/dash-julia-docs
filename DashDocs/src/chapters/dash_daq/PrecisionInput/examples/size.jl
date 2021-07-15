using Dash
using DashDaq


app = dash()

app.layout = daq_precisioninput(
    size=120,
    precision=4,
    value=245
)    
run_server(app, "0.0.0.0", debug=true)