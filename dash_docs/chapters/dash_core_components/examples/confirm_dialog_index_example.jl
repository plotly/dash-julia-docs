using Dash, DashCoreComponents
app = dash()
app.layout = dcc_confirmdialog(
    id="confirm",
    message="Danger danger! Are you sure you want to continue?"
)
run_server(app, "0.0.0.0", debug=true)

