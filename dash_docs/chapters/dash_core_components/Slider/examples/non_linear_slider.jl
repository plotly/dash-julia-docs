using Dash, DashHtmlComponents, DashCoreComponents


app = dash()

function transform_value(value)
    10 ^ value
end


app.layout = html_div() do
    dcc_slider(
        id="slider-updatemode",
        marks=Dict([i => ("$(10 ^ i)") for i = 1:4]),
        max=3,
        value=2,
        step=0.01,
        updatemode="drag"
    ),
    html_div(id="slider-updatemode-output-container")
end

callback!(
    app,
    Output("slider-updatemode-output-container", "children"),
    Input("slider-updatemode", "value"),
) do value
    return "Linear Value: $value | Log Value: $(transform_value(value))"
end

run_server(app, "0.0.0.0", debug=true)
