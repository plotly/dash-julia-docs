using Dash, DashCoreComponents, DashHtmlComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    html_div(dcc_input(id="input-on-submit", type="text")),
    html_button("Submit", id="submit-val", n_clicks=0),
    html_div(id="container-button-basic",
             children="Enter a value and press submit")
])

callback!(app,
    Output("container-button-basic", "children"),
    Input("submit-val", "n_clicks"),
    State("input-on-submit", "value")) do n_clicks, value
    return "The input value was $value and the button has been clicked $n_clicks times"
end

run_server(app, "0.0.0.0", debug=true)