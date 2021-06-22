using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div([
    html_div("Example Div", style=Dict("color" => "blue", "fontSize" => 14)),
    html_p("Example P", className="my-class", id="my-p-element")
], style=Dict("marginBottom" => 50, "marginTop" => 25))
run_server(app, "0.0.0.0", debug=true)