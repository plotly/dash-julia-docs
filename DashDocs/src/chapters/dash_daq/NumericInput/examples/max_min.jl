

using Dash
using DashDaq


app = dash()

app.layout = daq_numericinput(
    min=0,
    max=100,
    value=20
)  

run_server(app, "0.0.0.0", debug=true)