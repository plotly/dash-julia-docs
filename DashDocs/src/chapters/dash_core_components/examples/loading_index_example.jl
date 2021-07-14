using Dash, DashHtmlComponents, DashCoreComponents
app = dash()
app.layout = dcc_loading([
    # ...
])
run_server(app, "0.0.0.0", debug=true)