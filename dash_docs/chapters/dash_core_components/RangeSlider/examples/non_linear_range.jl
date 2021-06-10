using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

function transform_value(value)
    10 ^ value
end


app.layout = html_div() do
    dcc_rangeslider(
        id="non-linear-slider-updatemode",
        marks=Dict([i => ("$(10 ^ i)") for i = 1:4]),
        max=3,
        value=[0.1, 2],
        step=0.01,
        updatemode="drag"
    ),
    html_div(id="non-linear-slider-updatemode-output-container")
end

callback!(
    app,
    Output("non-linear-slider-updatemode-output-container", "children"),
    Input("non-linear-slider-updatemode", "value"),
) do value
    transformed_value = [transform_value(v) for v in value]
    return "Linear Value: $value | Log Value: [$(transformed_value[1]), $(transformed_value[2]) ]"
end

run_server(app, "0.0.0.0", debug=true)
