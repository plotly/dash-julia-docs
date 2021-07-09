using Dash, DashCoreComponents

app = dash()

app.layout = dcc_location(id="url", refresh=false)

run_server(app, "0.0.0.0", debug=true)