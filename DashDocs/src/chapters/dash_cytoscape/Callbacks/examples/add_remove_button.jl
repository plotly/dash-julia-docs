using Dash, DashHtmlComponents

app = dash()

app.layout = html_div([
    html_button("Add Node", id="btn-add-node-example", n_clicks_timestamp=0),
    html_button("Remove Node", id="btn-remove-node-example", n_clicks_timestamp=0)
])
run_server(app, "0.0.0.0", debug=true)