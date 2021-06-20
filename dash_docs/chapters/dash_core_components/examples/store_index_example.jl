using Dash, DashCoreComponents
app = dash()
app.layout = dcc_store(id="my-store", data=Dict("my-data" => "data"))
run_server(app, "0.0.0.0", debug=true)