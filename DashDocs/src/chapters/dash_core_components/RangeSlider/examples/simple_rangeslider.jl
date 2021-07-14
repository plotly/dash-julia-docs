using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        id="my-range-slider-1",
        count=1,
        min=-5,
        max=10,
        step=0.5,
        value=[-3, 7]
    ),
    html_div(id="range-slider-output-container")
end

callback!(
    app,
    Output("range-slider-output-container", "children"),
    Input("my-range-slider-1", "value"),
) do value
    return "You have selected \"$value\""
end

run_server(app, "0.0.0.0", debug=true)
