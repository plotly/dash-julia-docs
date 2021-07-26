using Dash
using DashDaq


app = dash()

app.layout = daq_graduatedbar(
  color=("gradient" =>true,"ranges" =>("green" =>[0,4],"yellow" =>[4,7],"red" =>[7,10])),
  showCurrentValue=true,
  value=10
)  

run_server(app, "0.0.0.0", debug=true)