using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_textarea(
        id="textarea-example",
        placeholder="Enter a value...",
        value="Textarea content initialized\nwith multiple lines of text",
        style=Dict("width" => "100%", "height" => 300)
    ),
    html_div(id="textarea-output", style=Dict("whiteSpace" => "pre"))
end

callback!(
    app,
    Output("textarea-output", "children"),
    Input("textarea-example", "value"),
) do value
    return "You have entered:\n$value"
end


run_server(app, "0.0.0.0", debug=true)
