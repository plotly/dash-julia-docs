using Dash, DashCoreComponents, DashHtmlComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)
app.layout = html_div([
    dcc_confirmdialogprovider(
        children=html_button(
            "Click Me",
        ),
        id="danger-danger-provider",
        message="Danger danger! Are you sure you want to continue?"
    ),
    html_div(id="output-provider")
])


callback!(app, Output("output-provider", "children"),
              Input("danger-danger-provider", "submit_n_clicks")) do submit_n_clicks
    if submit_n_clicks isa Nothing
        return ""
    else
        return "It wasnt easy but we did it $(submit_n_clicks)"
    end
end

run_server(app, "0.0.0.0", debug=true)

