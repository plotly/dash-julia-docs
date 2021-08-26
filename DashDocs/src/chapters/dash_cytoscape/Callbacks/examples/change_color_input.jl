using Dash, DashHtmlComponents
app = dash()
app.layout = html_div([
        html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
            "Edge Color:  ",
            dcc_input(id="input-line-color", type="text")
        ]),
        html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
            "Node Color:  ",
            dcc_input(id="input-bg-color", type="text")
        ])
    ])
    run_server(app, "0.0.0.0", debug=true)