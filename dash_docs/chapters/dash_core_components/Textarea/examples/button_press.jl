using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_textarea(
        id="textarea-state-example",
        placeholder="Enter a value...",
        value="Textarea content initialized\nwith multiple lines of text",
        style=Dict("width" => "100%", "height" => 200)
    ),
    html_button("Submit", id="textarea-state-example-button"),
    html_div(id="textarea-state-output", style=Dict("whiteSpace" => "pre"))
end

callback!(
    app,
    Output("textarea-state-output", "children"),
    Input("textarea-state-example-button", "n_clicks"),
    State("textarea-state-example", "value")
) do n_clicks, value
    if !isnothing(n_clicks)
        return "You have entered:\n$value"
    end
end


run_server(app, "0.0.0.0", debug=true)
