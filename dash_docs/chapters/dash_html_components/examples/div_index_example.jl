using Dash, DashHtmlComponents

app = dash()

app.layout = html_div([
    html_h1("Hello Dash"),
    html_div([
        html_p("Dash converts Julia classes into HTML"),
        html_p("This conversion happens behind the scenes by Dash's JavaScript front-end")
    ])
])

run_server(app, "0.0.0.0", debug=true)