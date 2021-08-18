using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_button("Click here to see the content", id="show-secret"),
    html_div(id="body-div")
end

callback!(
    app,
    Output("body-div", "children"),
    Input("show-secret", "n_clicks")
) do n_clicks
    if isnothing(n_clicks)
        throw(PreventUpdate())
    end
    return "Elephants are the only animal that can't jump"
end

run_server(app, "0.0.0.0", debug=true)
