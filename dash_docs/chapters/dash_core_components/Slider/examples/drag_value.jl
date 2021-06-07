using Dash, DashHtmlComponents, DashCoreComponents


app = dash()


app.layout = html_div() do
    dcc_slider(id="slider-drag",),
    html_div(id="slider-dragmode-output-container")
end

callback!(
    app,
    Output("slider-dragmode-output-container", "children"),
    Input("slider-drag", "drag_value"),
    Input("slider-drag", "value"),
) do drag_value, value
    return "drag_value : $drag_value | Value: $(value)"
end

run_server(app, "0.0.0.0", debug=true)
